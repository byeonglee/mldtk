open Printf;;

let usage = "usage: " ^ Sys.argv.(0) ^ " [numTuples]\n\n" ^
            "example: " ^ Sys.argv.(0) ^ " 100000000\n\n" 

let _ = 
  if (Array.length Sys.argv <= 1) then
    Printf.printf "%s" usage
  else 
    begin       
      let oc = open_out "./q1.data" in
        for i = 1 to  int_of_string Sys.argv.(1) do
          let data = float_of_int i in
            Marshal.to_channel oc data [Marshal.No_sharing]
        done;
        close_out oc
    end
