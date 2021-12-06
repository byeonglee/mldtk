list< Code<cpp,decl> > myenum(
  Code<cpp,id> name,
  list< Code<cpp,id> > ids) {

  Code<cpp,decl> enumDecl = `cpp(decl) [ enum $name { $ids }; ]; #myenum1

  Code<cpp,id> fname = cat_id("print_", name);
  list< Code<cpp,stmt> > cases = [];
  for(Code<cpp,id> i in ids) {
    cases += `cpp(stmt) [ /*myenum2*/
       case $i: printf("%s", $[pstring(i)]);
    ];
  }
  Code<cpp,decl> print_func = `cpp(decl) [
    void $fname (int arg) {
      switch(arg) {  /*myenum3*/
      $cases
      }
    }
  ];

  Code<cpp,id> readFuncName = cat_id("read_", name);
  list< Code<cpp,stmt> > condStmts = [];
  for(Code<cpp,id> i in ids) {
    condStmts += `cpp(stmt) [  /*myenum4*/
      if (!strcmp(s, $[pstring(i)])) {
        return ($i);
      }
    ];
  }
  Code<cpp,decl> read_func = `cpp(decl) [ /*myenum5*/
    int $readFuncName () {
      char s[100];
      getline(s, 100);
      $condStmts
    }
  ];

  return [
    enumDecl,
    print_func,
    read_func
  ];
}
