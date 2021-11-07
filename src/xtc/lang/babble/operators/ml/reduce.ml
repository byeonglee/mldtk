(* 
 * You can compile an entire .ml file with C-c C-b or a
 * single function with C-c C-e. 
 *)

open Printf;;

module QueryTargets = struct
  type queryTargets = {
    id:int;
    url:string;
    count:int;
    }
end;;

module QueryOrigins = struct
  type queryOrigins = {
    id:int;
    url:string;
    count:int;
    }
end;;

(*
Reduce = fn(newData, reducerState) =>
 let (tableId, key, value) = newData;
     table = reducerState[tableId]; /* 0 == queryOrigins, 1 == queryTargets */
     oldEntry = if key in table then table[key] else 0; /* Sum starts at 0 */
  in table[key] := oldEntry + value;  /* Sum works with plus */

*)

let query_origins_table  : (string, int) Hashtbl.t ref = ref (Hashtbl.create 1);; 
let foo_table  : (string, int) Hashtbl.t ref = ref (Hashtbl.create 1);; 
let query_targets_table  : (int, float * int) Hashtbl.t ref = ref (Hashtbl.create 1);; 


let print_query_origins_table =
  (fun h -> Hashtbl.iter (fun key value ->
     let (k) = key and
         (v) = value in
       Printf.printf "(%s) ->  (%d)\n" k v ) h);;


type reducerTypes = 
  | QueryOrigins of string * int 
  | Foo of string * int 
  | QueryTargets of int * float ;;

let reduce0 ptr data =
  match data with 
    | QueryOrigins(key, value) ->
        Printf.printf "Query origins\n";
        let old_sum = 
          if Hashtbl.mem !query_origins_table key then
            Hashtbl.find !query_origins_table key 
          else 0
        in 
          Hashtbl.replace !query_origins_table key (old_sum + value)
    | Foo(key, value) ->
        Printf.printf "foo\n";
        let old_sum = 
          if Hashtbl.mem !foo_table key then
            Hashtbl.find !foo_table key 
          else 0
        in 
          Hashtbl.replace !foo_table key (old_sum + value)
    | QueryTargets(key, value) ->        
        Printf.printf "Query targets\n";
        let (old_sum, old_count) = 
          if Hashtbl.mem !query_targets_table key then
            Hashtbl.find !query_targets_table key 
          else (0.0, 0)
        in 
          Hashtbl.replace !query_targets_table key (old_sum +. value,  1) ;;

let ocaml_wrap_reduce0 ptr buffer port =    
  let data = Marshal.from_string buffer 0 in
    (reduce0 ptr data);;


let data1 = QueryTargets (1, 3.0);;
let data2 = QueryOrigins ("IBM", 3);;
let data3 = Foo ("IBM", 3);;

let _ =
  ocaml_wrap_reduce0 0 (Marshal.to_string data1 [Marshal.No_sharing]) 0; 
  ocaml_wrap_reduce0 0 (Marshal.to_string data2 [Marshal.No_sharing]) 0; 
  ocaml_wrap_reduce0 0 (Marshal.to_string data3 [Marshal.No_sharing]) 0
