open Printf;;

module Logs = struct
  type logs = {
    origin:string;
    target:string;
    }
end;;


let print_log_data_item tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{origin=%s; target=%s}" x.Logs.origin x.Logs.target ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{origin=%s; target=%s}" x.Logs.origin x.Logs.target ) deletes; 
    Printf.printf "])\n";;

let _ = 
  let partitions = (int_of_string Sys.argv.(1)) in
  let num_tuples = 1000 in
  let rec files list num =
    let filename = (sprintf "./logs_%d.data" num) in
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
      let tup = {Logs.origin = origin; Logs.target = target} in
        let item = (!time, [tup], []) in
          Marshal.to_channel (List.nth list (i mod partitions)) item [Marshal.No_sharing];
          Printf.printf "%d gets : " (i mod partitions) ;
          remaining := (i mod partitions) ;
          print_log_data_item item
    done;
    if (!remaining != 0) then
      for i = !remaining +1 to partitions do

        let origin = (sprintf "%c" (Char.chr ((i mod partitions) + 64)))
        and target =  (sprintf "%c"  (Char.chr (partitions - (i mod partitions) - 1 + 65))) in
        let tup = {Logs.origin = origin; Logs.target = target} in
          let item = (!time, [tup], []) in
            Marshal.to_channel (List.nth list (i mod partitions)) item [Marshal.No_sharing];
            Printf.printf "%d gets : " (i mod partitions) ;
            print_log_data_item item
      done;
    Printf.printf "%d tuples + %d padding = %d\n" num_tuples !remaining (num_tuples + !remaining);
    List.map (function x -> close_out x) list 



