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

let pos_speed_str_items =
  [
    (1, [{Pos_speed_str.dir=1; Pos_speed_str.hwy=1; Pos_speed_str.speed=30; Pos_speed_str.vehicle_id=1; Pos_speed_str.x_pos=8800}], []);
    (2, [{Pos_speed_str.dir=1; Pos_speed_str.hwy=1; Pos_speed_str.speed=30; Pos_speed_str.vehicle_id=2; Pos_speed_str.x_pos=8800}], []);
    (3, [{Pos_speed_str.dir=1; Pos_speed_str.hwy=1; Pos_speed_str.speed=30; Pos_speed_str.vehicle_id=3; Pos_speed_str.x_pos=8800}], []);
    (4, [{Pos_speed_str.dir=1; Pos_speed_str.hwy=1; Pos_speed_str.speed=30; Pos_speed_str.vehicle_id=4; Pos_speed_str.x_pos=8800}], []);
    (5, [{Pos_speed_str.dir=1; Pos_speed_str.hwy=1; Pos_speed_str.speed=30; Pos_speed_str.vehicle_id=5; Pos_speed_str.x_pos=8800}], [])
  ] ;;


let oc = open_out "/tmp/pos_speed_str.data" in
  List.iter (function (x) -> Marshal.to_channel oc x [Marshal.No_sharing]) pos_speed_str_items ;
  close_out oc;;

