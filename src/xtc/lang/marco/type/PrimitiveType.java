package xtc.lang.marco.type;

public final class PrimitiveType extends Type {
  final String name;
  public static PrimitiveType VOID = new PrimitiveType("void");
  public static PrimitiveType BOOLEAN = new PrimitiveType("boolean");
  public static PrimitiveType INT = new PrimitiveType("int");
  public static PrimitiveType DOUBLE = new PrimitiveType("double");
  public static PrimitiveType STRING = new PrimitiveType("string");

  private PrimitiveType(String _name) {
    name = _name;
  }

  public boolean typeEquals(Type t) {
    return this == t;
  }

  public String toExpression() {
    return name;
  }
}
