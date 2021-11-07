
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

module Rows_in = struct
  type rows_in = {
    low : int;
    ticker : string;
    }
end;;

module Rows_out = struct
  type rows_out = {
    low : int;
    ticker : string;
    }
end;;

exception No_rows;;


(**************** test code helper *********************)

let print_rows_tuple tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Rows_in.low x.Rows_in.ticker ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Rows_in.low x.Rows_in.ticker ) deletes; 
    Printf.printf "])\n";;


let print_rows_window list =
  Printf.printf "[\n"; 
  List.iter (function (x) -> print_rows_tuple x) list;
  Printf.printf "]\n";; 

(**************** end test code helper *********************)


let port0_window : (int * Rows_in.rows_in list * Rows_in.rows_in list) list ref  = ref [] ;;

let rows port0_tup =
  let get_inserts (_,inserts,_) = inserts in
  let window_size = 2 in 
  let (in_tau, in_inserts, in_deletes) = port0_tup in
  let _ = 
    try 
      port0_window := !port0_window@[port0_tup] ;
    with x -> raise No_rows
  in
    if (List.length !port0_window) <= window_size then
      (in_tau, in_inserts, [])
    else 
      let port0_head = List.hd !port0_window in
        try 
          port0_window := List.tl !port0_window ;
          (in_tau, in_inserts, get_inserts port0_head)
        with x -> raise No_rows;;
     

let ocaml_wrap_rows1 buffer port = 
  assert (port = 0);
  let tup = Marshal.from_string buffer 0 in
    Marshal.to_string (rows tup) [Marshal.No_sharing] ;;         
    

(********* test code **************)

let data_item num 
    = (num, [{Rows_in.low=num; Rows_in.ticker="IBM"}], [{Rows_in.low=num; Rows_in.ticker="XYZ"}]) ;;

let _ =
  let buffer = Marshal.to_string (data_item 1) [Marshal.No_sharing] in ocaml_wrap_rows1 buffer 0;
    print_rows_window !port0_window;
    let buffer = Marshal.to_string (data_item 2) [Marshal.No_sharing] in ocaml_wrap_rows1 buffer 0;
      print_rows_window !port0_window;
      let buffer = Marshal.to_string (data_item 3) [Marshal.No_sharing] in ocaml_wrap_rows1 buffer 0;
        print_rows_window !port0_window;
        let buffer = Marshal.to_string (data_item 4) [Marshal.No_sharing] in ocaml_wrap_rows1 buffer 0;
          print_rows_window !port0_window;;
