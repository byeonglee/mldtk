package xtc.lang.jeannie.doc;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

public class ExampleFormatter {
  static List<String> readLines(final Reader reader) throws IOException {
    final BufferedReader in = new BufferedReader(reader);
    final List<String> result = new ArrayList<String>();
    while (true) {
      final String line = in.readLine();
      if (null == line)
        break;
      assert -1 == line.indexOf('\t') : "tab character not supported";
      result.add(line);
    }
    return result;
  }
  static String rTrim(final String string) {
    int end = string.length();
    while (0 < end && Character.isWhitespace(string.charAt(end - 1)))
      end--;
    return string.substring(0, end);
  }
  static void writeLines(final Writer writer, final List<String> lines, final int width) {
    final PrintWriter out = new PrintWriter(writer);
    int lineNumber = 0;
    for (final String s : lines) {
      lineNumber++;
      final String t = s.replaceAll("@", "@@").replaceAll("([{}])", "@$1");
      out.print(t);
      for (int column=s.length(); column<width; column++)
        out.print(' ');
      out.print(" //");
      if (lineNumber < 10)
        out.print(' ');
      out.println(lineNumber);
    }
    out.flush();
  }
  public static void main(final String[] args) throws IOException {
    final Reader r = 0 == args.length ? new InputStreamReader(System.in) : new FileReader(args[0]);
    final List<String> lines = readLines(r);
    int width = 0;
    for (final String s : lines)
      width = Math.max(width, s.length());
    final Writer w = new OutputStreamWriter(System.out);
    writeLines(w, lines, width);
  }
}
