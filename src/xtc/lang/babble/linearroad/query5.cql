Select segNo, dir, hwy, count(vehicleId) as numVehicles 
From ActiveVehicleSegRel 
Group By segNo, dir, hwy
