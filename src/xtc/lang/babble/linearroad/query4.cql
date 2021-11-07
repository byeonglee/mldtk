Select segNo, dir, hwy 
From SegSpeedStr [Range 5 Minutes] 
Group By segNo, dir, hwy 
Having Avg(speed) < 40

