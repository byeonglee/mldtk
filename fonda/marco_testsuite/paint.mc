Code<cpp,stmt> Painting(Code<cpp,stmt> s) {
  return `cpp(stmt)[{
    BeginPaint(hDc, &ps);
    $s
    EndPaint(hDc, &ps);
  }];
}
