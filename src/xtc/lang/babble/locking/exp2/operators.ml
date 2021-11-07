open Printf;;

external put : int -> int -> string -> unit = "put";;

let ocaml_wrap_output ptr port data = 
  put ptr port (Marshal.to_string data [Marshal.No_sharing]);;

let f2_shutdown ptr = ()
let f1_shutdown ptr = ()
let q1_shutdown ptr = ()
let q3_shutdown ptr = ()

let f2 ptr port data =
  Printf.printf "f2 got %d\n" data;   
  flush stdout;    
  Unix.sleep 1;
  ocaml_wrap_output ptr 0 data

let ocaml_wrap_f2 ptr port buffer = 
  f2 ptr port (Marshal.from_string buffer 0) 

let f1 ptr port data =
   Printf.printf "f1 got %d\n" data;   
   flush stdout;    
   Unix.sleep 1;
   ocaml_wrap_output ptr 0 data 

let ocaml_wrap_f1 ptr port buffer = 
    f1 ptr port (Marshal.from_string buffer 0) 

let q1 ptr port = 
  for i = 1 to 10 do
    ocaml_wrap_output ptr port i 
  done

let ocaml_wrap_q1 ptr port = 
  q1 ptr port 

let q3 ptr buffer = 
  ()

let ocaml_wrap_q3 ptr buffer = 
  q3 ptr buffer 

let () = 
  Callback.register "ocaml_wrap_f2" ocaml_wrap_f2;
  Callback.register "ocaml_wrap_f1" ocaml_wrap_f1;
  Callback.register "ocaml_wrap_q1" ocaml_wrap_q1;
  Callback.register "ocaml_wrap_q3" ocaml_wrap_q3;
  Callback.register "f2_shutdown" f2_shutdown;
  Callback.register "f1_shutdown" f1_shutdown;
  Callback.register "q1_shutdown" q1_shutdown;
  Callback.register "q3_shutdown" q3_shutdown


