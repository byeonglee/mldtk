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

let simplemerge_logs ptr tup port =
  let get_tau (tau, _, _) = tau in
  let tau = get_tau (tup) in
    (Queue.add tup  (Array.get !simplemerge_logs_state port) );
    let tetris = ref true in
      Array.iter (fun x -> 
                    if (0 = (Queue.length x)) then
                      tetris := false
                    else 
                      if (tau != (get_tau (Queue.peek x))) then
                        tetris := false                        
                      ) !simplemerge_logs_state ;  
      if (!tetris) then
        let heads = Array.to_list (
          Array.map (fun x -> (Queue.pop x)) !simplemerge_logs_state)
        in 
        let unioned = 
          List.fold_left (fun lhs rhs -> 
                            let (t1, i1, d1) = lhs 
                            and (t2, i2, d2) = rhs in
                              (t1, i1@i2, d1@d2)) (get_tau tup, [], []) heads in     
          (ocaml_wrap_output ptr 0 unioned)
      

let ocaml_wrap_union1 ptr buffer port = 
  let tup = Marshal.from_string buffer 0 in        
    simplemerge_logs ptr tup port;;


(**************** test code helper *********************)

let _ =  
  let size = 100000000 and ports = 15 in
  let t1 = Sys.time() in 
    for i=1 to size do
      for j=0 to ports do
        let data_item1 = (i, [{Logs.origin = "1"; Logs.target = "0"} ], [ {Logs.origin = "1"; Logs.target = "0"} ] ) in
          (ocaml_wrap_union1 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) j) ;
      done;
    done;
    let t2 = Sys.time() in 
      Printf.printf "completed %d tuples in %f seconds\n" size (t2 -. t1)

