package xtc.lang.marco.run;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public abstract class McObject {

  public static class McString extends McObject {
    public final String v;

    public McString(String v) {
      this.v = v;
    }

    public int hashCode() {
      return v.hashCode();
    }

    public boolean equals(Object obj) {
      if (obj instanceof McString) {
        return v.equals(((McString) obj).v);
      } else {
        return false;
      }
    }
  }

  public static class McList extends McObject {
    public final LinkedList<McObject> l = new LinkedList<McObject>();

    public void add(McObject o) {
      l.add(o);
    }

    public McObject get(McInt i) {
      return l.get(i.v);
    }

    public McInt size() {
      return new McInt(l.size());
    }

    public boolean contains(McObject o) {
      return l.contains(o);
    }
  }

  public static class McInt extends McObject {
    public final int v;

    public McInt(int i) {
      this.v = i;
    }

    public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + v;
      return result;
    }

    public boolean equals(Object obj) {
      if (this == obj)
        return true;
      if (obj == null)
        return false;
      if (getClass() != obj.getClass())
        return false;
      McInt other = (McInt) obj;
      if (v != other.v)
        return false;
      return true;
    }
  }

  public static class McBoolean extends McObject {
    public final static McBoolean TRUE = new McBoolean(true);
    public final static McBoolean FALSE = new McBoolean(false);
    final boolean v;

    private McBoolean(boolean v) {
      this.v = v;
    }
  }

  public static class McNull extends McObject {
    public static final McNull NULL = new McNull();

    private McNull() {
    }
  }

  public static class McTuple extends McObject {
    final HashMap<String, McObject> values = new HashMap<String, McObject>();

    public void add(String attr, McObject val) {
      values.put(attr, val);
    }

    McObject get(String attr) {
      return values.get(attr);
    }
  }

  public static class McCodeCunit extends McCode {
    public final List<String> cppPrologue = new LinkedList<String>();
    public final List<String> cppEpilogue = new LinkedList<String>();

    public McCodeCunit(List<McToken> tokens) {
      super(tokens);
    }
  }
}
