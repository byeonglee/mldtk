quotes : { ticker : string; ask : int } stream ;
history : { ticker : string; low : int } relation;
bargain : { ticker : string; ask : int; low : int } stream
  = istream(
      join[quotes.ask <= history.low
           && quotes.ticker == history.ticker](
        now(quotes),
        history) as J);


