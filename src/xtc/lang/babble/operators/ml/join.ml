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
    ticker : string;
    ask : int;
    low : int;
    }
end;;

let ocaml_wrap_output ptr port buffer =
  Printf.printf("ocaml_wrap_output\n");;

let get_tau (tau, _, _) = tau;;
let get_inserts (_, inserts, _) = inserts;;
let get_deletes (_, _,deletes) = deletes;;

exception No_join;;


type joinTypes =
  | Port1 of (int * History.history list * History.history list)
  | Port0 of (int * Quote.quote list * Quote.quote list) ;;


let port1_window : (int * History.history list * History.history list) list ref  = ref [] ;;
let port0_window : (int * Quote.quote list * Quote.quote list) list ref = ref [] ;;

(*
let join port0_tup port1_tup =
  Printf.printf "join\n";

  let inner accum port1_inserts tup4 = 
    List.append 
      (List.map ( function (tup6) -> {Bargain.ticker = tup4.Quote.ticker; Bargain.ask=tup4.Quote.ask; Bargain.low=tup6.History.low }) 
         (List.filter (function (tup5) -> tup5.History.ticker = tup4.Quote.ticker) port1_inserts)) accum in
  let rec outer accum port1_inserts = function
      h::t ->  outer (inner accum port1_inserts h) port1_inserts t
    | [] -> accum in        
  let (port0_tau, port0_inserts, port0_deletes) = port0_tup and
      (port1_tau, port1_inserts, port1_deletes) = port1_tup in
    (ocaml_wrap_output 0 0
    ( port0_tau, outer [] port1_inserts port0_inserts, outer [] port1_deletes port0_deletes ))
*)


let join data port  =
  Printf.printf "join\n";
  let get_tau (tau, _, _) = tau in
    match data with 
      | Port0(tup) -> Printf.printf "port0\n"; (try port0_window := !port0_window@[tup] with x -> ()) 
      | Port1(tup) -> Printf.printf "port1\n"; (try port1_window := !port1_window@[tup] with z -> ());
          try
            Printf.printf "try\n";
            let port0_tup = List.hd !port0_window
            and port1_tup = List.hd !port1_window 
            in
             let inner accum port1_inserts tup4 = 
              List.append 
                (List.map ( function (tup6) -> {Bargain.ticker = tup4.Quote.ticker; Bargain.ask=tup4.Quote.ask; Bargain.low=tup6.History.low }) 
                   (List.filter (function (tup5) -> tup5.History.ticker = tup4.Quote.ticker) port1_inserts)) accum in
              let rec outer accum port1_inserts = function
                  h::t ->  outer (inner accum port1_inserts h) port1_inserts t
                | [] -> accum in        

            Printf.printf "compare time\n";
              if (get_tau port0_tup = get_tau port1_tup)
              then
                try 
                  port0_window := List.tl !port0_window ; 
                  port1_window := List.tl !port1_window ;
                  Printf.printf "tails\n";
                  let (port0_tau, port0_inserts, port0_deletes) = port0_tup and
                      (port1_tau, port1_inserts, port1_deletes) = port1_tup in
                    (ocaml_wrap_output 0 0
                       ( port0_tau, outer [] port1_inserts port0_inserts, outer [] port1_deletes port0_deletes ))                                
                with e -> ()
          with x -> ();;

let ocaml_wrap_join1 buffer port =      
  let tup = Marshal.from_string buffer 0 in
    if port = 0 then
      join (Port0 tup) port 
    else
      join (Port1 tup) port 



(**************** test code helper *********************)

let data_item1 = (1,
                 [{History.low = 500; History.ticker = "IBM"} ],
                 [{History.low = 500; History.ticker = "IBM"} ] );;

let data_item0 = (1,
                 [{Quote.ask = 500; Quote.ticker = "IBM"} ],
                 [{Quote.ask = 500; Quote.ticker = "XYZ"} ] );;

let _ =
  try
    Printf.printf "try 1\n";
    (ocaml_wrap_join1 (Marshal.to_string data_item0 [Marshal.No_sharing]) 0); 
    Printf.printf "try 2\n";
    (ocaml_wrap_join1 (Marshal.to_string data_item1 [Marshal.No_sharing]) 1)
  with x -> ();

