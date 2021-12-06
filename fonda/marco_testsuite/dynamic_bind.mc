Code<cpp,stmt> dynamic_bind(
  Code<cpp,type> _type,
  Code<cpp,id> name,
  Code<cpp,exp> init,
  Code<cpp,stmt> body) {
  Code<cpp,id> newname = gensym();
  return `cpp(stmt) [{
    $_type $newname = $name;
    $body;
    $name = $newname;
  }];
}

void main(list<string> args) {
}
