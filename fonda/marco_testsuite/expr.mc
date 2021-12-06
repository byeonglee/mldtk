import MLib;
# This template pattern is found in SPLCodeGen.inc, AdapterHelper.inc,
# Split_cpp.mc, and Barrier_h.mc.
# Code<expr> cppLiteral(int number)
# {
#    return `expr[ $number ];
# }

void main(list<string> args)
{
  selector(true);
  selector(false);
  filterExpr(true, selector(true));
  compute();
  methodCall(`cpp(id)[byeong], selector(true));
  power(`cpp(expr)[byeong], 10);
}

# This template pattern is found in Join_cpp.mc,
Code<cpp,expr> selector(boolean condition)
{
   if (condition) {
     return `cpp(expr)[ 2 ];
   } else {
     return `cpp(expr)[ 1 ];
   }
}

# This template pattern is found in SPLCodeGen.inc, Filter_cpp.mc,
# Functor_cpp.mc, Join_cpp.mc, TCPSink_cpp.mc, TCPSource_cpp.mc,
# Delay_cpp.mc, Beacon_cpp.mc, and Throttle_cpp.mc.
Code<cpp,expr> filterExpr(boolean guard, Code<cpp,expr> e)
{
  if (guard) {
    return e;
  } else {
    return `cpp(expr)[ 1 ];
  }
}

# This template pattern is found in Throttle_cpp.mc. Here, the "foo"
# is a variable.
Code<cpp,expr> compute()
{
  return `cpp(expr)[
    10.0 * (1.0 / (foo))
  ];
}

# #This template pattern is found in SPLCodeGen.inc.
Code<cpp,expr> methodCall(Code<cpp,id> mname, Code<cpp,expr> argument)
{
   return `cpp(expr)[
     $mname ( $argument )
   ];
}

# This example is pervasive in papers on multi-stage-programming (MSP)
# (e.g., JavaMint). This example is not interesting to SPL programmer,
# but to MSP programmers. Do we want to allow generic iteration
# syntax?
Code<cpp,expr> power(Code<cpp,expr> x, int n) {
  Code<cpp,expr> e = x;
  for(int i in range(n)) {
    e = `cpp(expr)[ $e * $x ];
  }
  return e;
}
