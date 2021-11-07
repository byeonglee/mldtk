package xtc.playground;

/** A packrat parser for a simple arithmetic language. */
public class Arith3 {
 
  protected static final boolean DEBUG = false;

  // ************************************************************************

  public static class Result {
    public final boolean hasValue;
    public final Arith3  parser;

    public Result(boolean hasValue, Arith3 parser) {
      this.hasValue = hasValue;
      this.parser   = parser;
    }

    public Result select(Result o) {
      if ((! this.hasValue) && (! o.hasValue)) {
        if (this.parser.s.length() >= o.parser.s.length()) {
          return o;
        } else {
          return this;
        }
      } else {
        return o;
      }
    }
  }

  public static class SemanticValue extends Result {
    public final Object value;

    public SemanticValue(Object value, Arith3 next) {
      super(true, next);
      this.value = value;
    }
  }

  public static class CharValue extends Result {
    public final char   value;

    public CharValue(char value, Arith3 next) {
      super(true, next);
      this.value = value;
    }
  }

  public static class ParseError extends Result {
    public final String msg;
    
    public ParseError(String msg, Arith3 parser) {
      super(false, parser);
      this.msg    = msg;
    }
  }

  // ************************************************************************

  protected static int instances = 0;

  protected final String s;

  protected String file;
  protected int    line;
  protected int    column;

  protected Result fChar;

  protected Result fAdditive;
  protected Result fAdditiveSuffix;
  protected Result fMultitive;
  protected Result fMultitiveSuffix;
  protected Result fPrimary;
  protected Result fDecimal;

  public Arith3(String s, String file) {
    this.s    = s;
    this.file = file;
    line      = 1;
    column    = 1;

    instances++;
  }

  public Arith3(Arith3 previous) {
    s    = previous.s.substring(1);
    file = previous.file;

    if (0 < s.length()) {
      char c = s.charAt(0);
      if ('\r' == c) {
        line   = previous.line + 1;
        column = 0;
      } else if ('\n' == c) {
        if ('\r' == previous.s.charAt(0)) {
          line   = previous.line;
          column = previous.column;
        } else {
          line   = previous.line + 1;
          column = 0;
        }
      } else {
        line   = previous.line;
        column = previous.column + 1;
      }
    } else {
      line   = previous.line;
      column = previous.column + 1;
    }

    instances++;
  }

  // ************************************************************************

  public String toString() {
    StringBuffer buf = new StringBuffer();

    buf.append(file);
    buf.append(" @ l: ");
    buf.append(Integer.toString(line));
    buf.append(", c: ");
    buf.append(Integer.toString(column));
    buf.append(" - ");
    if (10 > s.length()) {
      buf.append(s);
    } else {
      buf.append(s.substring(0,19));
      buf.append("...");
    }
    return buf.toString();
  }

  // ************************************************************************

  public Result parseChar() {
    if (null == fChar) fChar = parseChar1();
    return fChar;
  }

  protected Result parseChar1() {
    if (0 < s.length()) {
      return new CharValue(s.charAt(0), new Arith3(this));
    } else {
      return new ParseError("End-of-file", this);
    }
  }

  // ************************************************************************

  public Result parseAdditive() {
    if (null == fAdditive) fAdditive = parseAdditive1();
    return fAdditive;
  }

  protected Result parseAdditive1() {
    if (DEBUG) System.out.println("parseAdditive1:        " + toString());

    Arith3 parser;
    Result result;
    Object value;

    parser = this;
    result = parser.parseMultitive();
    if (result.hasValue) {
      final Integer i = (Integer)((SemanticValue)result).value;

      parser = result.parser;
      result = parser.parseAdditiveSuffix();
      if (result.hasValue) {
        final Computer c = (Computer)((SemanticValue)result).value;
        
        value = c.run(i);
        
        return new SemanticValue(value, result.parser);
      }
    }

    return result;
  }

  // ************************************************************************

  public Result parseAdditiveSuffix() {
    if (null == fAdditiveSuffix) fAdditiveSuffix = parseAdditiveSuffix1();
    return fAdditiveSuffix;
  }

  protected Result parseAdditiveSuffix1() {
    if (DEBUG) System.out.println("parseAdditiveSuffix1:  " + toString());

    Arith3  parser;
    Result  result;
    Object  value;

    boolean first = false;

    parser = this;
    result = parser.parseChar();
    if (result.hasValue) {
      final char c1= ((CharValue)result).value;

      if ('+' == c1) {

        first = true;

        parser = result.parser;
        result = parser.parseMultitive();
        if (result.hasValue) {
          final Integer i = (Integer)((SemanticValue)result).value;

          parser = result.parser;
          result = parser.parseAdditiveSuffix();
          if (result.hasValue) {
            final Computer c = (Computer)((SemanticValue)result).value;

            value = new Computer() {
                public Object run(Object o) {
                  Integer i2 = new
                    Integer(((Integer)o).intValue() + i.intValue());
                  return c.run(i2);
                }};

            return new SemanticValue(value, result.parser);
          }
        }

      } else if ('-' == c1) {

        first = true;

        parser = result.parser;
        result = parser.parseMultitive();
        if (result.hasValue) {
          final Integer i = (Integer)((SemanticValue)result).value;

          parser = result.parser;
          result = parser.parseAdditiveSuffix();
          if (result.hasValue) {
            final Computer c = (Computer)((SemanticValue)result).value;

            value = new Computer() {
                public Object run(Object o) {
                  Integer i2 = new
                    Integer(((Integer)o).intValue() - i.intValue());
                  return c.run(i2);
                }};

            return new SemanticValue(value, result.parser);
          }
        }
      } else {

        result = new ParseError("Expected \'+\' or \'-\'", parser);
      }
    } else {

      result = new ParseError("End-of-file, expected \'+\' or \'-\'", parser);
    }

    if (! first) {
      value = new Computer() {
          public Object run(Object o) {
            return o;
          }};

      return new SemanticValue(value, this);
    }

    return result;
  }
  
  // ************************************************************************

  public Result parseMultitive() {
    if (null == fMultitive) fMultitive = parseMultitive1();
    return fMultitive;
  }

  protected Result parseMultitive1() {
    if (DEBUG) System.out.println("parseMultitive1:       " + toString());

    Arith3 parser;
    Result result;
    Object value;

    parser = this;
    result = parser.parsePrimary();
    if (result.hasValue) {
      final Integer i = (Integer)((SemanticValue)result).value;

      parser = result.parser;
      result = parser.parseMultitiveSuffix();
      if (result.hasValue) {
        final Computer c = (Computer)((SemanticValue)result).value;
        
        value = c.run(i);
        
        return new SemanticValue(value, result.parser);
      }
    }

    return result;
  }

  // ************************************************************************

  public Result parseMultitiveSuffix() {
    if (null == fMultitiveSuffix) fMultitiveSuffix = parseMultitiveSuffix1();
    return fMultitiveSuffix;
  }

  protected Result parseMultitiveSuffix1() {
    if (DEBUG) System.out.println("parseMultitiveSuffix1: " + toString());

    Arith3  parser;
    Result  result;
    Object  value;

    boolean first  = false;
    
    parser = this;
    result = parser.parseChar();
    if (result.hasValue) {
      final char c1= ((CharValue)result).value;

      if ('*' == c1) {

        first = true;

        parser = result.parser;
        result = parser.parsePrimary();
        if (result.hasValue) {
          final Integer i = (Integer)((SemanticValue)result).value;

          parser = result.parser;
          result = parser.parseMultitiveSuffix();
          if (result.hasValue) {
            final Computer c = (Computer)((SemanticValue)result).value;

            value = new Computer() {
                public Object run(Object o) {
                  Integer i2 = new
                    Integer(((Integer)o).intValue() * i.intValue());
                  return c.run(i2);
                }};

            return new SemanticValue(value, result.parser);
          }
        }

      } else {

        result = new ParseError("Expected \'*\'", parser);
      }
    } else {

      result = new ParseError("End-of-file, expected \'*\'", parser);
    }

    if (! first) {
      value = new Computer() {
          public Object run(Object o) {
            return o;
          }};
      
      return new SemanticValue(value, this);
    }

    return result;
  }

  // ************************************************************************

  public Result parsePrimary() {
    if (null == fPrimary) fPrimary = parsePrimary1();
    return fPrimary;
  }

  protected Result parsePrimary1() {
    if (DEBUG) System.out.println("parsePrimary1:         " + toString());

    Arith3 parser;
    Result result;
    Object value;

    parser = this;
    result = parser.parseChar();
    if (result.hasValue) {
      final char c1 = ((CharValue)result).value;

      if ('(' == c1) {

        parser = result.parser;
        result = parser.parseAdditive();
        if (result.hasValue) {
          final Integer i = (Integer)((SemanticValue)result).value;

          parser = result.parser;
          result = parser.parseChar();
          if (result.hasValue) {
            final char c2 = ((CharValue)result).value;

            if (')' == c2) {

              value = i;

              return new SemanticValue(value, result.parser);
            } else {

              result = new ParseError("Expected \')\'", parser);
            }
          } else {

            result = new ParseError("End-of-file, expected \')\'", parser);
          }
        }
      } else {

        result = new ParseError("Expected \'(\'", parser);
      }        
    } else {
      result = new ParseError("End-of-file, expected \'(\'", parser);
    }

    parser = this;
    result = result.select(parser.parseDecimal());
    if (result.hasValue) {
      final Integer i = (Integer)((SemanticValue)result).value;

      value = i;

      return new SemanticValue(value, result.parser);
    }

    return result;
  }

  // ************************************************************************

  public Result parseDecimal() {
    if (null == fDecimal) fDecimal = parseDecimal1();
    return fDecimal;
  }

  protected Result parseDecimal1() {
    if (DEBUG) System.out.println("parseDecimal1:         " + toString());

    Arith3 parser;
    Result result;
    Object value;

    parser = this;
    result = parser.parseChar();
    if (result.hasValue) {
      final char c1 = ((CharValue)result).value;

      if (('0' <= c1) && (c1 <= '9')) {

        value = new Integer(c1 - '0');

        return new SemanticValue(value, result.parser);
      } else {

        result = new ParseError("Expected digit", parser);
      }
    } else {

      result = new ParseError("End-of-file, expected digit", parser);
    }

    return result;
  }

  // ************************************************************************

  public static void main(String[] args) {
    if (0 < args.length) {
      Runtime runtime = Runtime.getRuntime();
      runtime.gc();
      long memory = runtime.totalMemory() - runtime.freeMemory();

      Arith3 parser = new Arith3(args[0], "console");
      Result r      = parser.parseAdditive();

      System.out.println();
      System.out.println("* length  = " + args[0].length());
      System.out.println("* parsers = " + instances);
      System.out.println();

      if (r.hasValue) {
        SemanticValue v = (SemanticValue)r;

        System.out.println("* value = " + v.value);
      } else {
        ParseError e = (ParseError)r;

        System.out.println("* error " + e.msg + " at " + e.parser);
        System.out.println();
        System.out.println(args[0]);
        for (int i=0; i<e.parser.column-1; i++) {
          System.out.print(" ");
        }
        System.out.println("^");

      }

      System.out.println();
      long memory2 = runtime.totalMemory() - runtime.freeMemory();
      System.out.println("* memory = " + Long.toString(memory2 - memory));
    } else {
      System.out.println("Usage: <expr>");
    }
  }

  }

interface Computer {
  public Object run(Object o);
}
  
