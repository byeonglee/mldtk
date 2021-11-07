open Printf;;

(* external put : int -> string -> int -> unit = "put";; *)
let put ptr data port = 
  Printf.printf "put called port %d\n" port;;

type reducerTypes =
     QueryOrigins of string * int
   | QueryTargets of string * int
;;

let ocaml_wrap_output ptr port data =
  put ptr (Marshal.to_string data [Marshal.No_sharing]) port;;


let hashsplitN r ptr data =
  let n = r in 
    match data with
      | QueryOrigins (key, value) -> ( ocaml_wrap_output ptr ((Hashtbl.hash key) mod n) data)
      | QueryTargets (key, value) -> ( ocaml_wrap_output ptr ((Hashtbl.hash key) mod n) data)

let hashsplit = 
  hashsplitN 3 ;;
          
let ocaml_wrap_hashsplit ptr buffer port =
  let data =
    Marshal.from_string buffer 0 in
    hashsplit ptr data;;


(******** Testing Code *********)
let _ = 
  ocaml_wrap_hashsplit 0 (Marshal.to_string (QueryOrigins ("127.0.0.1", 1)) [Marshal.No_sharing]) 0 ;
  ocaml_wrap_hashsplit 0 (Marshal.to_string (QueryOrigins ("127.0.0.2", 1)) [Marshal.No_sharing]) 0 ;
  ocaml_wrap_hashsplit 0 (Marshal.to_string (QueryOrigins ("127.0.0.3", 1)) [Marshal.No_sharing]) 0 ;
  ocaml_wrap_hashsplit 0 (Marshal.to_string (QueryTargets ("127.0.0.1", 1)) [Marshal.No_sharing]) 0 ;
  ocaml_wrap_hashsplit 0 (Marshal.to_string (QueryTargets ("127.0.0.2", 1)) [Marshal.No_sharing]) 0 ;;


