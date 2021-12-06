Code<cpp,expr> discriminant(
  Code<cpp,expr> a,
  Code<cpp,expr> b,
  Code<cpp,expr> c) {
  return `cpp(expr) [ #discriminant1
    $b & $b - 4 * $a * $c
  ];
}
