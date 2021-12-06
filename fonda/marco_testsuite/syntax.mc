void main(list<string> args){
     # The semantic error at "operator =" shadows
     # the downstream syntax errors in
     # "catch the syntax error here!."
     `cpp(mdecl)[
     const c1 & operator = (c2 const & o) {
       Catch the syntax error here!
     }
  ];
}
