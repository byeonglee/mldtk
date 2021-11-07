pos_speed_str : {vehicle_id:int ; speed:int; x_pos:int} stream;

seg_speed_str  : { vehicle_id:int } stream
  = select distinct vehicle_id from pos_speed_str[range 30];

