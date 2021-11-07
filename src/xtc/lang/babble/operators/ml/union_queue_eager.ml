open Printf;;


module Logs = struct
  type logs = {
    origin : string;
    target : string;
    }
end;;

(**************** test code helper *********************)


let print_union_data_item tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{low=%s;ticker=%s}" x.Logs.origin x.Logs.target ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{low=%s;ticker=%s}" x.Logs.origin x.Logs.target ) deletes; 
    Printf.printf "])\n";;

(**************** end test code helper *********************)

let ocaml_wrap_output ptr port data = 
  Printf.printf "Tetris!\n";
  Printf.printf "sending to %d\n" port;
  print_union_data_item data



let simplemerge_logs_array_size = ref 8
let simplemerge_logs_min_time = ref 9
let parallelism = ref 2

let simplemerge_logs_state : (int * (int * Logs.logs list * Logs.logs list)) array ref =
  let n = ! simplemerge_logs_array_size in
  ref ( Array.init n  (fun x -> (0, (0, [], [])))) ;;

let simplemerge_logs_resize array = 
   simplemerge_logs_array_size := ! simplemerge_logs_array_size * 2;
  let bigger_array = (Array.init ! simplemerge_logs_array_size (fun x -> (0, (0, [], [])))) in
    Array.iteri (fun i elem -> 
                   let (_, (time, _, _)) = elem in
                     (Array.set bigger_array (time mod ! simplemerge_logs_array_size) elem )) array;
    simplemerge_logs_state := bigger_array  
        

let simplemerge_logs ptr data_item port =  
  let (tau, inserts, deletes) = data_item in
    if (tau < !simplemerge_logs_min_time) then simplemerge_logs_min_time := tau;
    if (tau - !simplemerge_logs_min_time >= ! simplemerge_logs_array_size) then 
        (simplemerge_logs_resize !simplemerge_logs_state) ;
    let (count, (time, old_inserts, old_deletes)) = 
      (Array.get !simplemerge_logs_state (tau mod ! simplemerge_logs_array_size)) in
    let inserts_ref = ref old_inserts
    and deletes_ref = ref old_deletes in
      List.iter (fun i -> inserts_ref := i::!inserts_ref) inserts; 
      List.iter (fun d -> deletes_ref := d::!deletes_ref) deletes;
      let di = (count+1, (tau, !inserts_ref, !deletes_ref)) in
        if (!parallelism = count+1) then
          begin
            if (tau = !simplemerge_logs_min_time) then incr simplemerge_logs_min_time; 
            (Array.set !simplemerge_logs_state (tau mod ! simplemerge_logs_array_size) (0, (0, [], []) ) );
            (ocaml_wrap_output ptr 0  (tau, !inserts_ref, !deletes_ref) )
          end
        else
          (Array.set !simplemerge_logs_state (tau mod ! simplemerge_logs_array_size) di)
            
                  
let ocaml_wrap_union1 ptr buffer port = 
  let data_item = Marshal.from_string buffer 0 in        
    simplemerge_logs ptr data_item port;;


(**************** test code helper *********************)

(*
let _ =  
  let size = 1000000 and ports = 15 in
  let t1 = Sys.time() in     
    for i=1 to size do
        for j=0 to ports do
        let data_item1 = (i, [{Logs.origin = (Printf.sprintf "%d" i); Logs.target = (Printf.sprintf "%d" i)} ], 
                          [ {Logs.origin = (Printf.sprintf "%d" i); Logs.target = (Printf.sprintf "%d" i)} ] ) in
          (ocaml_wrap_union1 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) j) ;
      done;
    done;
    let t2 = Sys.time() in 
      Printf.printf "completed %d tuples in %f seconds\n" size (t2 -. t1)
      *)

let _ =  
  let size = 10 and ports = !parallelism-1 in
  let t1 = Sys.time() in 
    for j=0 to ports do
      for i=1 to size do
        let data_item1 = (i, [{Logs.origin = "1"; Logs.target = "0"} ], [ {Logs.origin = "1"; Logs.target = "0"} ] ) in
          (ocaml_wrap_union1 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) j) ;
      done;
    done;
    let t2 = Sys.time() in 
      Printf.printf "completed %d tuples in %f seconds\n" size (t2 -. t1)
