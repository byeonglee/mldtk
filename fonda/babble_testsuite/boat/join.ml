(* 
 * You can compile an entire .ml file with C-c C-b or a
 * single function with C-c C-e. 
 *)

(* More appropriate to use records than ML tuples *)
type quote = {
  ticker : string;
  price : int;
};;

module JoinOp = struct
  let fire buffer port vars =
    let ((tau:int), inserts, deletes) = Marshal.from_string buffer 0 
    and ((oldTau:int), oldInserts, oldDeletes) = Marshal.from_string vars 0 in
    let inner_loop accum list1 y =
      List.append (List.filter (function (x:quote) -> x.ticker = y.ticker) list1) accum in
    let rec outer_loop accum list2 = function
        h::t -> outer_loop (inner_loop accum list2 h) list2 t
      | [] -> accum in
      assert (port = 1);
      (tau, (outer_loop [] oldInserts inserts), (outer_loop [] oldDeletes deletes))
end;;

let testJoin =
  let dataItem = (1, [{ticker = "IBM"; price = 2}; {ticker = "ABC"; price = 35}], [{ticker = "XYZ"; price = 35}] ) 
  and history = (1, [{ticker = "IBM"; price = 2}; {ticker = "ABC"; price = 35}], [{ticker = "XYZ"; price = 35}] )  
  in let buffer = Marshal.to_string dataItem [Marshal.No_sharing]
     and vars = Marshal.to_string history [Marshal.No_sharing]
  in JoinOp.fire buffer 1 vars;;
