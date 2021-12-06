Code<sql,stmt> genTitleQueryinSQL(Code<sql,expr> p) {
  return `sql(stmt)[
    select title from moz_bookmarks where $p
  ];
}

Code<cpp,stmt> genSwapinCPP(Code<cpp,id> x, Code<cpp,id> y) {
  return `cpp(stmt)[ {
    int temp = $x;
    $x = $y;
    $y = temp;
  }];
}
