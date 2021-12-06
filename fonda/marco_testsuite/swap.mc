Code<cpp, stmt> swap(
  Code<cpp,id> v,
  Code<cpp,id> w) {
  Code<cpp,stmt> tempSwapStmt = swap(
    `cpp(id)[temp],   /*swap1*/
    `cpp(id)[lo_temp] /*swap2*/
  );
  return `cpp(stmt) [{ /*swap3*/
    {int temp = $v; $v = $w; $w = temp;}
    int temp = thermometer();
    if (temp < lo_temp)
      $tempSwapStmt
  }];
}
