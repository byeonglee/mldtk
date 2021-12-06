import MLib;

void main(list<string> args) {
  good();
  bad();
}

void bad() {
  Code<sql,expr> p = `sql(expr)[type == ]; #bad1
  Code<sql,stmt> q = `sql(stmt)[  #bad2
    title from moz_bookmarks where $p
  ];
  show(q);
}

void good() {
  Code<sql,expr> p = `sql(expr)[type == 1]; #good1
  Code<sql,stmt> q = `sql(stmt)[ #good2
    select title
      from moz_bookmarks
      where $p
  ];
  show(q);
}
