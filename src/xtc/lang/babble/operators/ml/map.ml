open Printf;;

module LogRecord = struct
  type logRecord = {
    origin:string;
    target:string;
    }
end;;


type reducerTypes = 
  | QueryOrigins of string * int 
  | Foo of string * int 
  | QueryTargets of int * float ;;


let map0 ptr tup =
  let key = tup.LogRecord.origin 
  and value = 1
  in ((Hashtbl.hash key) mod 3, QueryOrigins(key, value)); 
  let key = tup.LogRecord.target 
  and value = 1
  in ((Hashtbl.hash key) mod 3, QueryOrigins(key, value));;



let ocaml_wrap_map0 ptr buffer port =
  let tup:LogRecord.logRecord =
    Marshal.from_string buffer 0 in
    (map0 ptr tup);;


