quotes : {ticker : string; ask : int} stream;
bargain : {ticker : string; ask : int} stream = 
istream(partition[ticker, 2](quotes));

