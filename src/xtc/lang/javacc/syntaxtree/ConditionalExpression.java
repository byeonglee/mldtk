//
// Generated by JTB 1.2.2
//

package xtc.lang.javacc.syntaxtree;

/**
 * Grammar production.
 * <pre>
 * f0 -> ConditionalOrExpression()
 * f1 -> [ "?" Expression() ":" ConditionalExpression() ]
 * </pre>
 */
public class ConditionalExpression implements Node {
   public ConditionalOrExpression f0;
   public NodeOptional f1;

   public ConditionalExpression(ConditionalOrExpression n0, NodeOptional n1) {
      f0 = n0;
      f1 = n1;
   }

   public void accept(xtc.lang.javacc.visitor.Visitor v) {
      v.visit(this);
   }
   public Object accept(xtc.lang.javacc.visitor.ObjectVisitor v, Object argu) {
      return v.visit(this,argu);
   }
}

