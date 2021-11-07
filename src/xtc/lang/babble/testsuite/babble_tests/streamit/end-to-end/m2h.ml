
open Printf;;

let marshalFile = 
  Sys.argv.(1)

let humanReadableFile = 
  Sys.argv.(2)

let () = 
  let ic = 
    open_in marshalFile in
    let oc = 
      open_out humanReadableFile in
      try
        while true
        do let tup = Marshal.from_channel ic in
            fprintf oc "%f\n" tup;
            flush oc
        done 
      with
        End_of_file -> close_in_noerr ic;
        close_out_noerr oc

