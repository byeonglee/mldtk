package xtc.lang.marco.analysis.oracle.util;

import static xtc.lang.marco.Util._assert;
import static xtc.lang.marco.Util.join;

import java.io.Writer;
import java.util.LinkedList;
import java.util.List;

public class Query {
  public final List<String> lines = new LinkedList<String>();

  public int getCurrentLineNumber() {
    return lines.size() + 1;
  }

  public void append(String format, Object... args) {
    String line = String.format(format, args);
    _assert(line.indexOf('\n') == -1, "No newlines are allowed");
    lines.add(line);
  }

  public void write(Writer w) throws Exception {
    for (String line : lines) {
      w.write(line);
      w.write('\n');
    }
  }

  public String getString() {
    return join(lines, " ");
  }
}
