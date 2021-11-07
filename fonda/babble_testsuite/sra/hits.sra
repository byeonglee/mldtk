logs : {origin : string; target : string} stream;
hits : {origin : string; c : int} stream = 
istream(aggregate[origin; count(origin) as c](range[300](logs)));

