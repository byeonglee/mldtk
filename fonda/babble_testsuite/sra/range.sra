quotes : {ticker : string; ask : int} stream;
bargain : {ticker : string; ask : int} stream = 
istream(range[3](quotes));

