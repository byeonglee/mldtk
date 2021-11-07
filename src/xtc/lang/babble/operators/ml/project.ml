open Printf;;

module Project1_out = struct
  type project1_out = {
    myval : int;
    }
end;;

module History = struct
  type history = {
    low : int;
    ticker : string;
    }
end;;

let project1 tau inserts deletes port =
  assert (port = 0);
  (tau, List.map (function (x:History.history) -> {Project1_out.myval = x.History.low + 1}) inserts, List.map (function (x:History.history) -> {Project1_out.myval = x.History.low + 1}) deletes)

let ocaml_wrap_project1 buffer port =
  let ((tau:int), inserts, deletes) =
    Marshal.from_string buffer 0 in
    Marshal.to_string (project1 tau inserts deletes port) [Marshal.No_sharing]


