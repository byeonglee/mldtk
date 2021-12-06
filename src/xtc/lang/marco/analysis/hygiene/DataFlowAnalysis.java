package xtc.lang.marco.analysis.hygiene;

import static xtc.lang.marco.Util._assert;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;
import java.util.TreeSet;

import xtc.lang.marco.analysis.oracle.Oracle;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.CallExprAst;
import xtc.lang.marco.ast.ExprAst;
import xtc.lang.marco.ast.FormalParamAst;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.FuncDefinition;
import xtc.lang.marco.ast.NameAst;
import xtc.lang.marco.ast.StrongAst;
import xtc.lang.marco.exception.MarcoException;

public class DataFlowAnalysis {

  public final HashMap<String, FunctionSummary> functions = new HashMap<String, FunctionSummary>();
  public final TreeSet<Node> variables = new TreeSet<Node>();
  public final Set<Constraint> constraints = new HashSet<Constraint>();
  public final Stack<Constraint> workList = new Stack<Constraint>();
  public final Set<HygieneError> errors = new HashSet<HygieneError>();

  int nextid = 1;

  public void solve() {
    for (Constraint c : constraints) {
      if (c.rhs instanceof Literal) {
        workList.push(c);
      }
    }

    while (!workList.empty()) {
      Constraint c = workList.pop();
      Set<String> freeNames = c.rhs.getFreeNames();
      Set<String> capturedNames = c.getCapturedNames(freeNames);

      for (String capturedName : capturedNames) {
        errors.add(new HygieneError(capturedName, c));
      }

      Set<String> survivedFreeNames = new TreeSet<String>(freeNames);
      survivedFreeNames.removeAll(capturedNames);
      if (!survivedFreeNames.isEmpty()) {
        int oldFreeNameCount = c.lhs.getFreeNames().size();
        c.lhs.getFreeNames().addAll(survivedFreeNames);
        int newFreeNameCount = c.lhs.getFreeNames().size();
        if (newFreeNameCount - oldFreeNameCount > 0) {
          for (Constraint s : getOutgoingConstaints(c.lhs)) {
            workList.add(s);
          }
        }
      }
    }

    for (HygieneError herror : errors) {
      Constraint fail = herror.failure;
      Node s = fail.rhs;
      String failedName = herror.capturedName;
      Set<Literal> origins = trackSourceLiteral(failedName, s);
      herror.causes.addAll(origins);
    }
  }

  Set<HygieneError> getHigieneErrors() {
    return errors;
  }

  Set<Literal> trackSourceLiteral(final String name, final Node fail) {
    final HashSet<Literal> sources = new HashSet<Literal>();
    new Runnable() {
      HashSet<Node> visited = new HashSet<Node>();

      public void run() {
        search(fail);
      }

      void search(Node n) {
        visited.add(n);
        if (n instanceof Literal) {
          if (n.getFreeNames().contains(name)) {
            sources.add((Literal) n);
          }
        }
        for (Constraint pe : getIncomingConstraints(n)) {
          if (!visited.contains(pe.rhs)) {
            if (pe.rhs.getFreeNames().contains(name)) {
              search(pe.rhs);
            }
          }
        }
      }
    }.run();

    _assert(sources.size() > 0);
    return sources;
  }

  /**
   * NOTE: Assume that the graph is free from cycles.
   */
  void backwardSearchForOrigin(Node n, String name, Set<Literal> origins) {
    if (n instanceof Literal) {
      if (n.getFreeNames().contains(name)) {
        origins.add((Literal) n);
      }
    } else {
      for (Constraint p : getIncomingConstraints(n)) {
        if (p.rhs.getFreeNames().contains(name)) {
          backwardSearchForOrigin(p.rhs, name, origins);
        }
      }
    }
  }

  Set<Constraint> getIncomingConstraints(Node n) {
    Set<Constraint> s = new HashSet<Constraint>();
    for (Constraint c : constraints) {
      if (c.lhs == n) {
        s.add(c);
      }
    }
    return s;
  }

  Set<Constraint> getOutgoingConstaints(Node n) {
    Set<Constraint> s = new HashSet<Constraint>();
    for (Constraint c : constraints) {
      if (c.rhs == n) {
        s.add(c);
      }
    }
    return s;
  }

  FunctionSummary lookup(String name) {
    return functions.get(name);
  }

  FunctionSummary lookup(FuncDefinition fdef) {
    return functions.get(fdef.name._name);
  }

  private Variable allocVariable(StrongAst a) {
    Variable v = new Variable(nextid++, a);
    variables.add(v);
    return v;
  }

  private Literal allocLiteral(ExprAst f, String[] freeNames) {
    Literal l = new Literal(nextid++, f, freeNames);
    variables.add(l);
    return l;
  }

  FunctionSummary createFuncSummary(FuncDefinition fdef) {
    final List<Variable> params = new ArrayList<Variable>();
    final Variable ret = allocVariable(fdef);
    for (int i = 0; i < fdef.formals.length; i++) {
      Variable v = allocVariable(fdef.formals[i]);
      params.add(v);
    }
    FunctionSummary fs = new FunctionSummary(fdef, params, ret);
    functions.put(fdef.name._name, fs);
    return fs;
  }

  Literal createEmptyLiteral(FuncDefinition fdef, ExprAst e) {
    Literal l = allocLiteral(e, new String[0]);
    lookup(fdef).variables.add(l);
    return l;
  }

  Literal createLiteral(FuncDefinition fdef, Fragment f, String[] freeNames) {
    Literal l = allocLiteral(f, freeNames);
    lookup(fdef).variables.add(l);
    return l;
  }

  Variable createVariable(FuncDefinition fdef, StrongAst a) {
    Variable v = allocVariable(a);
    lookup(fdef).variables.add(v);
    return v;
  }

  void addConstraint(StrongAst a, Node s, Node t, Blank b, Fragment f) {
    _assert(a != null && s != null && t != null, "unexpected null");
    constraints.add(new BlankConstraint(nextid++, a, t, s, b, f));
  }

  void addConstraint(StrongAst a, Node source, Node target) {
    constraints.add(new ByPassConstraint(nextid++, a, target, source));
  }

  public static class FunctionSummary {
    public final FuncDefinition fdef;
    public final List<Variable> params;
    public final Variable ret;
    public final Set<Node> variables = new TreeSet<Node>();

    FunctionSummary(FuncDefinition fdef, List<Variable> params, Variable ret) {
      this.fdef = fdef;
      this.params = params;
      this.ret = ret;
      for (Variable v : params) {
        variables.add(v);
      }
      if (ret != null) {
        variables.add(ret);
      }
    }
  }

  public static class HygieneError {
    public final String capturedName;
    public final Constraint failure;
    public Set<Literal> causes = new HashSet<Literal>();

    public HygieneError(String capturedName, Constraint failure) {
      this.capturedName = capturedName;
      this.failure = failure;
    }

    public boolean equals(Object o) {
      if (o instanceof HygieneError) {
        HygieneError you = (HygieneError) o;
        return capturedName.equals(you.capturedName) && failure == you.failure;
      } else {
        return false;
      }
    }

    public int hashCode() {
      return capturedName.hashCode();
    }
  }

  public static abstract class Element {
    public final int id;
    public final StrongAst cause;

    public Element(int id, StrongAst cause) {
      this.id = id;
      this.cause = cause;
    }

    public String toString() {
      if (cause instanceof Fragment) {
        return String.format("frag (%d:%d)", cause._line, cause._column);
      } else if (cause instanceof NameAst) {
        return String.format("var %s(%d:%d)", ((NameAst) cause)._name, cause._line, cause._column);
      } else if (cause instanceof FormalParamAst) {
        FormalParamAst a = (FormalParamAst) cause;
        return String.format("formal %s (%d:%d)", a.name._name, a._line, a._column);
      } else if (cause instanceof FuncDefinition) {
        FuncDefinition f = (FuncDefinition) cause;
        return String.format("return %s (%d:%d)", f.name._name, f._line, f._column);
      } else if (cause instanceof CallExprAst) {
        CallExprAst cs = (CallExprAst) cause;
        return String.format("callsite to %s (%d:%d)", cs._name._name, cs._line, cs._column);
      } else {
        return String.format("%s:%d:%d", cause.getClass().getName(), cause._line, cause._column);
      }
    }
  }

  public static abstract class Node extends Element implements Comparable<Node> {
    public Node(int _id, StrongAst cause) {
      super(_id, cause);
    }

    public int compareTo(Node o) {
      return this.id - ((Node) o).id;
    }

    public abstract Set<String> getFreeNames();
  }

  public static class Variable extends Node {
    public final Set<String> freeNames = new TreeSet<String>();

    public Variable(int id, StrongAst cause) {
      super(id, cause);
    }

    public Set<String> getFreeNames() {
      return freeNames;
    }
  }

  public static class Literal extends Node {
    public final Set<String> freeNames;

    public Literal(int id, ExprAst a, String[] freeNames) {
      super(id, a);
      this.freeNames = new TreeSet<String>();
      for (String s : freeNames) {
        this.freeNames.add(s);
      }
    }

    public Set<String> getFreeNames() {
      return freeNames;
    }
  }

  public static abstract class Constraint extends Element {
    public final Node lhs;
    public final Node rhs;

    public Constraint(int id, StrongAst cause, Node lhs, Node rhs) {
      super(id, cause);
      this.lhs = lhs;
      this.rhs = rhs;
    }

    public abstract Set<String> getCapturedNames(Set<String> freenames);
  }

  public static class ByPassConstraint extends Constraint {
    private Set<String> emptySet = new HashSet<String>();

    public ByPassConstraint(int id, StrongAst cause, Node lhs, Node rhs) {
      super(id, cause, lhs, rhs);
    }

    public Set<String> getCapturedNames(Set<String> freenames) {
      return emptySet;
    }
  }

  public static class BlankConstraint extends Constraint {
    public final Blank blank;
    public final Fragment fragment;

    public BlankConstraint(int id, StrongAst cause, Node lhs, Node rhs, Blank blank, Fragment fragment) {
      super(id, cause, lhs, rhs);
      this.blank = blank;
      this.fragment = fragment;
    }

    public Set<String> getCapturedNames(Set<String> freenames) {
      try {
        TreeSet<String> capturedNames = new TreeSet<String>();
        for (String freename : freenames) {
          if (!fragment.isIntentionalCapture(freename) && Oracle.isCapture(fragment, blank, freename)) {
            capturedNames.add(freename);
          }
        }
        return capturedNames;
      } catch (Throwable e) {
        throw new MarcoException(fragment, "failed in captured names");
      }
    }
  }
}
