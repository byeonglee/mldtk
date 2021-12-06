package xtc.lang.marco.analysis.oracle.sql;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;
import static xtc.lang.marco.Util.readlines;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import xtc.lang.marco.CmdOptions;
import xtc.lang.marco.Statistics;
import xtc.lang.marco.analysis.oracle.ISyntaxOracle;
import xtc.lang.marco.analysis.oracle.util.Query;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.FragmentElement;
import xtc.lang.marco.ast.ObjectId;
import xtc.lang.marco.ast.ObjectToken;
import xtc.lang.marco.exception.MarcoException;
import xtc.lang.marco.type.CodeType;

public class SQLSyntaxAnalyzer implements ISyntaxOracle {

  final Fragment f;
  int numberOfQueries = 0;

  SQLSyntaxAnalyzer(Fragment f) {
    this.f = f;
  }

  public boolean isAssignable(CodeType lhs, CodeType rhs) {
    return lhs.typeEquals(rhs);
  }

  public void checkSyntax() throws MarcoException {
    if (CmdOptions.printOracleQuery()) {
      out("\n");
      out("log_query: analyzing the fragment at %s:%d:%d\n", f.sourceFile, f._line, f.endColumn);
      try {
        List<String> lines = readlines(f.sourceFile);
        for (int i = f._line; i <= f.endLine; i++) {
          out("log_query: %s\n", lines.get(i - 1));
        }
      } catch (IOException e) {
      }
    }

    String emsg = null;
    do {
      Query q = buildQuery();
      emsg = SQLOracle.executeQuery(q);
      numberOfQueries++;
    } while ((emsg != null) && !handleError(emsg));

    if (CmdOptions.printStatistics()) {
      reportStatics();
    }
  }

  public void reportStatics() {
    Statistics.setNumbers(f, 0, numberOfQueries, 0, -1);
  }

  public String extractErrorMessage(SQLException e) {
    return e.getMessage();
  }

  public Query buildQuery() {
    if (f.getCodeType().phrase.equals("stmt")) {
      return buildQueryForSQLStmtFragment();
    } else if (f.getCodeType().phrase.equals("expr")) {
      return buildQueryForExprFragment();
    } else {
      _assert(false, "TBI");
      return null;
    }
  }

  Query buildQueryForExprFragment() {
    Query q = new Query();
    LinkedList<String> tokens = new LinkedList<String>();
    for (String t : new String[] { "select", "*", "where" }) {
      tokens.add(t);
    }
    for (FragmentElement e : f.elements) {
      if (e instanceof Blank) {
        Blank b = (Blank) e;
        CodeType btype = (CodeType) b.expr.resolvedType;
        if (btype.phrase.equals("expr")) {
          tokens.add("1");
        } else {
          throw new MarcoException(b, "The blank cannot be '%s' type.", btype.toExpression());
        }
      } else if (e instanceof ObjectId) {
        tokens.add(((ObjectId) e).name);
      } else if (e instanceof ObjectToken) {
        tokens.add(((ObjectToken) e).value);
      }
    }
    q.append("%s", join(tokens, " "));
    return q;
  }

  Query buildQueryForSQLStmtFragment() {
    Query q = new Query();
    LinkedList<String> tokens = new LinkedList<String>();
    for (FragmentElement e : f.elements) {
      if (e instanceof Blank) {
        Blank b = (Blank) e;
        CodeType btype = (CodeType) b.expr.resolvedType;
        if (btype.phrase.equals("expr")) {
          tokens.add("1");
        } else {
          _assert(false, "TBI for %s", b.expr.resolvedType.toExpression());
        }
      } else if (e instanceof ObjectId) {
        tokens.add(((ObjectId) e).name);
      } else if (e instanceof ObjectToken) {
        tokens.add(((ObjectToken) e).value);
      }
    }
    q.append("%s", join(tokens, " "));
    return q;
  }

  public boolean handleError(String error) {
    if (m(error, "^near \".+\": syntax error$")) {
      throw new MarcoException(f, error);
    } else {
      if (CmdOptions.printOracleQuery()) {
        out("log_query: ignoring the type error message: %s\n", error);
      }
      return true;
    }
  }

  private Matcher m;

  private boolean m(String line, String p) {
    m = Pattern.compile(p).matcher(line);
    return m.matches();
  }

}
