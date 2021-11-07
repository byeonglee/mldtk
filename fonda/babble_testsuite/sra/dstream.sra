history : {ticker : string; low : int} relation;
bargain : {ticker : string; low : int} stream = 
dstream(select[low > 1](history));

