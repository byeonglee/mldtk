quotesRel : { ticker : string; ask : int } relation ;
history : { ticker : string; low : int } relation;
bargainRel : { ticker : string; ask : int; low : int } relation
  = select ticker, ask from quotesRel as Q, history as H
  where ask <= low && Q.ticker == H.ticker;

