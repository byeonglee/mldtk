package xtc.lang.marco.ast;

import static xtc.lang.marco.Util._assert;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import xtc.lang.marco.type.CodeType;
import xtc.tree.Location;

public class Fragment extends ExprAst {
  public final FragmentElement[] elements;
  public final int endLine, endColumn;
  public final Map<String, String[]> properties;

  protected Fragment(Location loc, CodeType type, FragmentElement[] elements, Map<String, String[]> properties,
      int endLine, int endColumn) {
    super(loc);
    this.elements = elements;
    this.resolvedType = type;
    this.endLine = endLine;
    this.endColumn = endColumn;
    this.properties = properties;
  }

  public boolean isIntentionalCapture(String id) {
    if (properties.containsKey("capture")) {
      for (String s : properties.get("capture")) {
        if (s.equals(id))
          return true;
      }
      return false;
    } else {
      return false;
    }
  }

  public boolean isEnclosingClassNameForMdecl(int ord) {
    if (properties.containsKey("class")) {
      for (String s : properties.get("class")) {
        if (s.equals(String.format("b%d", ord))) {
          return true;
        }
      }
      return false;
    } else {
      return false;
    }
  }

  public String[] getTypeNames() {
    if (properties.containsKey("tname")) {
      return properties.get("tname");
    } else {
      return new String[0];
    }
  }

  Blank getBlank(int ordinal) {
    int bid = 0;
    for (FragmentElement e : elements) {
      if (e instanceof Blank) {
        if (ordinal == bid)
          return (Blank) e;
        bid++;
      }
    }
    _assert(false);
    return null;
  }

  public Set<Blank> getMustEqualBlanks() {
    Set<Blank> s = new HashSet<Blank>();
    if (properties.containsKey("equal")) {
      for (String b : properties.get("equal")) {
        if (b.matches("b\\d+")) {
          Matcher m = Pattern.compile("b(\\d+)").matcher(b);
          m.matches();
          int bid = Integer.parseInt(m.group(1));
          s.add(getBlank(bid));
        }
      }
    }
    return s;
  }

  public boolean hasProperty(String prop) {
    return properties.containsKey(prop);
  }

  public CodeType getCodeType() {
    return (CodeType) resolvedType;
  }

  public int getSize() {
    return elements.length;
  }

  public final void accept(final Visitor visitor) {
    visitor.visit(this);
  }

  public final String getText() {
    StringBuilder b = new StringBuilder();
    boolean first = true;
    int no = 0;
    for (FragmentElement e : elements) {
      if (first) {
        first = false;
      } else {
        b.append(' ');
      }
      if (e instanceof ObjectToken) {
        b.append(((ObjectToken) e).value);
      } else if (e instanceof ObjectId) {
        b.append(((ObjectId) e).name);
      } else if (e instanceof Blank) {
        b.append("$b" + no++);
      } else {
        _assert(false, "unreachable");
      }
    }
    return b.toString();
  }

  public List<Blank> getBlanks() {
    LinkedList<Blank> l = new LinkedList<Blank>();
    for (FragmentElement e : elements) {
      if (e instanceof Blank) {
        l.add((Blank) e);
      }
    }
    return l;
  }

}
