

type quote = {
  ticker : string;
  price : int;
};;

module ProjectionOp = struct
  let fire buffer port =
    let ((tau:int), inserts, deletes) = Marshal.from_string buffer 0 in
      assert (port = 1);
      (tau,
       List.map (function (x:quote) -> {ticker=x.ticker;price=x.price +1}) inserts,
       List.map (function (x:quote) -> {ticker=x.ticker;price=x.price +1}) deletes)
end;;

let testProjection =
  let dataItem = (1, [{ticker = "IBM"; price = 2}], [{ticker = "XYZ"; price = 35}] ) in
  let buffer = Marshal.to_string dataItem [Marshal.No_sharing] 
  in ProjectionOp.fire buffer 1;;

 
