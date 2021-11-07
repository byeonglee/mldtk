history : { ticker : string; low : int } relation; 
odd : { myval : int } stream = 
select history.low + 1 as myval from history;
