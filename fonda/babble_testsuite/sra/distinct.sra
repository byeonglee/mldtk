pos_speed_str : {vehicle_id : int; speed : int; x_pos : int} stream;
seg_speed_str : {vehicle_id : int} stream = 
istream(distinct(project[vehicle_id as vehicle_id](range[30](pos_speed_str))));

