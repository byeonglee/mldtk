
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

module Partition_in = struct
  type partition_in = {
    low : int;
    ticker : string;
    }
end;;

module Partition_out = struct
  type partition_out = {
    low : int;
    ticker : string;
    }
end;;

exception No_partition;;


(**************** test code helper *********************)

let print_partition_tuple tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Partition_in.low x.Partition_in.ticker ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Partition_in.low x.Partition_in.ticker ) deletes; 
    Printf.printf "])\n";;


let print_partition_window list =
  Printf.printf "[\n"; 
  List.iter (function (x) -> print_partition_tuple x) list;
  Printf.printf "]\n";; 



let print_partition_state = 
  (fun h -> Hashtbl.iter (fun key value -> 
     let k1 = key and
         list = value in
       Printf.printf " (%s) - > \n" k1 ;
       List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Partition_in.low x.Partition_in.ticker ) list;
       Printf.printf "\n" ; ) h);;


(**************** end test code helper *********************)

(* string -> partition in list *)

let port0_state : (string, Partition_in.partition_in list ) Hashtbl.t ref = ref (Hashtbl.create 1);; 

(* let port0_state : (string, (int * Partition_in.partition_in list * Partition_in.partition_in list) list ) Hashtbl.t ref = ref (Hashtbl.create 1);;  *)

let partition port0_tup =
  let window_size = 2 in
  let (tau, inserts, _) = port0_tup in 
  let add_to_state = 
    (function (item) ->       
       let key = item.Partition_in.ticker in
       let newValue = if Hashtbl.mem !port0_state key then
         (Hashtbl.find !port0_state key)@[item]
       else
         [item]
       in
       let (newList, deletes) = 
         if (List.length newValue) > window_size then           
           let remove_tup = List.hd newValue in
             ((List.tl newValue), [remove_tup])
         else
           (newValue, [])
       in
         Hashtbl.replace !port0_state key newList;
         deletes
    )    
  in
  let delete_list = List.map (add_to_state) inserts in
  let out = 
    (tau, inserts, (List.flatten delete_list)) in
    print_partition_tuple out;
    out;;
     

let ocaml_wrap_partition buffer port = 
  assert (port = 0);
  let tup = Marshal.from_string buffer 0 in
    Marshal.to_string (partition tup) [Marshal.No_sharing] ;;         
    

(********* test code **************)

let data_item num = (num, [{Partition_in.low=num; Partition_in.ticker="IBM"}; {Partition_in.low=num; Partition_in.ticker="XYZ"}; ], [{Partition_in.low=num; Partition_in.ticker="XYZ"}]) ;;

let _ = 
  Printf.printf "----------- start ---------- \n";
  print_partition_state !port0_state;
  Printf.printf "----------------------- \n";
  let _ = (ocaml_wrap_partition (Marshal.to_string (data_item 1) [Marshal.No_sharing]) 0) in
    print_partition_state !port0_state;
  Printf.printf "----------------------- \n";
  let _ = (ocaml_wrap_partition (Marshal.to_string (data_item 2) [Marshal.No_sharing]) 0) in
    print_partition_state !port0_state;
  Printf.printf "----------------------- \n";
  let _ = (ocaml_wrap_partition (Marshal.to_string (data_item 3) [Marshal.No_sharing]) 0) in
    print_partition_state !port0_state;
  Printf.printf "----------------------- \n";;
