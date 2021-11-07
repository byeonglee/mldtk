quotes : { ticker : string; ask : int } stream;
bargain : { ticker : string; ask : int } stream
  = select * from quotes[partition by ticker rows 2];

