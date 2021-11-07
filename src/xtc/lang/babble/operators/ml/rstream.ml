
let rstream0 tau inserts deletes port =
  assert (port = 0);
  (tau, inserts, deletes)

let ocaml_wrap_rstream0 buffer port =
  let ((tau:int), inserts, deletes) =
    Marshal.from_string buffer 0 in
    Marshal.to_string (rstream0 tau inserts deletes port) [Marshal.No_sharing]


