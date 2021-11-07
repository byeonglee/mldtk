open Printf;;

let submit ptr buffer port =
  Printf.printf "Submit called port %d\n" port

let ocaml_wrap_dupsplit ptr buffer port =
  for i = 0 to 3 - 1 do
    (submit ptr buffer i)
  done;;

let _ = 
   ocaml_wrap_dupsplit 0 "hello" 0;;