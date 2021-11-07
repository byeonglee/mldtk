open Printf;;

module Pos_speed_str = struct
  type pos_speed_str = {
    dir:int;
    hwy:int;
    speed:int;
    vehicle_id:int;
    x_pos:int;
    }
end;;

let usage = "usage: " ^ Sys.argv.(0) ^ " [numTuples]\n\n" ^
            "example: " ^ Sys.argv.(0) ^ " 100000000\n\n" ;;

let oc = open_out "./pos_speed_str.data" in
  if (Array.length Sys.argv <= 1) then
    Printf.printf "%s" usage
  else 
    begin
      for i = 1 to int_of_string Sys.argv.(1) do
        let tup = 
          (i, [{Pos_speed_str.dir=1; Pos_speed_str.hwy=1; Pos_speed_str.speed=30; Pos_speed_str.vehicle_id=i; Pos_speed_str.x_pos=8800}], []);
        in Marshal.to_channel oc tup [Marshal.No_sharing]
      done;
      close_out oc
    end

