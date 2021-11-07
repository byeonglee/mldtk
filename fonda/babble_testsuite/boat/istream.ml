

type quote = {
  ticker : string;
  price : int;
};;

module IStreamOp = struct
  let fire buffer port =
    let ((tau:int), inserts, deletes) = Marshal.from_string buffer 0 in
      assert (port = 1);
      (tau, inserts, [])
end;;

let testIStream =
  let dataItem = (1, [{ticker = "IBM"; price = 2}], [{ticker = "XYZ"; price = 35}] ) in
  let buffer = Marshal.to_string dataItem [Marshal.No_sharing] 
  in IStreamOp.fire buffer 1;;

 
