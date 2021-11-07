package xtc.playground;

/** A top-down parser for a simple arithmetic language. */
public class Arith {

  // ************************************************************************

  public static interface Computer {
    public Object run(Object o);
  }
  
  // ************************************************************************

  public static class Result {
    public boolean parsed;
    public Object  v;
    public String  s;

    public Result() {
      parsed = false;
    }

    public Result(Object v, String s) {
      parsed = true;
      this.v = v;
      this.s = s;
    }
  }

  // ************************************************************************

  public static final Result  NO_PARSE = new Result();

  public static final boolean DEBUG    = false;

  // ************************************************************************

  public Result pAdditive(String s) {
    if (DEBUG) System.out.println("pAdditive         " + s);

    Result r1 = pMultitive(s);
    if (r1.parsed) {

      Result r2 = pAdditiveSuffix(r1.s);
      if (r2.parsed) {

        return new Result(((Computer)r2.v).run(r1.v), r2.s);
      }
    }

    return NO_PARSE;
  }
  
  // ************************************************************************

  public Result pAdditiveSuffix(String s) {
    if (DEBUG) System.out.println("pAdditiveSuffix   " + s);

    if (0 < s.length()) {
      char c1 = s.charAt(0);

      if ('+' == c1) {
        final Result r2 = pMultitive(s.substring(1));

        if (r2.parsed) {
          final Result r3 = pAdditiveSuffix(r2.s);

          if (r3.parsed) {
            return new Result(new Computer() {
                public Object run(Object o) {
                  Integer i = new Integer(((Integer)o).intValue()
                                          + ((Integer)r2.v).intValue());
                  return ((Computer)r3.v).run(i);
                }}, r3.s);
          }
        }

      } else if ('-' == c1) {
        final Result r2 = pMultitive(s.substring(1));

        if (r2.parsed) {
          final Result r3 = pAdditiveSuffix(r2.s);

          if (r3.parsed) {
            return new Result(new Computer() {
                public Object run(Object o) {
                  Integer i = new Integer(((Integer)o).intValue()
                                          - ((Integer)r2.v).intValue());
                  return ((Computer)r3.v).run(i);
                }}, r3.s);
          }
        }
      }
    }

    return new Result(new Computer() {
        public Object run(Object o) {
          return o;
        }}, s);
  }

  // ************************************************************************

  public Result pMultitive(String s) {
    if (DEBUG) System.out.println("pMultitive        " + s);

    Result r1 = pPrimary(s);
    if (r1.parsed) {

      Result r2 = pMultitiveSuffix(r1.s);
      if (r2.parsed) {
        
        return new Result(((Computer)r2.v).run(r1.v), r2.s);
      }
    }

    return NO_PARSE;
  }

  // ************************************************************************

  public Result pMultitiveSuffix(String s) {
    if (DEBUG) System.out.println("pMultitiveSuffix  " + s);

    if (0 < s.length()) {
      char c1 = s.charAt(0);

      if ('*' == c1) {
        final Result r2 = pMultitive(s.substring(1));

        if (r2.parsed) {
          return new Result(new Computer() {
              public Object run(Object o) {
                return new Integer(((Integer)o).intValue()
                                   * ((Integer)r2.v).intValue());
              }}, r2.s);
        }

      }
    }

    return new Result(new Computer() {
        public Object run(Object o) {
          return o;
        }}, s);
  }

  // ************************************************************************

  public Result pPrimary(String s) {
    if (DEBUG) System.out.println("pPrimary          " + s);

    if (0 < s.length()) {
      char c1 = s.charAt(0);

      if ('(' == c1) {
        Result r1 = pAdditive(s.substring(1));
        if (r1.parsed) {

          if (0 < r1.s.length()) {
            char c2 = r1.s.charAt(0);

            if (')' == c2) {
              return new Result(r1.v, r1.s.substring(1));
            }
          }
        }
      }
    }

    return pDecimal(s);
  }

  // ************************************************************************

  public Result pDecimal(String s) {
    if (DEBUG) System.out.println("pDecimal          " + s);

    if (0 < s.length()) {
      char c1 = s.charAt(0);

      if (('0' <= c1) && (c1 <= '9')) {
        return new Result(new Integer(c1 - '0'), s.substring(1));
      }
    }

    return NO_PARSE;
  }

  // ************************************************************************

  public static void main(String[] args) {
    if (0 < args.length) {
      Runtime runtime = Runtime.getRuntime();
      runtime.gc();
      long memory = runtime.totalMemory() - runtime.freeMemory();

      Arith  a = new Arith();
      Result r = a.pAdditive(args[0]);

      if (r.parsed) {
        System.out.println("* value = " + r.v);
      } else {
        System.out.println("* NO PARSE");
      }

      System.out.println();
      long memory2 = runtime.totalMemory() - runtime.freeMemory();
      System.out.println("* memory = " + Long.toString(memory2 - memory));
    } else {
      System.out.println("Usage: <expr>");
    }
  }
}
