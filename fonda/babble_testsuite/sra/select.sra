history : {ticker : string; low : int} relation;
bargain : {ticker : string; low : int} stream = 
istream(select[low > 1](history));

