//
// Generated by JTB 1.2.2
//

package xtc.lang.javacc.syntaxtree;

/**
 * Grammar production.
 * <pre>
 * f0 -> ( "abstract" | "public" | "strictfp" )*
 * f1 -> UnmodifiedInterfaceDeclaration()
 * </pre>
 */
public class InterfaceDeclaration implements Node {
   public NodeListOptional f0;
   public UnmodifiedInterfaceDeclaration f1;

   public InterfaceDeclaration(NodeListOptional n0, UnmodifiedInterfaceDeclaration n1) {
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

