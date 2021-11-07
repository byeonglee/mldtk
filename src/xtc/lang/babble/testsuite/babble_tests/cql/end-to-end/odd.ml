open Printf;;

module History = struct
type history = {
  low : int;
  ticker : string;
}
end;;

let items =
[
   (1, [{History.low = 35; History.ticker = "IBM"}; {History.low = 35; History.ticker = "XYZ"} ], [{History.low = 35; History.ticker = "IBM"}]) ;
   (1, [{History.low = 35; History.ticker = "IBM"}; {History.low = 35; History.ticker = "XYZ"} ], [{History.low = 35; History.ticker = "IBM"}]) ;
   (1, [{History.low = 35; History.ticker = "IBM"}; {History.low = 35; History.ticker = "XYZ"} ], [{History.low = 35; History.ticker = "IBM"}]) ;
   (1, [{History.low = 35; History.ticker = "IBM"}; {History.low = 35; History.ticker = "XYZ"} ], [{History.low = 35; History.ticker = "IBM"}]) ;
   (1, [{History.low = 35; History.ticker = "IBM"}; {History.low = 35; History.ticker = "XYZ"} ], [{History.low = 35; History.ticker = "IBM"}]) 
] ;;

let _ = 
  let oc = open_out "/tmp/history.data" in
    List.iter (function (x) -> Marshal.to_channel oc x [Marshal.No_sharing]) items ;
    close_out oc;;

