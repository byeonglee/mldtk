
(*
 * - Partitioned row-based window operator:
 *  - state variable keeps map from partitioning key attributes
 *    to rest of tuples
 *  - for each input insert, add to front of appropriate sub-window, create
 *    output insert for the new tuple
 *  - the sub-windows can be fixed-size circular buffers, oldest is deleted
 *    and sent as output delete
 *  - remove insert/delete pairs that cancel each other out
 * @param inBuf
 * @param port
 * @param inVar
 * @return buffer
 *)


open Printf;;

module Now_in = struct
  type now_in = {
    low : int;
    ticker : string;
    }
end;;

module Now_out = struct
  type now_out = {
    low : int;
    ticker : string;
    }
end;;

exception No_now;;


(**************** test code helper *********************)

let print_now_tuple tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Now_in.low x.Now_in.ticker ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Now_in.low x.Now_in.ticker ) deletes; 
    Printf.printf "])\n";;


let print_now_window list =
  Printf.printf "[\n"; 
  List.iter (function (x) -> print_now_tuple x) list;
  Printf.printf "]\n";; 

(**************** end test code helper *********************)


let ocaml_wrap_output ptr port buffer =
  Printf.printf("ocaml_wrap_output\n");
  print_now_tuple buffer;;


let port0_window : (int * Now_in.now_in list * Now_in.now_in list) Queue.t ref = ref (Queue.create ()) ;;

let now ptr port0_tup port =
  Queue.add port0_tup !port0_window;
  let (in_tau, in_inserts, in_deletes) = port0_tup in
    if ((Queue.length !port0_window) = 1) then
      (ocaml_wrap_output ptr 0 (in_tau, in_inserts, []) ) 
    else
      let (old_tau, old_inserts, old_deletes) = Queue.pop !port0_window in
        (ocaml_wrap_output ptr 0 (in_tau, in_inserts, old_inserts) );;         


let ocaml_wrap_now1 ptr buffer port = 
  assert (port = 0);
  let tup = Marshal.from_string buffer 0 in
    (now ptr tup port) ;;    

(********* test code **************)

let data_item num 
    = (num, [{Now_in.low=num; Now_in.ticker="IBM"}], [{Now_in.low=num; Now_in.ticker="XYZ"}]) ;;

let _ =
  (ocaml_wrap_now1 0 ( Marshal.to_string (data_item 1) [Marshal.No_sharing]) 0);
  (ocaml_wrap_now1 0 ( Marshal.to_string (data_item 2) [Marshal.No_sharing]) 0);
  (ocaml_wrap_now1 0 ( Marshal.to_string (data_item 3) [Marshal.No_sharing]) 0);
  (ocaml_wrap_now1 0 ( Marshal.to_string (data_item 4) [Marshal.No_sharing]) 0)

