//
// Generated by JTB 1.2.2
//

package xtc.lang.javacc.syntaxtree;

/**
 * Grammar production.
 * <pre>
 * f0 -> "assert"
 * f1 -> Expression()
 * f2 -> [ ":" Expression() ]
 * f3 -> ";"
 * </pre>
 */
public class AssertStatement implements Node {
   public NodeToken f0;
   public Expression f1;
   public NodeOptional f2;
   public NodeToken f3;

   public AssertStatement(NodeToken n0, Expression n1, NodeOptional n2, NodeToken n3) {
      f0 = n0;
      f1 = n1;
      f2 = n2;
      f3 = n3;
   }

   public AssertStatement(Expression n0, NodeOptional n1) {
      f0 = new NodeToken("assert");
      f1 = n0;
      f2 = n1;
      f3 = new NodeToken(";");
   }

   public void accept(xtc.lang.javacc.visitor.Visitor v) {
      v.visit(this);
   }
   public Object accept(xtc.lang.javacc.visitor.ObjectVisitor v, Object argu) {
      return v.visit(this,argu);
   }
}

