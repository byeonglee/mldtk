(* 
 * You can compile an entire .ml file with C-c C-b or a
 * single function with C-c C-e. 
 *)

(*
 * CQL source:
 *
 * r1 : { i : int; j : int, k1 : int, k2 : string } relation;
 * r2 : { c : int; j : int, k1 : int, k2 : string } relation
 *  = select Count(i) as c, Avg(j) from r1;
 * 
 * SRA:
 * 
 * r1 : { i : int; j : int, k : int } relation;
 * r2 : { c : int; j : int, k : int } relation
 * = aggregate[k1, k2; Count(i) as c, Avg(j) as j](r1);
 * 
 * Example operator firing:
 * 
 * State: map from keys k1, k2 to
 *     current Count(i)
 * and numerator and denominator for current Avg(j)
 * Insert { i=3, j=4, k1=5, k2="IBM" }
 * Assume currently,
 *  state(k1=5, k2="IBM") is (count(i)=3, numerator=10, denominator=3)
 *  update the state to      (count(i)=4, numerator=14, denominator=4)
 * Delete { i=9, j=8, k1=5, k2="IBM" }
 * Assume currently,
 *  state(k1=5, k2="IBM") is (count(i)=4, numerator=14, denominator=4)
 *  update the state to      (count(i)=3, numerator=5,  denominator=3)
 * 
 * Needed aggregator functions: AVG, COUNT, SUM
 *)


(* look up the current result, send a deletion for that, and an insertion for the new result *)
(* What is deleted if it is the first time? 0 for count, sum. For AVG send 1 or infinity *)

(* Also, remove duplicates *)


open Printf;;

module Agg_in = struct
  type agg_in = {
    i : int;
    j : int;
    k1 : int;
    k2 : string;
    }
end;;

module Agg_out = struct
  type agg_out = {
    c : int;
    j : int;
    k1 : int;
    k2 : string;
  }
end;;


(****************** debug function ************************)

let print_agg_in_tuple tuple =
  let (tau, inserts, deletes) = tuple in
    Printf.printf "(%d, [" tau;
    List.iter (function (x) -> Printf.printf "{i=%d;j=%d;k1=%d;k2=%s}" x.Agg_in.i x.Agg_in.j x.Agg_in.k1 x.Agg_in.k2 ) inserts;
    Printf.printf "],[";
    List.iter (function (x) -> Printf.printf "{i=%d;j=%d;k1=%d;k2=%s}" x.Agg_in.i x.Agg_in.j x.Agg_in.k1 x.Agg_in.k2 ) deletes;
    Printf.printf "])\n";;


let print_agg_out_tuple tuple =
  let (tau, inserts, deletes) = tuple in
    Printf.printf "(%d, [" tau;
    List.iter (function (x) -> Printf.printf "{c=%d;j=%d;k1=%d;k2=%s}" x.Agg_out.c x.Agg_out.j x.Agg_out.k1 x.Agg_out.k2 ) inserts;
    Printf.printf "],[";
    List.iter (function (x) -> Printf.printf "{c=%d;j=%d;k1=%d;k2=%s}" x.Agg_out.c x.Agg_out.j x.Agg_out.k1 x.Agg_out.k2 ) deletes;
    Printf.printf "])\n";;



let print_agg_state = 
  (fun h -> Hashtbl.iter (fun key value -> 
     let (k1, k2) = key and
         (v1, v2, v3) = value in
       Printf.printf "(%d * %s) ->  (%d * %d * %d)\n" k1 k2 v1 v2 v3 ) h);;

(****************** debug function ************************)


let agg_buffer : (int * string, int * int * int) Hashtbl.t ref = ref (Hashtbl.create 1);; 

let aggregate port0_tup =
  print_agg_in_tuple port0_tup;
  let incr x = x + 1 and
      decr x = x - 1 and
      sum x y = x + y and 
      subtab x y = x - y and 
      avg x y = x / y in
  let (tau, inserts, deletes) = port0_tup in 
  let compute_inserts =
    (function (item)  ->
       let key = (item.Agg_in.k1, item.Agg_in.k2) in
       let newValue = if Hashtbl.mem !agg_buffer key then
         let (v1, v2, v3) = Hashtbl.find !agg_buffer key in
           (incr v1, 
            sum v2 item.Agg_in.j, 
            incr v3)
       else
         (1, item.Agg_in.j, 1)
       in
         Hashtbl.replace !agg_buffer key newValue;
         let (v1, v2, v3) = newValue in 
           {Agg_out.k1=item.Agg_in.k1; Agg_out.k2=item.Agg_in.k2; Agg_out.c=v1; Agg_out.j=(avg v2 v3); }
    ) and
      compute_deletes =
    (function (item)  ->
       let key = (item.Agg_in.k1, item.Agg_in.k2) in
       let newValue = if Hashtbl.mem !agg_buffer key then
         let (v1, v2, v3) = Hashtbl.find !agg_buffer key in
           (decr v1, 
            sub v2 item.Agg_in.j, 
            decr v3)
       else
         (-1, -item.Agg_in.j, -1)
       in
         Hashtbl.replace !agg_buffer key newValue;
         let (v1, v2, v3) = newValue in 
           {Agg_out.k1=item.Agg_in.k1; Agg_out.k2=item.Agg_in.k2; Agg_out.c=v1; Agg_out.j=(avg v2 v3); }
    )
  in
  let all_inserts = List.map compute_inserts inserts and
      all_deletes = List.map compute_deletes deletes in
  let out = (tau, all_inserts, all_deletes) in
    Printf.printf "emitting: \n";
    print_agg_out_tuple out;
    out;;



let ocaml_wrap_aggregate buffer port =
  assert (port = 0);
  let tup = Marshal.from_string buffer 0 in
    Marshal.to_string (aggregate tup) [Marshal.No_sharing] ;;


(****************** test drive function ************************)

(*Insert { i=3, j=4, k1=5, k2="IBM" } *)

let data_item1 : (int * Agg_in.agg_in list * Agg_in.agg_in list) = (1, [{Agg_in.i=3; Agg_in.j=4; Agg_in.k1=5; Agg_in.k2="IBM"}], []) ;;
let data_item2 : (int * Agg_in.agg_in list * Agg_in.agg_in list) = (1, [], [{Agg_in.i=9; Agg_in.j=8; Agg_in.k1=5; Agg_in.k2="IBM"}]) ;;
  
let _ = 
   Hashtbl.replace !agg_buffer (5,"IBM") (3,10,3);
  print_agg_state !agg_buffer;
  Printf.printf "----------------------- \n";
  let _ = (ocaml_wrap_aggregate (Marshal.to_string data_item1 [Marshal.No_sharing]) 0) in
    print_agg_state !agg_buffer;
    Printf.printf "----------------------- \n";
    let _ = (ocaml_wrap_aggregate (Marshal.to_string data_item2 [Marshal.No_sharing]) 0) in
      print_agg_state !agg_buffer;
      Printf.printf "----------------------- \n";
;;

