package xtc.lang.marco.type;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import xtc.lang.marco.Util;

public final class TupleType extends CompositeType {
  static interface INameTypePair {
    String getName();

    Type getType();
  }

  public static final class NameTypePair implements INameTypePair {
    final String name;
    final Type type;

    public NameTypePair(String name, Type type) {
      this.name = name;
      this.type = type;
    }

    public String getName() {
      return name;
    }

    public Type getType() {
      return type;
    }
  }

  final Map<String, Type> attributes = new HashMap<String, Type>();

  @SuppressWarnings("unused")
  private TupleType() {
  }

  public TupleType(NameTypePair[] pairs) {
    if (pairs == null) {
      return;
    }
    for (NameTypePair p : pairs) {
      String name = p.getName();
      Type type = p.getType();
      assert !attributes.containsKey(name);
      attributes.put(name, type);
    }
  }

  public Type getAttributeType(String name) {
    return attributes.get(name);
  }

  public boolean typeEquals(Type t) {
    if (t instanceof TupleType) {
      TupleType tt = (TupleType) t;
      if (tt.attributes.keySet().size() == attributes.keySet().size()) {
        for (String name : attributes.keySet()) {
          Type t1 = attributes.get(name);
          Type t2 = tt.attributes.get(name);
          if (!t1.typeEquals(t2)) {
            return false;
          }
        }
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  public String toExpression() {
    LinkedList<String> attrs = new LinkedList<String>();
    for (String name : attributes.keySet()) {
      Type type = attributes.get(name);
      attrs.add(String.format("attribute(%s,%s)", name, type.toExpression()));
    }
    return String.format("tuple(%s)", Util.join(attrs, ","));
  }
}
