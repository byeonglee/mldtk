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
()
(*
  Printf.printf "Tetris!\n";
  Printf.printf "sending to %d\n" port;
  print_union_data_item data
*)

let simplemerge_logs_state : (int * Logs.logs list * Logs.logs list) Queue.t array ref =
  let n = 16 in
  ref ( Array.init n  (fun x -> Queue.create ())) ;;

let simplemerge_logs ptr data_item port =
  let get_tau (tau, _, _) = tau in
  let (tau,_,_) = data_item in
    (Queue.add data_item (Array.get !simplemerge_logs_state port) );
    let rec check_time array index =
      if (index >= Array.length array) then true
      else if ((0 = (Queue.length (Array.get array index)))) then false
      else if (tau != (get_tau (Queue.peek (Array.get array index)))) then false
      else check_time array (index+1) in
      if (check_time !simplemerge_logs_state 0) then
        let out_inserts_list = ref []
        and out_deletes_list = ref [] in
        let f2 = 
          (fun queue ->  
             let di = (Queue.pop queue) in
             let (_, inserts, deletes) = di in
               List.iter (fun i -> out_inserts_list := i::!out_inserts_list) inserts; 
               List.iter (fun d -> out_deletes_list := d::!out_deletes_list) deletes) in
          (Array.iter f2 !simplemerge_logs_state);
          (ocaml_wrap_output ptr 0 (tau, !out_inserts_list, !out_deletes_list))
            
let ocaml_wrap_union1 ptr buffer port = 
  let data_item = Marshal.from_string buffer 0 in        
    simplemerge_logs ptr data_item port;;


(**************** test code helper *********************)


let _ =  
  let size = 1000000 and ports = 15 in
  let t1 = Sys.time() in 
    for i=1 to size do
      for j=0 to ports do
        let data_item1 = (i, [{Logs.origin = "1"; Logs.target = "0"} ], [ {Logs.origin = "1"; Logs.target = "0"} ] ) in
          (ocaml_wrap_union1 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) j) ;
      done;
    done;
    let t2 = Sys.time() in 
      Printf.printf "completed %d tuples in %f seconds\n" size (t2 -. t1)
