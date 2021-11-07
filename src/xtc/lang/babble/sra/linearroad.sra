pos_speed_str : {vehicle_id : int; speed : int; x_pos : int; dir : int; hwy : int} stream;

seg_speed_str : {vehicle_id : int; speed : int; seg_no : int; dir : int; hwy : int} stream = 
istream(project[vehicle_id as vehicle_id, speed as speed, (x_pos / 1760) as seg_no, dir as dir, hwy as hwy](now(pos_speed_str)));

active_vehicle_seg_rel : {vehicle_id : int; seg_no : int; dir : int; hwy : int} relation = 
distinct(project[vehicle_id as vehicle_id, seg_no as seg_no, dir as dir, hwy as hwy](join[seg_speed_str.vehicle_id = seg_speed_str.vehicle_id](range[30](seg_speed_str), partition[vehicle_id, 1](seg_speed_str)) as A));

vehicle_seg_entry_str : {vehicle_id : int; seg_no : int; dir : int; hwy : int} stream = 
istream(active_vehicle_seg_rel);

congested_seg_rel_tmp : {speed : int; seg_no : int; dir : int; hwy : int} relation = 
aggregate[seg_no, dir, hwy; avg(speed) as speed](range[300](seg_speed_str));

congested_seg_rel : {seg_no : int; dir : int; hwy : int} relation = 
project[seg_no as seg_no, dir as dir, hwy as hwy](select[speed < 40](congested_seg_rel_tmp));

seg_vol_rel : {seg_no : int; dir : int; hwy : int; num_vehicles : int} relation = 
aggregate[seg_no, dir, hwy; count(vehicle_id) as num_vehicles](active_vehicle_seg_rel);

toll_str_tmp : {vehicle_id : int; seg_no : int; dir : int; hwy : int; toll : int} relation = 
project[vehicle_id as vehicle_id, seg_no as seg_no, dir as dir, hwy as hwy, 2 * (num_vehicles -150) * (num_vehicles -150) as toll](join[vehicle_seg_entry_str.seg_no = seg_vol_rel.seg_no && vehicle_seg_entry_str.dir = seg_vol_rel.dir && vehicle_seg_entry_str.hwy = seg_vol_rel.hwy](now(vehicle_seg_entry_str), seg_vol_rel) as B);

toll_str : {vehicle_id : int; toll : int} stream = 
rstream(project[vehicle_id as vehicle_id, toll as toll](join[toll_str_tmp.seg_no = congested_seg_rel.seg_no && toll_str_tmp.dir = congested_seg_rel.dir && toll_str_tmp.hwy = congested_seg_rel.hwy](toll_str_tmp, congested_seg_rel) as C));

