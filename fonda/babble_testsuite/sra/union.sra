history1 : {ticker : string; low : int} relation;
history2 : {ticker : string; low : int} relation;
history_combined : {ticker : string; low : int} relation = 
union(history1, history2) as A;

