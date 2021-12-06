package xtc.lang.marco.analysis.oracle.sql;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;

import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import xtc.lang.marco.CmdOptions;
import xtc.lang.marco.analysis.oracle.ICapturedNameOracle;
import xtc.lang.marco.analysis.oracle.util.Query;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.FragmentElement;
import xtc.lang.marco.ast.ObjectId;
import xtc.lang.marco.ast.ObjectToken;

public class SQLCapturedNameAnalyzer implements ICapturedNameOracle {
  final Fragment f;
  final Blank b;
  final String freeName;
  boolean isCaptured = false;

  public SQLCapturedNameAnalyzer(Fragment f, Blank b, String freeName) {
    this.f = f;
    this.b = b;
    this.freeName = freeName;
  }

  public boolean isCapture() {
    String msg;
    do {
      Query q = buildQuery();
      msg = SQLOracle.executeQuery(q);
    } while (!handleError(msg));
    return isCaptured;
  }

  Query buildQuery() {
    Query q = new Query();
    String phrase = f.getCodeType().phrase;
    if (phrase.equals("stmt")) {
      LinkedList<String> tokens = new LinkedList<String>();
      int bno = 0;
      for (FragmentElement fe : f.elements) {
        if (fe instanceof ObjectId) {
          tokens.add(((ObjectId) fe).name);
        } else if (fe instanceof ObjectToken) {
          tokens.add(((ObjectToken) fe).value);
        } else if (fe instanceof Blank) {
          Blank _b = (Blank) fe;
          String bphrase = _b.getCodeType().phrase;
          if (b == _b) {
            if (bphrase.equals("expr")) {
              tokens.add(freeName);
            } else if (bphrase.equals("stmt")) {
              _assert(false, "TBI");
            } else {
              _assert(false, "TBI");
            }
          } else {
            tokens.add("$b" + bno++);
          }
        } else {
          _assert(false, "unreachable");
        }
      }
      q.append("%s", join(tokens, " "));
    } else {
      _assert(false, "TBI");
    }
    return q;
  }

  boolean handleError(String error) {
    if (error == null) {
      isCaptured = true;
      if (CmdOptions.printOracleQuery()) {
        out("log_query: concluding \"%s\" is captured.\n", freeName);
      }
      return true;
    } else if (m(error, "^near \"(.+)\": syntax error$")) {
      _assert(false, "TBI");
      return false;
    } else if (m(error, "no such column: (.+)")) {
      String name = g(1);
      if (name.equals(freeName)) {
        isCaptured = false;
      } else {
        _assert(false, "TBI");
      }
      return false;
    } else {
      _assert(false, "TBI");
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
