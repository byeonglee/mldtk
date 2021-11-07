open Printf;;

module History = struct
  type history = {
    low : int;
    ticker : string;
    }
end;;

module Quote = struct
  type quote = {
    ask : int;
    ticker : string;
    }
end;;

module Bargain = struct
  type bargain = {
    ask : int;
    low : int;
    ticker : string;
    }
end;;


(**************** test code helper *********************)

let print_history_data_item tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.History.low x.History.ticker ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.History.low x.History.ticker  ) deletes; 
    Printf.printf "])\n";;


let print_quote_data_item tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{ask=%d;ticker=%s}" x.Quote.ask x.Quote.ticker ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{ask=%d;ticker=%s}" x.Quote.ask x.Quote.ticker   ) deletes; 
    Printf.printf "])\n";;


let print_bargain_data_item tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{ask=%d;low=%d;ticker=%s}" x.Bargain.ask x.Bargain.low x.Bargain.ticker ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{ask=%d;low=%d;ticker=%s}" x.Bargain.ask x.Bargain.low x.Bargain.ticker ) deletes; 
    Printf.printf "])\n";;

(**************** end test code helper *********************)



let ocaml_wrap_output ptr port buffer =
  Printf.printf("ocaml_wrap_output\n");
  print_bargain_data_item buffer;;


let get_tau (tau, _, _) = tau;;
let get_inserts (_, inserts, _) = inserts;;
let get_deletes (_, _,deletes) = deletes;;

exception No_join;;


type joinTypes =
  | Port1 of (int * History.history list * History.history list)
  | Port0 of (int * Quote.quote list * Quote.quote list) ;;

let port0_window : (int * Quote.quote list * Quote.quote list) Queue.t ref = ref (Queue.create ()) ;;
let port1_window : (int * History.history list * History.history list) Queue.t ref = ref (Queue.create ()) ;;

let join ptr data port  =
  let get_tau (tau, _, _) = tau in
    (match data with 
      | Port0(tup) -> Queue.add tup !port0_window 
      | Port1(tup) -> Queue.add tup !port1_window ) ;
          if (((Queue.length !port0_window) > 0) && ((Queue.length !port0_window) > 0)) then
          let port0_tup = Queue.peek !port0_window
          and port1_tup = Queue.peek !port1_window 
          in
          let inner accum port1_inserts tup4 = 
            List.append 
              (List.map ( function (tup6) -> {Bargain.ticker = tup4.Quote.ticker; Bargain.ask=tup4.Quote.ask; Bargain.low=tup6.History.low }) 
                 (List.filter (function (tup5) -> tup5.History.ticker = tup4.Quote.ticker) port1_inserts)) accum in
          let rec outer accum port1_inserts = function
              h::t ->  outer (inner accum port1_inserts h) port1_inserts t
            | [] -> accum in                    
            if (get_tau port0_tup = get_tau port1_tup)
            then              
              let _ = Queue.pop !port0_window 
              and _ = Queue.pop !port1_window in
              let (port0_tau, port0_inserts, port0_deletes) = port0_tup and
                  (port1_tau, port1_inserts, port1_deletes) = port1_tup in
                (ocaml_wrap_output 0 0
                   ( port0_tau, outer [] port1_inserts port0_inserts, outer [] port1_deletes port0_deletes ))                                


let ocaml_wrap_join1 ptr buffer port =      
  let tup = Marshal.from_string buffer 0 in
    if port = 0 then
      join ptr (Port0 tup) port 
    else
      join ptr (Port1 tup) port 

(**************** test code helper *********************)

let data_item0 = (1, [{Quote.ask = 500; Quote.ticker = "IBM"} ], [{Quote.ask = 500; Quote.ticker = "XYZ"} ] );;
let data_item1 = (1, [{History.low = 500; History.ticker = "IBM"} ], [{History.low = 500; History.ticker = "IBM"} ] );;
let data_item2 = (2, [{Quote.ask = 500; Quote.ticker = "IBM"} ], [{Quote.ask = 500; Quote.ticker = "XYZ"} ] );;
let data_item3 = (2, [{History.low = 500; History.ticker = "IBM"} ], [{History.low = 500; History.ticker = "IBM"} ] );;



let _ =
  try
    (ocaml_wrap_join1 0 (Marshal.to_string data_item0 [Marshal.No_sharing]) 0); 
    (ocaml_wrap_join1 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) 1);
    (ocaml_wrap_join1 0 (Marshal.to_string data_item2 [Marshal.No_sharing]) 0);
    (ocaml_wrap_join1 0 (Marshal.to_string data_item3 [Marshal.No_sharing]) 1)
  with x -> ();

