void main(list<string> args){
     swap(`cpp(id)[a], `cpp(id)[b]);
     foo();
}

# an example derived from Martin's email
Code<cpp,stmt> swap(Code<cpp,id> x, Code<cpp,id> y) {
  return `cpp(stmt)[{
    int temp = $x; /*hygiene:capturer*/
    $x = $y;
    $y = temp;
  }];
}

# an example derived from Martin's email
Code<cpp,stmt> foo() {
  Code<cpp,id> temp = `cpp(id)[ temp ];
  Code<cpp,id> freezing = `cpp(id)[ freezing ];
  Code<cpp,stmt> s = swap(temp, freezing);
  return `cpp(stmt)[{
    int temp = thermometer(), freezing = 32; /*hygiene:capturer*/
    if (temp < freezing)
      $s;
    print(temp);
  }];
}
