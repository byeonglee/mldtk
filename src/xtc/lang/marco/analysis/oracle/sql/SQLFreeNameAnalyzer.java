package xtc.lang.marco.analysis.oracle.sql;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.join;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import xtc.lang.marco.analysis.oracle.IFreeNameOracle;
import xtc.lang.marco.analysis.oracle.util.Query;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.FragmentElement;
import xtc.lang.marco.ast.ObjectId;
import xtc.lang.marco.ast.ObjectToken;
import xtc.lang.marco.run.McCode;
import xtc.lang.marco.run.McToken;
import xtc.lang.marco.type.CodeType;

public class SQLFreeNameAnalyzer implements IFreeNameOracle {
  final CodeType fragType;
  final List<String> tokens = new LinkedList<String>();
  final Set<String> freeNames = new TreeSet<String>();

  public SQLFreeNameAnalyzer(Fragment m) {
    int bno = 0;
    fragType = (CodeType) m.resolvedType;
    String phrase = fragType.phrase;
    for (FragmentElement fe : m.elements) {
      if (fe instanceof ObjectId) {
        tokens.add(((ObjectId) fe).name);
      } else if (fe instanceof ObjectToken) {
        tokens.add(((ObjectToken) fe).value);
      } else if (fe instanceof Blank) {
        if (phrase.equals("stmt")) {
          // no free names for statement
        } else if (phrase.equals("expr")) {
          tokens.add("$" + bno++);
        } else {
          _assert(false, "Unreachable");
        }
      } else {
        _assert(false, "Unreachable");
      }
    }
  }

  public SQLFreeNameAnalyzer(CodeType ct, McCode c) {
    fragType = ct;
    for (McToken t : c.tokens) {
      tokens.add(t.value);
    }
  }

  public Set<String> getFreeNames() {
    String msg;
    do {
      Query q = buildQuery();
      msg = SQLOracle.executeQuery(q);
    } while (msg != null && !handleError(msg));
    return freeNames;
  }

  Query buildQuery() {
    Query q = new Query();
    if (fragType.phrase.equals("expr")) {
      if (freeNames.size() > 0) {
        q.append("create table A (%s)", join(freeNames, ","));
      } else {
        q.append("create table A (a)");
      }
      q.append("select * from A where %s", join(tokens, " "));
    } else if (fragType.phrase.equals("stmt")) {
      q.append("%s", join(tokens, " "));
    } else {
      _assert(false, "TBI");
    }
    return q;
  }

  boolean handleError(String error) {
    if (m(error, "^no such column: (.+)$")) {
      String column = g(1);
      freeNames.add(column);
      return false;
    } else {
      return true;
    }
  }

  private Matcher m;

  private boolean m(String line, String p) {
    m = Pattern.compile(p).matcher(line);
    return m.matches();
  }

  private String g(int i) {
    return m.group(i);
  }
}
