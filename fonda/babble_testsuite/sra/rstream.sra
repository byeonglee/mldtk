history : {ticker : string; low : int} relation;
bargain : {ticker : string; low : int} stream = 
rstream(select[low > 1](history));

