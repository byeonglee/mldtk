open Printf;;


module LogRecord = struct
  type logRecord = {
    origin:string;
    target:string;
    }
end;;

let _ = 
  let partitions = 16 in
  let num_tuples = 100000000 in      
  let file_array = let n = partitions in (Array.init n (fun i -> (let filename = (sprintf "./logRecord_%d.data" i) in open_out filename))) in 
    for i = 1 to num_tuples do  
      let origin = (sprintf "%d" (i mod partitions))
      and target =  (sprintf "%d" (i mod partitions)) in
        Marshal.to_channel (file_array.(i mod partitions)) {LogRecord.origin = origin; LogRecord.target = target} [Marshal.No_sharing]
    done;
    Array.iter (function x -> close_out x) file_array 
