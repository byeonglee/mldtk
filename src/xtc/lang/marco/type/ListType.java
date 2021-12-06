package xtc.lang.marco.type;

public final class ListType extends CompositeType {
  public final Type elementType;

  @SuppressWarnings("unused")
  private ListType() {
    elementType = null;
  }

  public ListType(Type _elementType) {
    assert _elementType != null;
    elementType = _elementType;
  }

  public Type getIterationType() {
    return elementType;
  }

  public boolean typeEquals(Type t) {
    if (t instanceof ListType) {
      ListType lt = (ListType) t;
      return elementType.typeEquals(lt.elementType);
    } else {
      return false;
    }
  }

  public String toExpression() {
    return String.format("list(%s)", elementType.toExpression());
  }
}
