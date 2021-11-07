open Printf;;

module Quotes = 
struct
  type quote = {ask:int; ticker:string}
end;;

module History = 
struct
  type history = {low:int; ticker:string}
end;;

let quote_items =
  [
    (1, [{Quotes.ask = 1; Quotes.ticker = "IBM"}; {Quotes.ask = 1; Quotes.ticker = "XYZ"} ], [{Quotes.ask = 1; Quotes.ticker = "IBM"}]) ;
    (2, [{Quotes.ask = 2; Quotes.ticker = "IBM"}; {Quotes.ask = 2; Quotes.ticker = "XYZ"} ], [{Quotes.ask = 2; Quotes.ticker = "IBM"}]) ;
    (3, [{Quotes.ask = 3; Quotes.ticker = "IBM"}; {Quotes.ask = 3; Quotes.ticker = "XYZ"} ], [{Quotes.ask = 3; Quotes.ticker = "IBM"}]) ;
    (4, [{Quotes.ask = 4; Quotes.ticker = "IBM"}; {Quotes.ask = 4; Quotes.ticker = "XYZ"} ], [{Quotes.ask = 4; Quotes.ticker = "IBM"}]) ;
    (5, [{Quotes.ask = 5; Quotes.ticker = "IBM"}; {Quotes.ask = 5; Quotes.ticker = "XYZ"} ], [{Quotes.ask = 5; Quotes.ticker = "IBM"}])
  ] ;;

let history_items =
  [
    (1, [{History.low = 10; History.ticker = "IBM"}; {History.low = 10; History.ticker = "XYZ"} ], [{History.low = 10; History.ticker = "IBM"}]) ;
    (2, [{History.low = 20; History.ticker = "IBM"}; {History.low = 20; History.ticker = "XYZ"} ], [{History.low = 20; History.ticker = "IBM"}]) ;
    (3, [{History.low = 30; History.ticker = "IBM"}; {History.low = 30; History.ticker = "XYZ"} ], [{History.low = 30; History.ticker = "IBM"}]) ;
    (4, [{History.low = 40; History.ticker = "IBM"}; {History.low = 40; History.ticker = "XYZ"} ], [{History.low = 40; History.ticker = "IBM"}]) ;
    (5, [{History.low = 50; History.ticker = "IBM"}; {History.low = 50; History.ticker = "XYZ"} ], [{History.low = 50; History.ticker = "IBM"}])
  ] ;;


let oc = open_out "/tmp/history.data" in
  List.iter (function (x) -> Marshal.to_channel oc x [Marshal.No_sharing]) history_items ;
  close_out oc;;

let oc = open_out "/tmp/quotes.data" in
  List.iter (function (x) -> Marshal.to_channel oc x [Marshal.No_sharing]) quote_items ;
  close_out oc;;

