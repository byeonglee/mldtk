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

let oc = open_out "/tmp/pos_speed_str.data" in
  for i = 1 to 100000000 do
    let tup = 
    (i, [{Pos_speed_str.dir=1; Pos_speed_str.hwy=1; Pos_speed_str.speed=30; Pos_speed_str.vehicle_id=i; Pos_speed_str.x_pos=8800}], []);
    in Marshal.to_channel oc tup [Marshal.No_sharing]
  done;
  close_out oc;;

