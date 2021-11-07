Select Rstream(E.vehicleId,
              basetoll * (V.numVehicles - 150) 
                       * (V.numVehicles - 150) as toll)
From VehicleSegEntryStr  [Now] as E,
     CongestedSegRel as C, SegVolRel as V
Where E.segNo = C.segNo and C.segNo = V.segNo and
       E.dir = C.dir and C.dir = V.dir and  
       E.hwy = C.hwy and C.hwy = V.hwy
	
