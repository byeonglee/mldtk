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



let ocaml_wrap_output ptr port data = 
()
(*
  Printf.printf "sending to %d\n" port;
  print_range_tuple data
*)

let range_port0_buffer :(int * Range_in.range_in list * Range_in.range_in list) Queue.t ref =
  ref (Queue.create ());;

let range ptr port0_tup port =
  let get_inserts (_, inserts, _) =
    inserts and get_tau (tau, _, _) =
    tau in
    let delta =
      1 in
      let (in_tau, in_inserts, in_deletes) =
        port0_tup in
        (Queue.add port0_tup !range_port0_buffer);
        let out_of_range =
          (Queue.create ()) in
          while (in_tau -(get_tau (Queue.peek !range_port0_buffer)) >= delta)
          do Queue.add (get_inserts (Queue.pop !range_port0_buffer)) out_of_range
          done ;
          if ((Queue.length out_of_range) > 0)
          then let out_deletes =
            Queue.fold (fun lhs rhs -> lhs@rhs) [] out_of_range in
            let out =
              (in_tau, in_inserts, out_deletes) in
              ocaml_wrap_output ptr 0 out


let ocaml_wrap_range1 ptr buffer port = 
  assert (port = 0);
  let tup = Marshal.from_string buffer 0 in
    Marshal.to_string (range ptr tup port) [Marshal.No_sharing] ;;         
    

(********* test code **************)


let _ =  
  let size = 1000000 in
  let t1 = Sys.time() in 
    for i=1 to size do
      let data_item1 = (i, [{Range_in.low = i; Range_in.ticker="IBM"} ], [ {Range_in.low = i; Range_in.ticker="IBM"} ] ) in
        ( ocaml_wrap_range1 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) 0) ;
    done;
    let t2 = Sys.time() in 
      Printf.printf "completed %d tuples in %f seconds\n" size (t2 -. t1)

