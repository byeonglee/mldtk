import MLib;

void main(list<string> args) {
  # Here, "id" is free.
  Code<sql,expr> p = `sql(expr)[id == 3];
  Code<sql,stmt> q = `sql(stmt,capture=[id])[
    select title from moz_bookmarks where $p
  ]; # At the "p" blank, Here, "id" is captured.
  show(q);
}
