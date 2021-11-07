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

let port0_window : (int * Range_in.range_in list * Range_in.range_in list) list ref  = ref [] ;;


exception No_range;;

let range port0_tup =
  let get_tau (tau, _, _) = tau and
  get_inserts (_, inserts, _) = inserts in
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
      (in_tau, in_inserts, out_deletes) ;;

let ocaml_wrap_range1 buffer port = 
  assert (port = 0);
  let tup = Marshal.from_string buffer 0 in
    Marshal.to_string (range tup) [Marshal.No_sharing] ;;         
    
