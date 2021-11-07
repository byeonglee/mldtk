/*
 * xtc - The eXTensible C compiler Copyright (C) 2003 New York
 * University, Department of Computer Science.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
 * USA.
 */
package xtc.il;

import java.io.PrintWriter;
import java.io.StringWriter;

import java.util.Iterator;
import java.util.List;

import xtc.Constants;

import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.VisitingException;

/** 
 * An intermediate language pretty printer.
 *
 * @author Robert Grimm
 * @version $Revision: 1.10 $
 */
public class PrettyPrinter extends Printer {

  /** The type mode flag for defining types. */
  public static final int TYPE_DEFINE = 0;

  /** The type mode flag for declaring types. */
  public static final int TYPE_DECLARE = TYPE_DEFINE + 1;

  // ========================================================================

  /** The current type mode. */
  protected int typeMode = TYPE_DEFINE;

  /** The current type name. */
  protected String typeName = null;

  // ========================================================================

  /**
   * Create a new pretty printer with the specified print writer.
   *
   * @param out The print writer to output to.
   */
  public PrettyPrinter(PrintWriter out) {
    super(out);
  }

  // ========================================================================

  /**
   * Print the specified expression.
   *
   * @param e The expression.
   * @param context The parentheses level of its context.
   * @return This pretty printer.
   */
  public Printer p(Expr e, int context) {
    if (e.needsParentheses(context)) {
      p("(").p(e).p(")");
    } else {
      p(e);
    }
    return this;
  }

  // ========================================================================

  /**
   * Print the original location for the specified node.
   *
   * @param node The node.
   * @return This pretty printer.
   */
  public Printer loc(Node node) {
    if ((! Constants.PRINT_LOCATIONS) || (null == node.location)) return this;
    
    String line = Integer.toString(node.location.line);

    if (node.location.file.equals(file)) {
      return p("#line ").pln(line);
    } else {
      file = node.location.file;
      return p("#line ").p(line).p(" \"").p(node.location.file).pln("\"");
    }
  }

  // ========================================================================

  /** Print the specified file. */
  public void visit(File f) {
    indent().p("/* xtc ").p(Constants.VERSION).pln(" */");
    indent().p("/* File: \"").p(f.name).pln("\" */");
    pln();

    boolean  first = true;
    Iterator iter  = f.globals.iterator();
    while (iter.hasNext()) {
      if (first) {
        first = false;
      } else {
        pln();
      }

      p((Node)iter.next());
    }
  }

  /** Print the specified declaration. */
  public void visit(File.Declaration d) {
    int    flag = enterTypeMode(TYPE_DECLARE);
    String name = resetTypeName();

    Node node = (Node)d.def;
    loc(node).indent().p(node).pln(";");

    restoreTypeName(name);
    restoreTypeMode(flag);
  }

  // ========================================================================

  /** Print the specified named label. */
  public void visit(Stmt.NamedLabel l) {
    indentLess().p(l.name).pln(":");
  }

  /** Print the specified case label. */
  public void visit(Stmt.CaseLabel l) {
    indentLess().p("case ").p(l.value).pln(":");
  }

  /** Print the specified default label. */
  public void visit(Stmt.DefaultLabel l) {
    indentLess().pln("default:");
  }

  // ========================================================================

  /** Print the specified assignment statement. */
  public void visit(Stmt.Assignment s) {
    loc(s).p(s.labels).indent().p(s.lval).p(" = ").p(s.value).pln(";");
  }

  /** Print the specified block. */
  public void visit(Stmt.Block s) {
    pln("{");
    incr();

    Iterator iter = s.statements.iterator();
    while (iter.hasNext()) {
      p((Node)iter.next());
    }

    decr();
    indent().p("}");
  }

  /** Print the specified break statement. */
  public void visit(Stmt.Break s) {
    loc(s).p(s.labels).indent().pln("break;");
  }

  /** Print the specified call statement. */
  public void visit(Stmt.Call s) {
    loc(s).p(s.labels).indent();
    if (null != s.result) p(s.result).p(" = ");
    // FIXME we may need a cast here (?)
    if (s.function instanceof Expr.VariableLvalue) {
      p(s.function).p("(");
    } else {
      p("(").p(s.function).p(")(");
    }
    if (null != s.arguments) {
      boolean  first = true;
      Iterator iter  = s.arguments.iterator();
      while (iter.hasNext()) {
        if (first) {
          first = false;
          p((Node)iter.next());
        } else {
          p(", ").p((Node)iter.next());
        }
      }
    }
    pln(");");
  }

  /** Print the specified continue statement. */
  public void visit(Stmt.Continue s) {
    loc(s).p(s.labels).indent().pln("continue;");
  }

  /** Print the specified goto statement. */
  public void visit(Stmt.Goto s) {
    String target = null;

    // Find target name.
    if (null != s.target.labels) {
      Iterator iter = s.target.labels.iterator();
      while (iter.hasNext()) {
        Stmt.Label l = (Stmt.Label)iter.next();

        if (l instanceof Stmt.NamedLabel) {
          target = ((Stmt.NamedLabel)l).name;
        }
      }
    }

    if (null == target) {
      throw new VisitingException("goto statement without a valid target");
    }

    // Print actual statement.
    loc(s).p(s.labels).indent().p("goto ").p(target).pln(";");
  }

  /** Print the specified if statement. */
  public void visit(Stmt.If s) {
    loc(s).p(s.labels).indent().p("if (").p(s.test).p(") ").p(s.consequent);
    if (null != s.alternative) {
      p(" else ").p(s.alternative);
    }
    pln();
  }

  /** Print the specified loop. */
  public void visit(Stmt.Loop s) {
    loc(s).p(s.labels).indent().p("while(1) ").p(s.body).pln();
  }

  /** Print the specified return statement. */
  public void visit(Stmt.Return s) {
    if (null == s.result) {
      loc(s).p(s.labels).indent().pln("return;");
    } else {
      loc(s).p(s.labels).indent().p("return ").p(s.result).pln(";");
    }
  }

  /** Print the specified switch statement. */
  public void visit(Stmt.Switch s) {
    loc(s).p(s.labels).indent().p("switch (").p(s.expr).p(") ").p(s.body).pln();
  }

  // ========================================================================

  /**
   * Get the textual representation for the specified opcode.
   *
   * @param op The operator opcode, which must be one of the
   *           operator opcodes defined by {@link Expr}.
   * @return The corresponding textual representation.
   */
  public static String operator(int op) {
    switch (op) {
    case Expr.OP_AND:
      return "&&";
    case Expr.OP_BIT_AND:
      return "&";
    case Expr.OP_BIT_NOT:
      return "~";
    case Expr.OP_BIT_OR:
      return "|";
    case Expr.OP_BIT_XOR:
      return "^";
    case Expr.OP_DIV:
      return "/";
    case Expr.OP_EQ:
      return "==";
    case Expr.OP_GE:
      return ">=";
    case Expr.OP_GT:
      return ">";
    case Expr.OP_LE:
      return "<=";
    case Expr.OP_LT:
      return "<";
    case Expr.OP_MINUS:
    case Expr.OP_MINUS_PI:
    case Expr.OP_MINUS_PP:
    case Expr.OP_NEGATE:
      return "-";
    case Expr.OP_MOD:
      return "%";
    case Expr.OP_MULT:
      return "*";
    case Expr.OP_NE:
      return "!=";
    case Expr.OP_NOT:
      return "!";
    case Expr.OP_OR:
      return "||";
    case Expr.OP_PLUS:
    case Expr.OP_PLUS_PI:
      return "+";
    case Expr.OP_SHIFT_LT:
      return "<<";
    case Expr.OP_SHIFT_RT:
      return ">>";
    default:
      assert false;
      return null;
    }
  }

  // ========================================================================

  /** Print the specified addressof expression. */
  public void visit(Expr.AddressOf e) {
    p("&");
    p(e.lval, Expr.PLEVEL_ADDRESS_OF);
  }

  /** Print the specified alignof(Type) expression. */
  public void visit(Expr.AlignOf e) {
    int    flag = enterTypeMode(TYPE_DECLARE);
    String name = resetTypeName();

    p("__alignof__(").p(e.type).p(")");

    restoreTypeName(name);
    restoreTypeMode(flag);
  }

  /** Print the specified alignof(Expr) expression. */
  public void visit(Expr.AlignOfExpr e) {
    p("__alignof__(").p(e.expr).p(")");
  }

  /** Print the specified binary operator expression. */
  public void visit(Expr.BinaryOp e) {
    int plevel = e.getPLevel();

    p(e.operand1, plevel);
    p(" ").p(operator(e.op)).p(" ");
    p(e.operand2, plevel);
  }

  /** Print the specified cast. */
  public void visit(Expr.Cast e) {
    int    flag = enterTypeMode(TYPE_DECLARE);
    String name = resetTypeName();

    p("(").p(e.type).p(")");

    restoreTypeName(name);
    restoreTypeMode(flag);

    p(e.expr, e.getPLevel());
  }

  /** Print the specified constant. */
  public void visit(Expr.Constant e) {
    p(e.representation);
  }

  /** Print the specified variable lvalue. */
  public void visit(Expr.VariableLvalue e) {
    p(e.var.name);

    if (null != e.offset) p(e.offset);
  }

  /** Print the specified memory lvalue. */
  public void visit(Expr.MemoryLvalue e) {
    if (e.offset instanceof Expr.FieldOffset) {
      Expr.FieldOffset o = (Expr.FieldOffset)e.offset;

      p(e, Expr.PLEVEL_ARROW);
      p("->").p(o.field.name);

      if (null != o.offset) p(o.offset);
    } else {
      p("(*");
      p(e, Expr.PLEVEL_DEREF);
      p(")");

      if (null != e.offset) p(e.offset);
    }
  }

  /** Print the specified array offset. */
  public void visit(Expr.ArrayOffset o) {
    p("[").p(o.index).p("]");

    if (null != o.offset) p(o.offset);
  }

  /** Print the specified field offset. */
  public void visit(Expr.FieldOffset o) {
    p(".").p(o.field.name);

    if (null != o.offset) p(o.offset);
  }

  /** Print the specified sizeof(Type) expression. */
  public void visit(Expr.SizeOf e) {
    int    flag = enterTypeMode(TYPE_DECLARE);
    String name = resetTypeName();

    p("sizeof(").p(e.type).p(")");

    restoreTypeName(name);
    restoreTypeMode(flag);
  }

  /** Print the specified sizeof(Expr) expression. */
  public void visit(Expr.SizeOfExpr e) {
    p("sizeof(").p(e.expr).p(")");
  }

  /** Print the specified sizeof(String) expression. */
  public void visit(Expr.SizeOfString e) {
    p("sizeof(").p(e.string).p(")");
  }

  /** Print the specified startof expression. */
  public void visit(Expr.StartOf e) {
    p(e.lval);
  }

  /** Print the specified unary operator expression. */
  public void visit(Expr.UnaryOp e) {
    p(operator(e.op)).p(" ");
    p(e.operand, e.getPLevel());
  }

  // ========================================================================

  /** Print the specified attribute. */
  public void visit(Attribute a) {
    p(" ").p(a.name);
    if (null != a.value) {
      p("(").p(a.value).p(")");
    }
  }

  /** Print the specified pragma. */
  public void visit(Attribute.Pragma a) {
    p("#pragma ").p(a.name);
    if (null != a.value) {
      p(" ").p(a.value);
    }
    pln();
  }

  // ========================================================================

  /**
   * Set the type printing mode to the specified mode.
   *
   * @param flag The flag for the new type mode.
   * @return The flag for the old type mode.
   */
  public int enterTypeMode(int flag) {
    int oldFlag = typeMode;
    typeMode = flag;
    return oldFlag;
  }

  /**
   * Reset the type name.
   *
   * @return The old type name.
   */
  public String resetTypeName() {
    String oldName = typeName;
    typeName = null;
    return oldName;
  }

  /**
   * Restore the type printing mode.
   *
   * @param flag The type printing flag to restore.
   */
  public void restoreTypeMode(int flag) {
    typeMode = flag;
  }

  /**
   * Restore the type name.
   *
   * @param name The type name to restore.
   */
  public void restoreTypeName(String name) {
    typeName = name;
  }

  /**
   * Print the current type name.
   *
   * @return This pretty printer.
   */
  public PrettyPrinter tname() {
    if (null != typeName) {
      p(" ").p(typeName);
    }
    return this;
  }

  // ========================================================================

  /**
   * Get the textual representation for the specified type kind.
   *
   * @param kind The type kind, which must be one of the type flags
   *             defined by {@link Type}.
   * @return The corresponding textual representation.
   */
  public static String typeKind(int kind) {
    switch (kind) {
    case Type.CHAR:
      return "char";
    case Type.SCHAR:
      return "signed char";
    case Type.UCHAR:
      return "unsigned char";
    case Type.INT:
      return "int";
    case Type.UINT:
      return "unsigned int";
    case Type.SHORT:
      return "short";
    case Type.USHORT:
      return "unsigned short";
    case Type.LONG:
      return "long";
    case Type.ULONG:
      return "unsigned long";
    case Type.LONG_LONG:
      return "long long";
    case Type.FLOAT:
      return "float";
    case Type.DOUBLE:
      return "double";
    case Type.LONG_DOUBLE:
      return "long double";
    default:
      assert false;
      return null;
    }
  }  

  // ========================================================================

  /** Print the specified function argument. */
  public void visit(Type.Argument t) {
    int    flag = enterTypeMode(TYPE_DECLARE);
    String name = resetTypeName();

    typeName    = t.name;
    p(t.type).p(t.attributes);

    restoreTypeName(name);
    restoreTypeMode(flag);
  }

  /** Print the specified array. */
  public void visit(Type.Array t) {
    // Temporarily replace out.
    StringWriter sw  = new StringWriter();
    PrintWriter  old = out;
    out = new PrintWriter(sw);

    boolean paren = (null != t.attributes) && (null != typeName);

    if (paren) p("(");
    p(t.attributes);
    tname();
    if (paren) p(")");
    p("[");
    if (null != t.length) p(t.length);
    p("]");

    // Restore out.
    out = old;

    // Print the element type.
    typeName = sw.toString();
    p(t.type);
  }

  /** Print the specified enumeration. */
  public void visit(Type.Enum t) {
    if (TYPE_DEFINE == typeMode) {
      // Definition
      loc(t).indent().p("enum ").p(t.name).p(t.attributes).pln(" {");
      incr();

      Iterator iter  = t.enumerators.iterator();
      boolean  first = true;

      while (iter.hasNext()) {
        if (first) {
          first = false;
        } else {
          pln(",");
        }

        p((Node)iter.next());
      }
      pln();

      decr();
      indent().pln("};");
      
    } else {
      // Declaration
      p("enum ").p(t.name).p(t.attributes);
      tname();
    }
  }

  /** Print the specified enumerator. */
  public void visit(Type.Enumerator t) {
    indent().p(t.name).p(" = ").p(t.value);
  }

  /** Print the specified field. */
  public void visit(Type.Field t) {
    int    flag = enterTypeMode(TYPE_DECLARE);
    String name = resetTypeName();

    typeName = t.name;
    indent().p(t.type);

    restoreTypeName(name);
    restoreTypeMode(flag);

    if (-1 != t.bitfield) {
      p(" : ").p(Integer.toString(t.bitfield));
    }
    p(t.attributes).p(";");
  }

  /** Print the specified float. */
  public void visit(Type.Float t) {
    p(typeKind(t.kind)).p(t.attributes);
    tname();
  }

  /** Print the specified function. */
  public void visit(Type.Function t) {
    // Temporarily replace out.
    StringWriter sw  = new StringWriter();
    PrintWriter  old = out;
    out = new PrintWriter(sw);

    boolean paren = (null != t.attributes) && (null != typeName);

    if (paren) p("(");
    p(t.attributes);
    tname();
    if (paren) p(")");
    p("(");
    if (null == t.arguments) {
      if (t.varArgs) {
        p("...");
      } else {
        p("void");
      }
    } else {
      Iterator iter  = t.arguments.iterator();
      boolean  first = true;

      while (iter.hasNext()) {
        if (first) {
          first = false;
        } else {
          pln(", ");
        }

        p((Node)iter.next());
      }

      if (t.varArgs) {
        p(", ...");
      }
    }
    p(")");

    // Restore out.
    out = old;

    // Print the result type.
    typeName = sw.toString();
    p(t.result);
  }

  /** Print the specified int. */
  public void visit(Type.Int t) {
    p(typeKind(t.kind)).p(t.attributes);
    tname();
  }

  /** Print the specified pointer. */
  public void visit(Type.Pointer t) {
    // Temporarily replace out.
    StringWriter sw  = new StringWriter();
    PrintWriter  old = out;
    out = new PrintWriter(sw);

    // Create (* attributes name) string. Parenthesize it if a pointer
    // to a function or array.
    boolean paren = ((t.type instanceof Type.Function) ||
                     (t.type instanceof Type.Array));

    if (paren) p("(");
    p("*").p(t.attributes);
    tname();
    if (paren) p(")");

    // Restore out.
    out = old;

    // Print the pointed-to type.
    typeName = sw.toString();
    p(t.type);
  }

  /** Print the specified struct. */
  public void visit(Type.Struct t) {
    if (TYPE_DEFINE == typeMode) {
      // Definition
      loc(t).indent().p("struct ").p(t.tag).p(" {");
      incr();
    
      Iterator iter = t.fields.iterator();
      while (iter.hasNext()) {
        p((Node)iter.next());
      }

      decr();
      indent().pln("};");

    } else {
      // Declaration
      p("struct ").p(t.tag).p(t.attributes);
      tname();
    }
  }

  /** Print the specified typedef. */
  public void visit(Type.Typedef t) {
    if (TYPE_DEFINE == typeMode) {
      // Definition
      loc(t).indent().p("typedef ");

      int    flag = enterTypeMode(TYPE_DECLARE);
      String name = resetTypeName();

      typeName = t.name;
      p(t.type);

      restoreTypeName(name);
      restoreTypeMode(flag);

      pln(";");

    } else {
      // Declaration
      p(t.name).p(t.attributes);
      tname();
    }
  }

  /** Print the specified union. */
  public void visit(Type.Union t) {
    if (TYPE_DEFINE == typeMode) {
      // Definition
      loc(t).indent().p("union ").p(t.tag).p(" {");
      incr();

      Iterator iter = t.fields.iterator();
      while (iter.hasNext()) {
        p((Node)iter.next());
      }

      decr();
      indent().pln("};");

    } else {
      // Declaration
      p("union ").p(t.tag).p(t.attributes);
      tname();
    }
  }

  /** Print the specified void. */
  public void visit(Type.Void t) {
    p("void").p(t.attributes);
    tname();
  }

  // ========================================================================

  /**
   * Get the textual representation for the specified storage modifier.
   *
   * @param storage The storage flag.
   * @return The corresponding textual representation, which is followed
   *         by a space if it is not the empty string.
   */
  public static String storage(int storage) {
    switch (storage) {
    case Variable.STATIC:
      return "static ";
    case Variable.REGISTER:
      return "register ";
    case Variable.EXTERN:
      return "extern ";
    default:
      return "";
    }
  }

  /** Print the specified variable. */
  public void visit(Variable v) {
    if (TYPE_DEFINE == typeMode) {
      // Definition
      loc(v).indent();
      if (v.inline) p("__inline");
      p(storage(v.storage));

      int    flag = enterTypeMode(TYPE_DECLARE);
      String name = resetTypeName();
      typeName    = v.name;
      p(v.type);
      restoreTypeName(name);
      restoreTypeMode(flag);

      p(v.attributes);

      if (null != v.init) {
        p(" = ").p(v.init);
      }

      pln(";");

    } else {
      // Declaration
      if (v.inline) p("__inline ");
      p(storage(v.storage));

      // Type mode already is TYPE_DECLARE.
      String name = resetTypeName();
      typeName    = v.name;
      p(v.type);
      restoreTypeName(name);
      
      p(v.attributes);
    }
  }

  /** Visit the specified single initializer. */
  public void visit(Variable.SingleInit init) {
    p(init.expr);
  }

  /** Visit the specified compound initializer. */
  public void visit(Variable.CompoundInit init) {
    p("{");

    boolean  first = true;
    Iterator iter  = init.elements.iterator();
    while (iter.hasNext()) {
      if (first) {
        first = false;
      } else {
        p(", ");
      }

      p((Node)iter.next());
    }

    p("}");
  }

  /** Visit the specified element initializer. */
  public void visit(Variable.ElementInit init) {
    // FIXME this should probably be a little more intelligent.
    p(init.init);
  }

  // ========================================================================

  /** Print the specified function. */
  public void visit(Function f) {
    loc(f).indent();
    if (f.var.inline) p("__inline ");
    p(storage(f.var.storage));

    int    flag = enterTypeMode(TYPE_DECLARE);
    String name = resetTypeName();
    typeName    = f.var.name;
    p(f.var.type);
    restoreTypeName(name);
    restoreTypeMode(flag);

    pln(" {");
    incr();

    if (null != f.locals) {
      flag = enterTypeMode(TYPE_DECLARE);
      name = resetTypeName();

      Iterator iter = f.locals.iterator();
      while (iter.hasNext()) {
        Variable v = (Variable)iter.next();
        typeName   = v.name;
        indent().p(v.type).pln(";");
      }

      restoreTypeName(name);
      restoreTypeMode(flag);
    }

    if ((null != f.locals) && (null != f.body)) {
      pln();
    }

    if (null != f.body) {
      Iterator iter = f.body.statements.iterator();
      while (iter.hasNext()) {
        p((Node)iter.next());
      }
    }

    decr();
    indent().pln("}");

  }

}
