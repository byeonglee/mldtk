quotes : { ticker : string; ask : int } stream ;
history : { ticker : string; low : int } relation;
bargain : { ticker : string; ask : int; low : int } stream
  = select istream(*) from quotes[now] as Q, history as H
  where ask <= low && Q.ticker = H.ticker;

