open Printf;;

module Select1_out = struct
  type select1_out = {
    low : int;
    ticker : string;
    }
end;;

module History = struct
  type history = {
    low : int;
    ticker : string;
    }
end;;

let select1 tau inserts deletes port =
  assert (port = 0);
  (tau, 
   List.filter (function (x:History.history) -> x.History.low < 35 ) inserts, 
   List.filter (function (x:History.history) -> x.History.low < 35 ) deletes) 

let ocaml_wrap_select1 buffer port =
  let ((tau:int), inserts, deletes) =
    Marshal.from_string buffer 0 in
    Marshal.to_string (select1 tau inserts deletes port) [Marshal.No_sharing]


