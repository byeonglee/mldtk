
let istream0 tau inserts deletes port =
  assert (port = 0);
  (tau, inserts, [])

let ocaml_wrap_istream0 buffer port =
  let ((tau:int), inserts, deletes) =
    Marshal.from_string buffer 0 in
    Marshal.to_string (istream0 tau inserts deletes port) [Marshal.No_sharing]


