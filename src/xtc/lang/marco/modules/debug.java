package xtc.lang.marco.modules;

import static xtc.lang.marco.Util.out;

import xtc.lang.marco.run.McCode;
import xtc.lang.marco.run.McToken;

public class debug {
  public static void dump_cpp_expr(McCode c) {
    int i = 0;
    for (McToken t : c.tokens) {
      i++;
      out("token%d: %s\n", i, t.value);
    }
  }
}
