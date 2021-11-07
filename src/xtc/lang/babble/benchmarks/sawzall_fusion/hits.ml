open Printf;;

module LogRecord = struct
  type logRecord = {
    origin:string;
    target:string;
    }
end;;


let usage = "usage: " ^ Sys.argv.(0) ^ " [numTuples] [numPartitions] \n\n" ^
            "example: " ^ Sys.argv.(0) ^ " 100000000 16\n\n" 


let print_log_data_item x =
  Printf.printf "{origin=%s; target=%s}\n" x.LogRecord.origin x.LogRecord.target 
    
let _ = 
  if (Array.length Sys.argv <= 2) then
    Printf.printf "%s" usage
  else 
    begin
      let partitions = (int_of_string Sys.argv.(2)) in
      let num_tuples = (int_of_string Sys.argv.(1)) in
      let rec files list num =
        let filename = (sprintf "./logRecord_%d.data" num) in
          match num with
            | 0 -> list@[open_out filename]
            | _ -> files (list@[open_out filename]) (num-1)
      in
      let list = files [] (partitions-1) in
      let time = ref 0 in
      let remaining = ref 0 in
        for i = 1 to num_tuples do
          if ((i mod partitions) = 1) then incr time;
          let origin = (sprintf "%c" (Char.chr (((i+1) mod partitions) + 66 )))
          and target =  (sprintf "%c"  (Char.chr (partitions - (i mod partitions) - 1 + 65))) in
          let tup = {LogRecord.origin = origin; LogRecord.target = target} in
            Marshal.to_channel (List.nth list (i mod partitions)) tup [Marshal.No_sharing];
            (* Printf.printf "%d gets : " (i mod partitions) ; *)
            remaining := (i mod partitions) ;
            (* print_log_data_item tup *)
        done;
        if (!remaining != 0) then
          for i = !remaining +1 to partitions do
            
            let origin = (sprintf "%c" (Char.chr ((i mod partitions) + 64)))
            and target =  (sprintf "%c"  (Char.chr (partitions - (i mod partitions) - 1 + 65))) in
            let tup = {LogRecord.origin = origin; LogRecord.target = target} in
              Marshal.to_channel (List.nth list (i mod partitions)) tup [Marshal.No_sharing]
                (* Printf.printf "%d gets : " (i mod partitions) ; *)
                (* print_log_data_item item *)
          done;
        Printf.printf "%d tuples + %d padding = %d\n" num_tuples !remaining (num_tuples + !remaining);
        List.iter (function x -> close_out x) list 
    end
      

