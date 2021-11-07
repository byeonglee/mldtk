(* 
 * You can compile an entire .ml file with C-c C-b or a
 * single function with C-c C-e. 
 *)

open Printf;;

(* More appropriate to use records than ML tuples *)
type quote = {
  ticker : string;
  price : int;
};;

(* A sum aggregator that sums the price grouped by the ticker *)
module AggregateOp = struct
  let fire buffer port var =
    let ((tau:int), inserts, deletes) = Marshal.from_string buffer 0 
    and state = Marshal.from_string var 0 in
    let compute_aggregate = 
      (function tuple ->
         let newVal = if Hashtbl.mem state tuple.ticker 
         then                    
           ((fun x y -> x + y) tuple.price (Hashtbl.find state tuple.ticker))
         else
           tuple.price
         in                      
           Hashtbl.replace state tuple.ticker newVal;
           (tuple.ticker, newVal))
    in
      assert (port = 1);
      ( List.map compute_aggregate inserts, 
        List.map compute_aggregate deletes, 
        state)
end;;

let print_hash = fun h ->
  Hashtbl.iter (fun key value -> printf "%s is %d\n" key value) h;;

let testAggregate =
  let dataItem = (1, [{ticker = "IBM"; price = 2}; {ticker = "XYZ"; price = 35}], [] ) 
  and state = let m = Hashtbl.create 1 in Hashtbl.add m "IBM" 1; m 
  in let buffer = Marshal.to_string dataItem [Marshal.No_sharing] 
     and var = Marshal.to_string state [Marshal.No_sharing] in
  let (newInserts, newDeletes, newState) = AggregateOp.fire buffer 1 var in
    print_hash newState; newInserts ;;


