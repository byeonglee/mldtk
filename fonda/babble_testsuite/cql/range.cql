quotes : { ticker : string; ask : int } stream;
bargain : { ticker : string; ask : int } stream
  = select * from quotes[range 3];

