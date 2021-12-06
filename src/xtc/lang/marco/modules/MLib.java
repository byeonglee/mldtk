package xtc.lang.marco.modules;

import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;

import java.io.File;
import java.io.FileReader;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import xtc.lang.marco.run.McCode;
import xtc.lang.marco.run.McObject;
import xtc.lang.marco.run.McObject.McCodeCunit;
import xtc.lang.marco.run.McObject.McInt;
import xtc.lang.marco.run.McObject.McList;
import xtc.lang.marco.run.McObject.McNull;
import xtc.lang.marco.run.McObject.McString;
import xtc.lang.marco.run.McToken;

public class MLib {

  public static McObject write(McCodeCunit cunit, McString file) throws Exception {
    PrintWriter w = new PrintWriter(new File(file.v));
    for (String t : cunit.cppPrologue) {
      w.printf("%s\n", t);
    }
    for (McToken t : cunit.tokens) {
      w.printf("%s\n", t.value);
    }
    for (String t : cunit.cppEpilogue) {
      w.printf("%s\n", t);
    }
    w.close();
    return McNull.NULL;
  }

  public static McObject print(McString s) {
    System.out.printf("%s\n", s.v);
    return McNull.NULL;
  }

  public static McInt atoi(McString s) {
    return new McInt(Integer.parseInt(s.v));
  }

  public static void show(McCode c) {
    LinkedList<String> l = new LinkedList<String>();
    for (McToken t : c.tokens) {
      l.add(t.value);
    }
    out("%s\n", join(l, " "));
  }

  public static McList range(McInt count) {
    McList l = new McList();
    for (int i = 0; i < count.v; i++) {
      l.add(new McInt(i));
    }
    return l;
  }

  public static McCode getSQLExprFromFile(McString filename) throws Exception {
    List<McToken> tokens = new LinkedList<McToken>();
    LineNumberReader in = new LineNumberReader(new FileReader(filename.v));
    int state = 0; // WS is 0, and SCAN is 1.
    StringBuffer token = null;
    L: while (true) {
      int c = in.read();
      switch (state) {
      case 0:
        if (c < 0) {
          break L;
        } else if (!Character.isWhitespace(c)) {
          token = new StringBuffer();
          token.append((char) c);
          state = 1;
        }
        break;
      case 1:
        if (c < 0) {
          tokens.add(new McToken(filename.v, in.getLineNumber() + 1, 1, token.toString()));
          break L;
        } else if (Character.isWhitespace(c)) {
          tokens.add(new McToken(filename.v, in.getLineNumber() + 1, 1, token.toString()));
          state = 0;
        } else {
          token.append((char) c);
        }
        break;
      }
    }
    in.close();
    return new McCode(tokens);
  }
}
