package xtc.lang.marco;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import xtc.lang.marco.ast.AstPrinter;
import xtc.lang.marco.ast.ProgramAst;
import xtc.lang.marco.ast.RatsMarcoParser;
import xtc.lang.marco.ast.SourceFileAnnotator;
import xtc.lang.marco.exception.ParsingFailureException;
import xtc.lang.marco.run.McToken;
import xtc.tree.Location;

public class Util {

  public static String join(String[] l, String sep) {
    LinkedList<String> ll = new LinkedList<String>();
    for (String s : l)
      ll.add(s);
    return join(ll, sep);
  }

  public static String join(List<McToken> tks, String sep) {
    LinkedList<String> l = new LinkedList<String>();
    for (McToken t : tks) {
      l.add(t.value);
    }
    return join(l, sep);
  }

  public static String join(Collection<String> c, String sep) {
    StringBuilder sb = new StringBuilder();
    boolean first = true;
    for (final String s : c) {
      if (first) {
        first = false;
      } else {
        sb.append(sep);
      }
      sb.append(s);
    }
    return sb.toString();
  }

  public static void cat(File f) throws Exception {
    BufferedReader l = new BufferedReader(new FileReader(f));
    int lineNo = 1;
    for (String line = l.readLine(); line != null; line = l.readLine()) {
      out("%4d %s\n", lineNo, line);
      lineNo++;
    }
    l.close();
  }

  public static void cat(String f, int begin, int end) {
    cat(new File(f), begin, end);
  }

  public static void cat(File f, int begin, int end) {
    try {
      BufferedReader l = new BufferedReader(new FileReader(f));
      int lineNo = 1;
      String line;
      while ((line = l.readLine()) != null) {
        if ((lineNo >= begin) && (lineNo <= end)) {
          System.out.printf("%4d %s\n", lineNo, line);
        }
        lineNo++;
      }
      l.close();
    } catch (Exception e) {
      e.printStackTrace();
      assert false;
    }
  }

  public static List<String> readlines(String file) throws IOException {
    return readlines(new FileInputStream(file));
  }

  public static List<String> readlines(InputStream is) throws IOException {
    return readlines(new InputStreamReader(is));
  }

  public static List<String> readlines(Reader r) throws IOException {
    BufferedReader br = new BufferedReader(r);
    LinkedList<String> msgs = new LinkedList<String>();
    for (String line = br.readLine(); line != null; line = br.readLine()) {
      msgs.add(line);
    }
    return msgs;
  }

  public static String findCompiler(String name) {
    for (String path : System.getenv("PATH").split(":")) {
      File fpath = new File(path);
      if (fpath.isDirectory()) {
        for (File file : fpath.listFiles()) {
          if (file.getName().equals(name)) {
            return file.getAbsolutePath();
          }
        }
      }
    }
    _assert(false, "failed in finding a %s compiler", name);
    return null;
  }

  public static ProgramAst getAst(final InputStream is, final String sourceFile) throws Exception {
    final ProgramAst prg;
    Reader reader = new InputStreamReader(is);
    RatsMarcoParser parser = new RatsMarcoParser(reader, sourceFile);
    xtc.parser.Result result = parser.pprogram(0);
    if (!result.hasValue()) {
      Location loc = parser.location(result.index);
      System.err.println(loc.toString() + ": Syntax error.");
      throw new ParsingFailureException();
    }
    prg = (ProgramAst) result.semanticValue();
    new SourceFileAnnotator(sourceFile).visit(prg);
    if (CmdOptions.printAst())
      new AstPrinter(new PrintWriter(System.out, true)).visit(prg);
    return prg;
  }

  public static void _assert(boolean val) {
    if (val == false) {
      System.err.printf("assertion fail:\n");
      new Throwable().printStackTrace();
      System.exit(1);
    }
  }

  public static void _assert(boolean val, String fmt, Object... args) {
    if (val == false) {
      SourceLineLocation loc = here();
      ArrayList<Object> l = new ArrayList<Object>(args.length + 2);
      l.add(loc.sourceFile);
      l.add(loc.line);
      for (Object o : args)
        l.add(o);
      System.err.printf("%s:%d: assertion fail: " + fmt + "\n", l.toArray());
      new Throwable().printStackTrace();
      System.exit(1);
    }
  }

  public static void out(String fmt, Object... args) {
    System.out.printf(fmt, args);
    System.out.flush();
  }

  public static class SourceLineLocation {
    public final String sourceFile;
    public final int line;

    public SourceLineLocation(String sourceFile, int line) {
      this.sourceFile = sourceFile;
      this.line = line;
    }
  }

  public static SourceLineLocation here() {
    Throwable t = new Throwable();
    StackTraceElement e = t.getStackTrace()[2];
    return new SourceLineLocation(e.getFileName(), e.getLineNumber());
  }

  public static void indentCpp(File i, File o) throws IOException {
    Process p = Runtime.getRuntime().exec(new String[] { "indent", i.getPath(), "-o", o.getPath() });
    try {
      int result = p.waitFor();
      if (result != 0) {
        FileWriter w = new FileWriter(o);
        for (String line : readlines(i.getPath())) {
          w.write(line);
          w.write('\n');
        }
        w.close();
      }
    } catch (InterruptedException e) {
    }
  }
}
