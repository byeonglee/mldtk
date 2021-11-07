logs : { origin : string; target : string } stream ;
hits : { origin : string; c :int } stream
  = select origin, count(origin) as c
  from logs [range 300]
  group by origin ;
