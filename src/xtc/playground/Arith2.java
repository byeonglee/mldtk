package xtc.playground;

/** A packrat parser for a simple arithmetic language. */
public class Arith2 {
  
  public static final boolean SIMPLE = false;

  // ************************************************************************

  public static interface Computer {
    public Object run(Object o);
  }
  
  // ************************************************************************

  public static class Result {
    public boolean parsed;
    public Object  v;
    public Derivs  d;

    public Result() {
      parsed = false;
    }

    public Result(Object v, Derivs d) {
      parsed = true;
      this.v = v;
      this.d = d;
    }
  }

  // ************************************************************************

  public static class Derivs {
    public static int instances = 0;

    public Result dvAdditive;
    public Result dvAdditiveSuffix;
    public Result dvMultitive;
    public Result dvMultitiveSuffix;
    public Result dvPrimary;
    public Result dvDecimal;
    public Result dvChar;
    public String s;

    public Derivs(String s) {
      // if (DEBUG) System.out.println("new Derivs        " + s);
      this.s = s;
      instances++;
    }

    public Result additive() {
      if (null == dvAdditive) {
        dvAdditive = pAdditive(this);
      }
      return dvAdditive;
    }

    public Result additiveSuffix() {
      if (null == dvAdditiveSuffix) {
        dvAdditiveSuffix = pAdditiveSuffix(this);
      }
      return dvAdditiveSuffix;
    }

    public Result multitive() {
      if (null == dvMultitive) {
        dvMultitive = pMultitive(this);
      }
      return dvMultitive;
    }

    public Result multitiveSuffix() {
      if (null == dvMultitiveSuffix) {
        dvMultitiveSuffix = pMultitiveSuffix(this);
      }
      return dvMultitiveSuffix;
    }

    public Result primary() {
      if (null == dvPrimary) {
        dvPrimary = pPrimary(this);
      }
      return dvPrimary;
    }

    public Result decimal() {
      if (null == dvDecimal) {
        dvDecimal = pDecimal(this);
      }
      return dvDecimal;
    }

    public Result getChar() {
      if (null == dvChar) {
        if (0 < s.length()) {
          dvChar = new Result(new Character(s.charAt(0)),
                              new Derivs(s.substring(1)));
        } else {
          dvChar = NO_PARSE;
        }
      }
      return dvChar;
    }

    public String toString() {
      StringBuffer buf = new StringBuffer();

      if (null == dvAdditive       ) buf.append('_'); else buf.append('v');
      if (! SIMPLE) {
        if (null == dvAdditiveSuffix ) buf.append('_'); else buf.append('v');
      }
      if (null == dvMultitive      ) buf.append('_'); else buf.append('v');
      if (! SIMPLE) {
        if (null == dvMultitiveSuffix) buf.append('_'); else buf.append('v');
      }
      if (null == dvPrimary        ) buf.append('_'); else buf.append('v');
      if (null == dvDecimal        ) buf.append('_'); else buf.append('v');
      buf.append(' ');
      if (null == dvChar           ) buf.append('_'); else {
        if (dvChar.parsed) {
          buf.append(((Character)dvChar.v).charValue());
        } else {
          buf.append('_');
        }
      }

      return buf.toString();
    }

  }


  // ************************************************************************

  public static final Result  NO_PARSE = new Result();

  public static final boolean DEBUG    = false;

  // ************************************************************************

  public static Result pAdditive(Derivs d) {
    if (DEBUG) System.out.println("pAdditive         " + d.s);

    if (SIMPLE) {
      final Result r1 = d.multitive();
      if (r1.parsed) {

        final Result r2 = r1.d.getChar();
        if (r2.parsed) {

          final char c2 = ((Character)r2.v).charValue();
          if ('+' == c2) {

            final Result r3 = r2.d.additive();
            if (r3.parsed) {
              
              return new Result(new Integer(((Integer)r1.v).intValue()
                                            + ((Integer)r3.v).intValue()),
                                r3.d);
            }
          }
        }
      }

      return d.multitive();

    } else {
      final Result r1 = d.multitive();
      if (r1.parsed) {
        
        final Result r2 = r1.d.additiveSuffix();
        if (r2.parsed) {

          return new Result(((Computer)r2.v).run(r1.v), r2.d);
        }
      }

      return NO_PARSE;
    }
  }
  
  // ************************************************************************

  public static Result pAdditiveSuffix(Derivs d) {
    if (DEBUG) System.out.println("pAdditiveSuffix   " + d.s);

    final Result r1 = d.getChar();
    if (r1.parsed) {

      final char c1 = ((Character)r1.v).charValue();
      if ('+' == c1) {

        final Result r2 = r1.d.multitive();
        if (r2.parsed) {

          final Result r3 = r2.d.additiveSuffix();
          if (r3.parsed) {

            return new Result(new Computer() {
                public Object run(Object o) {
                  Integer i = new Integer(((Integer)o).intValue()
                                          + ((Integer)r2.v).intValue());
                  return ((Computer)r3.v).run(i);
                }}, r3.d);
          }
        }

      } else if ('-' == c1) {

        final Result r2 = r1.d.multitive();
        if (r2.parsed) {

          final Result r3 = r2.d.additiveSuffix();
          if (r3.parsed) {

            return new Result(new Computer() {
                public Object run(Object o) {
                  Integer i = new Integer(((Integer)o).intValue()
                                          - ((Integer)r2.v).intValue());
                  return ((Computer)r3.v).run(i);
                }}, r3.d);
          }
        }
      }
    }

    return new Result(new Computer() {
        public Object run(Object o) {
          return o;
        }}, d);
  }

  // ************************************************************************

  public static Result pMultitive(Derivs d) {
    if (DEBUG) System.out.println("pMultitive        " + d.s);

    if (SIMPLE) {
      final Result r1 = d.primary();
      if (r1.parsed) {

        final Result r2 = r1.d.getChar();
        if (r2.parsed) {

          final char c2 = ((Character)r2.v).charValue();
          if ('*' == c2) {

            final Result r3 = r2.d.multitive();
            if (r3.parsed) {
              
              return new Result(new Integer(((Integer)r1.v).intValue()
                                            * ((Integer)r3.v).intValue()),
                                r3.d);
            }
          }
        }
      }

      return d.primary();

    } else {
      final Result r1 = d.primary();
      if (r1.parsed) {
        
        final Result r2 = r1.d.multitiveSuffix();
        if (r2.parsed) {

          return new Result(((Computer)r2.v).run(r1.v), r2.d);
        }
      }
      
      return NO_PARSE;
    }
  }

  // ************************************************************************

  public static Result pMultitiveSuffix(Derivs d) {
    if (DEBUG) System.out.println("pMultitiveSuffix  " + d.s);

    final Result r1 = d.getChar();
    if (r1.parsed) {

      final char c1 = ((Character)r1.v).charValue();
      if ('*' == c1) {

        final Result r2 = r1.d.multitive();
        if (r2.parsed) {

          return new Result(new Computer() {
              public Object run(Object o) {
                return new Integer(((Integer)o).intValue()
                                   * ((Integer)r2.v).intValue());
              }}, r2.d);
        }

      }
    }

    return new Result(new Computer() {
        public Object run(Object o) {
          return o;
        }}, d);
  }

  // ************************************************************************

  public static Result pPrimary(Derivs d) {
    if (DEBUG) System.out.println("pPrimary          " + d.s);

    final Result r1 = d.getChar();
    if (r1.parsed) {

      final char c1 = ((Character)r1.v).charValue();
      if ('(' == c1) {

        final Result r2 = r1.d.additive();
        if (r2.parsed) {

          final Result r3 = r2.d.getChar();
          if (r3.parsed) {

            final char c3 = ((Character)r3.v).charValue();
            if (')' == c3) {

              return new Result(r2.v, r3.d);
            }
          }
        }
      }
    }

    return d.decimal();
  }

  // ************************************************************************

  public static Result pDecimal(Derivs d) {
    if (DEBUG) System.out.println("pDecimal          " + d.s);

    final Result r1 = d.getChar();
    if (r1.parsed) {

      final char c1 = ((Character)r1.v).charValue();
      if (('0' <= c1) && (c1 <= '9')) {
        return new Result(new Integer(c1 - '0'), r1.d);
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

      Derivs d = new Derivs(args[0]);
      Result r = d.additive();

      System.out.println();
      System.out.println("* length = " + args[0].length());
      System.out.println("* derivs = " + d.instances);
      System.out.println();

      if (DEBUG) {
        if (SIMPLE) System.out.println("   SIMPLE");

        Derivs dd = d;

        while (null != dd) {
          System.out.println("   " + dd.toString());
          dd = dd.dvChar.d;
        }

        System.out.println();
      }

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
