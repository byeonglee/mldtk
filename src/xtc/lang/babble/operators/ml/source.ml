
module History = struct
  type history = {
    low:int;
    ticker:string;
    }
end;;

let ocaml_wrap_output ptr port buffer =
  Printf.printf("ocaml_wrap_output\n");;

let maybe_history :in_channel option =
  if true
  then Some (open_in "/tmp/history.data")
  else None;;

let ocaml_wrap_history ptr port =
  assert (port = 0);
  match
    maybe_history
  with
     | Some ic -> 
         (try 
           while true do 
             let tup:History.history = Marshal.from_channel ic in
               ocaml_wrap_output ptr 0 (Marshal.to_string tup [Marshal.No_sharing])
           done
         with End_of_file ->
           close_in ic)
     | None -> ();;

let _ = 
  ocaml_wrap_history 1 0;;
