package xtc.lang.marco.analysis.oracle.sql;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.out;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import xtc.lang.marco.CmdOptions;
import xtc.lang.marco.analysis.oracle.util.Query;
import xtc.lang.marco.modules.MLib;

public class SQLOracle {
  final static String BEGIN_TX = "begin transaction";
  final static String ROLLBACK_TX = "rollback transaction";

  static {
    try {
      Class.forName("org.sqlite.JDBC");
    } catch (Exception e) {
      _assert(false);
    }
  }

  public static String executeQuery(Query q) {
    java.sql.Connection con = null;
    Statement stmt = null;
    try {
      String pkgpath = MLib.class.getPackage().getName().replace('.', '/');
      String url = "jdbc:sqlite::resource:" + pkgpath + "/places.db";
      con = DriverManager.getConnection(url);
      stmt = con.createStatement();
      stmt.execute(BEGIN_TX);
      for (String ql : q.lines) {
        if (ql.startsWith("create")) {
          if (CmdOptions.printOracleQuery()) {
            out("log_query: executing \"%s\"\n", ql);
          }
          stmt.execute(ql);
        } else {
          if (CmdOptions.printOracleQuery()) {
            out("log_query: preparing \"%s\"\n", ql);
          }
          stmt.executeQuery(ql);
        }
      }
    } catch (SQLException e) {
      String msg = e.getMessage();
      if (CmdOptions.printOracleQuery()) {
        out("log_query: receiving the error message: \"%s\"\n\n", msg);
      }
      return msg;
    } finally {
      try {
        if (con != null) {
          if (CmdOptions.printOracleQuery()) {
            out("log_query: executing \"%s\"\n", ROLLBACK_TX);
          }
          stmt.execute(ROLLBACK_TX);
          con.close();
        }
      } catch (SQLException e) {
        _assert(false, "unreachable");
      }
    }
    if (CmdOptions.printOracleQuery()) {
      out("log_query: receiving no error message\n\n");
    }
    return null;
  }
}
