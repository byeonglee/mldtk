open Printf;;

module LogRecord = struct
  type logRecord = {
    origin:string;
    target:string;
    }
end;;



let _ = 
  let partitions = 1 in
  let num_tuples = 100000000 in
  let rec files list num =
    let filename = (sprintf "/tmp/logRecord_%d.data" num) in
      match num with
        | 0 -> list@[open_out filename]
        | _ -> files (list@[open_out filename]) (num-1)
  in
  let list = files [] (partitions-1) in
    for i = 1 to num_tuples do
      let origin = (sprintf "196.0.0.%d" (i mod 127))
      and target =  (sprintf "196.0.0.%d" (i mod 127)) in
        Marshal.to_channel (List.nth list (i mod partitions)) {LogRecord.origin = origin; LogRecord.target = target} [Marshal.No_sharing];
    done;
    printf "done.\n" ;
    List.map (function x -> close_out x) list 
