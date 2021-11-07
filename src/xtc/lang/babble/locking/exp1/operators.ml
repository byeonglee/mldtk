open Printf;;

external put : int -> int -> string -> unit = "put";;
external write: int -> int -> unit = "write_shm"
external read: int -> int = "read_shm"
external init: int -> unit = "init_shm"

let key = 5678

let ocaml_wrap_output ptr port data = 
  put ptr port (Marshal.to_string data [Marshal.No_sharing]);;

let f3_shutdown ptr = ()
let f2_shutdown ptr = ()
let f1_shutdown ptr = ()
let q1_shutdown ptr = ()
let q4_shutdown ptr = ()

let f3 ptr port buff =
  let x = read key in
      ignore (Unix.select [] [] [] 1.0); 
      write key (x + 1);
  ocaml_wrap_output ptr 0 x 

let ocaml_wrap_f3 ptr port buff = 
  f3 ptr port buff 

let f2 ptr port buff =
  ocaml_wrap_output ptr 0 0 

let ocaml_wrap_f2 ptr port buff = 
  f2 ptr port buff 

let f1 ptr port buff =
  let x = read key in
      ignore (Unix.select [] [] [] 1.0); 
      write key (x + 1);
    ocaml_wrap_output ptr 0 x 

let ocaml_wrap_f1 ptr port buffer = 
    f1 ptr port buffer 

let q1 ptr port = 
  init key;    
  for i = 1 to 2000 do
    ocaml_wrap_output ptr port i 
  done

let ocaml_wrap_q1 ptr port = 
  q1 ptr port 

let q4 ptr buffer = 
  ()

let ocaml_wrap_q4 ptr buffer = 
  q4 ptr buffer 

let () = 
  Callback.register "ocaml_wrap_f3" ocaml_wrap_f3;
  Callback.register "ocaml_wrap_f2" ocaml_wrap_f2;
  Callback.register "ocaml_wrap_f1" ocaml_wrap_f1;
  Callback.register "ocaml_wrap_q1" ocaml_wrap_q1;
  Callback.register "ocaml_wrap_q4" ocaml_wrap_q4;
  Callback.register "f3_shutdown" f3_shutdown;
  Callback.register "f2_shutdown" f2_shutdown;
  Callback.register "f1_shutdown" f1_shutdown;
  Callback.register "q1_shutdown" q1_shutdown;
  Callback.register "q4_shutdown" q4_shutdown


