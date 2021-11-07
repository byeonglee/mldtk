open Printf;;

module Range_in = struct
  type range_in = {
    low : int;
    ticker : string;
    }
end;;

module Range_out = struct
  type range_out = {
    low : int;
    ticker : string;
    }
end;;

exception No_range;;


(**************** test code helper *********************)

let print_range_tuple tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Range_in.low x.Range_in.ticker ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Range_in.low x.Range_in.ticker ) deletes; 
    Printf.printf "])\n";;


let print_range_window list =
  Printf.printf "[\n"; 
  List.iter (function (x) -> print_range_tuple x) list;
  Printf.printf "]\n";; 

(**************** end test code helper *********************)


(*let port0_window : (int * Range_in.range_in list * Range_in.range_in list) list ref  = ref [] ;;*)

let port0_window = ref
[
(1, [{Range_in.low=101; Range_in.ticker="IBM"}], [{Range_in.low=101; Range_in.ticker="XYZ"}]);
(1, [{Range_in.low=111; Range_in.ticker="IBM"}], [{Range_in.low=111; Range_in.ticker="XYZ"}]);
(2, [{Range_in.low=102; Range_in.ticker="IBM"}], [{Range_in.low=102; Range_in.ticker="XYZ"}]);
(3, [{Range_in.low=103; Range_in.ticker="IBM"}], [{Range_in.low=103; Range_in.ticker="XYZ"}]);
(4, [{Range_in.low=104; Range_in.ticker="IBM"}], [{Range_in.low=104; Range_in.ticker="XYZ"}])
] ;;

let get_tau (tau, _, _) = tau;;
let get_inserts (_, inserts, _) = inserts;;

let range port0_tup =
  let delta = 4 in 
  let (in_tau, in_inserts, in_deletes) = port0_tup in
  let _ = 
    try 
      port0_window := !port0_window@[port0_tup] ;
    with x -> raise No_range
  in
  let rec get_all_inserts accum = function 
    |  h::t -> (get_all_inserts (accum@(get_inserts h)) t)
    | [] -> accum in     
  let out_of_range_tuples = List.filter (function (x) -> in_tau - (get_tau x) >= delta ) !port0_window in    
  let out_deletes = get_all_inserts [] out_of_range_tuples in
    List.iter (function (x) ->  port0_window := (List.filter (function (y) -> y <> x) !port0_window);) out_of_range_tuples;
    let out = 
      (in_tau, in_inserts, out_deletes) in
      print_range_tuple out ;
      Printf.printf "-----------\n" ;
      print_range_window !port0_window ;
      out ;;

let ocaml_wrap_range1 buffer port = 
  assert (port = 0);
  let tup = Marshal.from_string buffer 0 in
    Marshal.to_string (range tup) [Marshal.No_sharing] ;;         
    

(********* test code **************)

let data_item = (5, [{Range_in.low=105; Range_in.ticker="IBM"}], [{Range_in.low=105; Range_in.ticker="XYZ"}]) ;;

let _ =
  let buffer = Marshal.to_string data_item [Marshal.No_sharing] in
    ocaml_wrap_range1 buffer 0;;
