import MLib;

void main(list<string> args) {
  string ifile = "SQLDynamicScopeInput.txt";
  Code<sql,expr> p = getSQLExprFromFile(ifile);
  Code<sql,stmt> q = `sql(stmt)[
    select title from moz_bookmarks where $p
  ]; # Here, "t" is captured at the "p" blank.
  show(q);
}
