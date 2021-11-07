(* ocamlc -o hello hello.ml *)

open Printf

type history = {
  ticker : string;
  low : int;
};;


(* some sample data for testing *)
let dataItem = 
  (1, [{low = 35; ticker = "IBM"}; {low = 10; ticker = "XYZ"} ], [{low = 35; ticker = "IBM"}])

(* val dataItem : int * history list * history list *)
let serialized_data = 
    Marshal.to_string dataItem [Marshal.No_sharing]

let marshalFile = Sys.argv.(1)
let humanReadableFile = Sys.argv.(2)


(* write out some data *)
let _ =
  let oc = open_out marshalFile in
    fprintf oc "%s\n" serialized_data;
    close_out oc;;


let print_history_list list =
  let str_list = 
    List.map (function (x:history) -> sprintf "{%d; %s}" x.low x.ticker) list in
    "[" ^ (String.concat "; " str_list) ^ "]";;

let human_readable buffer =
  let ((tau:int), inserts, deletes) = Marshal.from_string buffer 0 in
    sprintf "(%d, %s, %s)" tau (print_history_list inserts) (print_history_list deletes) ;; 

let ic = open_in marshalFile in
let oc = open_out humanReadableFile in
  try 
    let line = input_line ic in
      print_endline line;
      let str = human_readable line in
        print_endline str ;
        flush stdout;
        fprintf oc "%s\n" str ;          
          close_in ic ;
          close_out oc 
  with e ->
    close_in_noerr ic;
    raise e
