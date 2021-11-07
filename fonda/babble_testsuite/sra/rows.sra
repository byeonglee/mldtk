quotes : {ticker : string; ask : int} stream;
bargain : {ticker : string; ask : int} stream = 
istream(rows[2](quotes));
