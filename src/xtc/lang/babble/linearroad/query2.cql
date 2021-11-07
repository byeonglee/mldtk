Select Distinct L.vehicleId, L.segNo, L.dir, L.hwy 
From SegSpeedStr [Range 30 Seconds] as A,
     SegSpeedStr [Partition by vehicleId Rows 1] as L 
Where A.vehicleId = L.vehicleId

