//
// Generated by JTB 1.2.2
//

package xtc.lang.javacc.syntaxtree;

/**
 * Grammar production.
 * <pre>
 * f0 -> &lt;IDENTIFIER&gt;
 * f1 -> ( "." &lt;IDENTIFIER&gt; )*
 * </pre>
 */
public class Name implements Node {
   public NodeToken f0;
   public NodeListOptional f1;

   public Name(NodeToken n0, NodeListOptional n1) {
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
