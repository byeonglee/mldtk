Code<cpp,stmt> complain(Code<cpp,expr> msg) {
  return `cpp(stmt) [ #complain1
    print_error($msg);
  ];
}

void main(list<string> args) {
   Code<cpp,stmt> comp = complain(`cpp(expr)[print_error]);  #main1
   Code<cpp,stmt> s = `cpp(stmt) [ #main2
    if (printer_broken()) {
      char *print_error = "The printer is broken";
      $comp
    }
  ];
}
