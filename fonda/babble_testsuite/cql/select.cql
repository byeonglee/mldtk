history : { ticker : string; low : int } relation;
bargain : { ticker : string; low : int } stream
  = select istream(*) from history as H
  where low > 1;

