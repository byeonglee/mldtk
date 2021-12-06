package xtc.lang.marco;

import static xtc.lang.marco.Util.join;
import static xtc.lang.marco.Util.out;

import java.util.HashMap;
import java.util.Map;

import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.type.CodeType;

public class Statistics {
  int size;
  int backtracks;
  int queries;
  int declarations;
  int freenames;

  Statistics() {
  }

  public Statistics(int size, int backtracks, int queries, int declarations, int freenames) {
    this.size = size;
    this.backtracks = backtracks;
    this.queries = queries;
    this.declarations = declarations;
    this.freenames = freenames;
  }

  static class FragmentKey {
    final Fragment f;

    public FragmentKey(Fragment f) {
      this.f = f;
    }

    public int hashCode() {
      return f.sourceFile.hashCode();
    }

    public boolean equals(Object obj) {
      if (obj instanceof FragmentKey) {
        FragmentKey you = (FragmentKey) obj;
        return f.sourceFile.equals(you.f.sourceFile) && f._line == you.f._line && f._column == you.f._column;
      } else {
        return false;
      }
    }

  }

  static Map<FragmentKey, Statistics> fragments = new HashMap<FragmentKey, Statistics>();

  public static void main(String[] args) throws Exception {
    CmdOptions.processOptions(
        new String[] { "-pstat", "-dhs", "-di", "-mp", join(new String[] { "operators", "lib" }, ":") });

    for (String sfile : args) {
      Main.compile(sfile);
    }
    report();
  }

  public static void setNumbers(Fragment f, int backtracks, int queries, int decls, int freenames) {
    if (fragments.containsKey(new FragmentKey(f))) {
      return;
    }
    Statistics s = new Statistics(f.getSize(), backtracks, queries, decls, freenames);
    fragments.put(new FragmentKey(f), s);
    out("& %4d  & %4d & %4d & %4d & %20s & %s:%d\n", f.getSize(), backtracks, s.queries, s.declarations,
        f.getCodeType().toExpression(), f.sourceFile, f._line);
  }

  static class aggregate {
    final Statistics min = new Statistics(), max = new Statistics(), sum = new Statistics();
    int count = 0;

    float avgSize() {
      return sum.size / (float) count;
    }

    float avgBackTracks() {
      return sum.backtracks / (float) count;
    }

    float avgQueries() {
      return sum.queries / (float) count;
    }

    float avgDeclarations() {
      return sum.declarations / (float) count;
    }

    float avgFreenames() {
      return sum.freenames / (float) count;
    }
  }

  public static void report() {
    Map<CodeType, aggregate> s = new HashMap<CodeType, aggregate>();
    for (FragmentKey fk : fragments.keySet()) {
      Fragment f = fk.f;
      Statistics stat = fragments.get(fk);
      CodeType t = f.getCodeType();
      if (s.containsKey(t)) {
        aggregate g = s.get(t);

        if (stat.size < g.min.size)
          g.min.size = stat.size;
        if (stat.size > g.max.size)
          g.max.size = stat.size;
        g.sum.size += stat.size;

        if (stat.backtracks < g.min.backtracks)
          g.min.backtracks = stat.backtracks;
        if (stat.backtracks > g.max.backtracks)
          g.max.backtracks = stat.backtracks;
        g.sum.backtracks += stat.backtracks;

        if (stat.queries < g.min.queries)
          g.min.queries = stat.queries;
        if (stat.queries > g.max.queries)
          g.max.queries = stat.queries;
        g.sum.queries += stat.queries;

        if (stat.declarations < g.min.declarations)
          g.min.declarations = stat.declarations;
        if (stat.declarations > g.max.declarations)
          g.max.declarations = stat.declarations;
        g.sum.declarations += stat.declarations;

        if (stat.freenames < g.min.freenames)
          g.min.freenames = stat.freenames;
        if (stat.freenames > g.max.freenames)
          g.max.freenames = stat.freenames;
        g.sum.freenames += stat.freenames;

        g.count++;
      } else {
        aggregate g = new aggregate();
        s.put(t, g);
        g.min.size = g.max.size = g.sum.size = stat.size;
        g.min.queries = g.max.queries = g.sum.queries = stat.queries;
        g.min.declarations = g.max.declarations = g.sum.declarations = stat.declarations;
        g.min.freenames = g.max.freenames = g.sum.freenames = stat.freenames;
        g.count = 1;
      }
    }

    out("%15s %6s %15s %15s %15s %15s %15s\n", "code type", "count", "size", "backktracks", "queries", "declarations",
        "freenames");
    for (CodeType t : s.keySet()) {
      aggregate g = s.get(t);
      out("%15s %6d %15s %15s %15s %15s %15s\n", t.toExpression(), g.count, s(g.avgSize(), g.min.size, g.max.size),
          s(g.avgBackTracks(), g.min.backtracks, g.max.backtracks), s(g.avgQueries(), g.min.queries, g.max.queries),
          s(g.avgDeclarations(), g.min.declarations, g.max.declarations),
          s(g.avgFreenames(), g.min.freenames, g.max.freenames));
    }

    int backtracks = 0;
    for (FragmentKey fk : fragments.keySet()) {
      Statistics stat = fragments.get(fk);
      backtracks += stat.backtracks;
    }
    out(" backtracks = %d\n", backtracks);
  }

  static String s(float avg, int min, int max) {
    return String.format("%15.2f", avg, min, max);
  }

}
