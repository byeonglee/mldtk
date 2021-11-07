pos_speed_str : {vehicle_id:int ; speed:int; x_pos:int; dir:int; hwy:int} stream;


seg_speed_str : {vehicle_id:int; speed:int; seg_no:int; dir:int; hwy:int} stream = 
select vehicle_id, speed, (x_pos/1760) as seg_no, dir, hwy
from pos_speed_str;


active_vehicle_seg_rel : {vehicle_id:int; seg_no:int; dir:int; hwy:int} relation =
select distinct L.vehicle_id, L.seg_no, L.dir, L.hwy 
from seg_speed_str[range 30] as A, seg_speed_str[partition by vehicle_id rows 1] as L
where A.vehicle_id = L.vehicle_id;

vehicle_seg_entry_str : {vehicle_id:int;seg_no:int; dir:int; hwy:int} stream = 
select istream(*) 
from active_vehicle_seg_rel;

congested_seg_rel_tmp: {speed:int; seg_no:int; dir:int; hwy:int} relation =
select avg(speed), seg_no, dir, hwy 
from seg_speed_str[range 300] 
group by seg_no, dir, hwy ;

congested_seg_rel : {seg_no:int; dir:int; hwy:int} relation =
select seg_no, dir, hwy
from congested_seg_rel_tmp
where speed < 40 ;

seg_vol_rel: {seg_no:int;  dir:int; hwy:int; num_vehicles:int} relation =
select seg_no, dir, hwy, count(vehicle_id) as num_vehicles
from active_vehicle_seg_rel 
group by seg_no, dir, hwy ;

toll_str_tmp : {vehicle_id:int;seg_no:int; dir:int; hwy:int; toll:int} relation = 
select E.vehicle_id, E.seg_no, E.dir, E.hwy, 
       2 * (V.num_vehicles - 150) 
       * (V.num_vehicles - 150) as toll
from vehicle_seg_entry_str[now] as E, seg_vol_rel as V      
where E.seg_no = V.seg_no &&
      E.dir    = V.dir    &&
      E.hwy    = V.hwy ;


toll_str : {vehicle_id:int; toll:int} stream = 
select rstream(vehicle_id, toll)
from toll_str_tmp as T, congested_seg_rel as C
where T.seg_no = C.seg_no &&
      T.dir    = C.dir    &&
      T.hwy    = C.hwy ;



