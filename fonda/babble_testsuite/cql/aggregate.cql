r1 : { i : int; j : int; k1 : int; k2 : string } relation;
r2 : { c : int; j : int; k1 : int; k2 : string } relation
 = select k1, k2, count(i) as c, avg(j) from r1;

