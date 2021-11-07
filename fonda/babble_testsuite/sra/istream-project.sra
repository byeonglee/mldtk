history : {ticker : string; low : int} relation;
odd : {myval : int} stream =
istream(project[low + 100 as myval](history));
