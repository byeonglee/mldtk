
let dstream0 tau inserts deletes port =
  assert (port = 0);
  (tau, [], deletes)

let ocaml_wrap_dstream0 buffer port =
  let ((tau:int), inserts, deletes) =
    Marshal.from_string buffer 0 in
    Marshal.to_string (dstream0 tau inserts deletes port) [Marshal.No_sharing]


