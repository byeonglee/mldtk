// ===========================================================================
// This file has been generated by
// Typical, version 1.15.0,
// (C) 2004-2009 Robert Grimm and New York University,
// on Wednesday, February 23, 2011 at 2:21:41 PM.
// Edit at your own risk.
// ===========================================================================

package xtc.typical;

import xtc.util.Pair;

import xtc.tree.Node;

/** Helper functionality for Typical. */
public class TypicalSupport {
  static final Primitives.Head<TypicalTypes.raw_type<?>> head$100 = new Primitives.Head<TypicalTypes.raw_type<?>>();
  static final Primitives.Tail<TypicalTypes.raw_type<?>> tail$101 = new Primitives.Tail<TypicalTypes.raw_type<?>>();
  static final Primitives.Append<Node> append$123 = new Primitives.Append<Node>();
  static final Primitives.Map<Object, Node> map$124 = new Primitives.Map<Object, Node>();
  static final Primitives.Map<TypicalTypes.raw_type<?>, Node> map$125 = new Primitives.Map<TypicalTypes.raw_type<?>, Node>();
  static final Primitives.Exists<TypicalTypes.raw_type<?>> exists$159 = new Primitives.Exists<TypicalTypes.raw_type<?>>();
  static final Primitives.FoldLeft<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> foldl$193 = new Primitives.FoldLeft<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>>();
  static final Primitives.Tail<Node> tail$244 = new Primitives.Tail<Node>();
  static final Primitives.Head<Node> head$245 = new Primitives.Head<Node>();
  static final Primitives.Append<String> append$262 = new Primitives.Append<String>();
  static final Primitives.Union<String> union$273 = new Primitives.Union<String>();
  static final Primitives.Exists<TypicalTypes.entry> exists$585 = new Primitives.Exists<TypicalTypes.entry>();
  static final Primitives.Nth<Node> nth$597 = new Primitives.Nth<Node>();
  static final Primitives.Append<TypicalTypes.entry> append$1065 = new Primitives.Append<TypicalTypes.entry>();
  static final Primitives.Map<Object, TypicalTypes.entry> map$1095 = new Primitives.Map<Object, TypicalTypes.entry>();
  static final Primitives.Map<String, Node> map$1715 = new Primitives.Map<String, Node>();
  static final Primitives.Map<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> map$1790 = new Primitives.Map<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>>();
  static final Primitives.Map<Object, TypicalTypes.nodeRec> map$1815 = new Primitives.Map<Object, TypicalTypes.nodeRec>();
  static final Primitives.Union<TypicalTypes.call> union$1821 = new Primitives.Union<TypicalTypes.call>();
  static final Primitives.Union<Pair<String>> union$2006 = new Primitives.Union<Pair<String>>();
  static final Primitives.Append<Pair<String>> append$2011 = new Primitives.Append<Pair<String>>();
  static final Primitives.Map<TypicalTypes.raw_type<?>, String> map$2033 = new Primitives.Map<TypicalTypes.raw_type<?>, String>();
  static final Primitives.Union<Node> union$2067 = new Primitives.Union<Node>();
  static final Primitives.Map<Object, String> map$2071 = new Primitives.Map<Object, String>();
  static final Primitives.Append<TypicalTypes.patternRecord> append$2490 = new Primitives.Append<TypicalTypes.patternRecord>();
  static final Primitives.Head<TypicalTypes.patternRecord> head$2543 = new Primitives.Head<TypicalTypes.patternRecord>();
  static final Primitives.Tail<TypicalTypes.patternRecord> tail$2544 = new Primitives.Tail<TypicalTypes.patternRecord>();
  static final Primitives.Append<Pair<TypicalTypes.patternRecord>> append$2611 = new Primitives.Append<Pair<TypicalTypes.patternRecord>>();
  static final Primitives.Append<TypicalTypes.constr> append$2616 = new Primitives.Append<TypicalTypes.constr>();
  static final Primitives.Append<TypicalTypes.pattern> append$2640 = new Primitives.Append<TypicalTypes.pattern>();
  static final Primitives.Head<Pair<TypicalTypes.patternRecord>> head$2656 = new Primitives.Head<Pair<TypicalTypes.patternRecord>>();
  static final Primitives.Head<TypicalTypes.pattern> head$2714 = new Primitives.Head<TypicalTypes.pattern>();
  static final Primitives.Tail<TypicalTypes.pattern> tail$2715 = new Primitives.Tail<TypicalTypes.pattern>();
  static final Primitives.Head<TypicalTypes.constr> head$2757 = new Primitives.Head<TypicalTypes.constr>();

  static final boolean match$2(Node m) {
    return null != m && m.hasName("UpperID") && m.size() == 1;
  }

  static final boolean match$6(Node m) {
    return null != m && m.hasName("TypeConstructorPattern") && m.size() >= 1;
  }

  static final boolean match$10(Node m) {
    return null != m && m.hasName("TupleConstructor") && m.size() >= 1;
  }

  static final boolean match$14(Node m) {
    return null != m && m.hasName("TypeConstructor") && m.size() == 2;
  }

  static final boolean match$18(Node m) {
    return null != m && m.hasName("PolyTypeConstructor") && m.size() == 2;
  }

  static final boolean match$22(Node m) {
    return null != m && m.hasName("TypeDefinition") && m.size() == 3;
  }

  static final boolean match$26(Node m) {
    return null != m && m.hasName("ConstructedType") && m.size() == 2;
  }

  static final boolean match$30(Node m) {
    return null != m && m.hasName("UserDefinedType") && m.size() == 1;
  }

  static final boolean match$34(Node m) {
    return null != m && m.hasName("AttributeDefinition") && m.size() == 2;
  }

  static final boolean match$38(Node m) {
    return null != m && m.hasName("EqualAttributeDefinition") && m.size() == 2;
  }

  static final boolean match$42(Node m) {
    return null != m && m.hasName("FieldType") && m.size() == 2;
  }

  static final boolean match$46(Node m) {
    return null != m && m.hasName("FieldAssignment") && m.size() == 2;
  }

  static final boolean match$50(Node m) {
    return null != m && m.hasName("FieldExpression") && m.size() == 2;
  }

  static final boolean match$54(Node m) {
    return null != m && m.hasName("FieldPattern") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("LowerID") && m.getGeneric(0).size() == 1);
  }

  static final boolean match$58(Node m) {
    return null != m && m.hasName("AsPattern") && m.size() == 2;
  }

  static final boolean match$62(Node m) {
    return null != m && m.hasName("LowerID") && m.size() == 1;
  }

  static final boolean match$66(Node m) {
    return null != m && m.hasName("Variable") && m.size() == 1;
  }

  static final boolean match$70(Node m) {
    return null != m && m.hasName("Parameter") && m.size() == 2;
  }

  static final boolean match$74(Node m) {
    return null != m && m.hasName("ValueDefinition") && m.size() == 3;
  }

  static final boolean match$78(Node m) {
    return null != m && m.hasName("NameSpaceStructure") && m.size() == 3;
  }

  static final boolean match$84(Node m) {
    return null != m && m.hasName("LetExpression") && m.size() == 2;
  }

  static final boolean match$85(Node m) {
    return null != m && m.hasName("FunExpression") && m.size() == 2;
  }

  static final boolean match$86(Node m) {
    return null != m && m.hasName("PatternMatch") && m.size() == 2;
  }

  static final boolean match$89(TypicalTypes.raw_type<?> m) {
    return null != m && m.isBoolT();
  }

  static final boolean match$90(TypicalTypes.raw_type<?> m) {
    return null != m && m.isIntT();
  }

  static final boolean match$91(TypicalTypes.raw_type<?> m) {
    return null != m && m.isFloat32T();
  }

  static final boolean match$92(TypicalTypes.raw_type<?> m) {
    return null != m && m.isFloat64T();
  }

  static final boolean match$93(TypicalTypes.raw_type<?> m) {
    return null != m && m.isStringT();
  }

  static final boolean match$94(TypicalTypes.raw_type<?> m) {
    return null != m && m.isWildcardT();
  }

  static final boolean match$95(TypicalTypes.raw_type<?> m) {
    return null != m && m.isAnyT();
  }

  static final boolean match$96(TypicalTypes.raw_type<?> m) {
    return null != m && m.isConstructorT();
  }

  static final boolean match$97(TypicalTypes.raw_type<?> m) {
    return null != m && m.isTypeName();
  }

  static final boolean match$98(TypicalTypes.raw_type<?> m) {
    return null != m && m.isFieldT();
  }

  static final boolean match$99(TypicalTypes.raw_type<?> m) {
    return null != m && m.isFunctionT();
  }

  static final boolean match$102(TypicalTypes.raw_type<?> m) {
    return null != m && m.isVariantT();
  }

  static final boolean match$106(TypicalTypes.raw_type<?> m) {
    return null != m && m.isRecordT();
  }

  static final boolean match$110(TypicalTypes.raw_type<?> m) {
    return null != m && m.isTupleT();
  }

  static final boolean match$111(TypicalTypes.raw_type<?> m) {
    return null != m && m.isConstructedT();
  }

  static final boolean match$112(TypicalTypes.raw_type<?> m) {
    return null != m && m.isPairOfType();
  }

  static final boolean match$113(TypicalTypes.raw_type<?> m) {
    return null != m && m.isVariableT();
  }

  static final boolean match$114(TypicalTypes.raw_type<?> m) {
    return null != m && m.isPolyVariantT();
  }

  static final boolean match$115(TypicalTypes.raw_type<?> m) {
    return null != m && m.isNodeTypeT();
  }

  static final boolean match$118(Pair<TypicalTypes.raw_type<?>> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$122(Node m) {
    return null != m && m.hasName("Module") && m.size() >= 1;
  }

  static final boolean match$142(Node m) {
    return null != m && m.hasName("EqualityDefinition") && m.size() >= 1;
  }

  static final boolean match$147(Node m) {
    return null != m && m.hasName("EqualStructure") && m.size() >= 2;
  }

  static final boolean match$149(TypicalTypes.raw_type<?> m) {
    return null != m && m.isConstructorT() && "raw_type".equals(m.getTuple().get1());
  }

  static final boolean match$158(Node m) {
    return null != m && m.hasName("RecordDeclaration") && m.size() >= 0;
  }

  static final boolean match$167(Node m) {
    return null != m && m.hasName("VariantDeclaration") && m.size() >= 0;
  }

  static final boolean match$175(Node m) {
    return null != m && m.hasName("PolyVariantDeclaration") && m.size() >= 0;
  }

  static final boolean match$187(Node m) {
    return null != m && m.hasName("ScopeDefinition") && m.size() == 1;
  }

  static final boolean match$191(Node m) {
    return null != m && m.hasName("NameSpaceDefinition") && m.size() >= 0;
  }

  static final boolean match$204(TypicalTypes.raw_type<?> m) {
    return null != m && m.isTupleT() && (null != m.getTuple().get1() && ((Pair)m.getTuple().get1()).isEmpty());
  }

  static final boolean match$218(Node m) {
    return null != m && m.hasName("Parameters") && m.size() >= 0;
  }

  static final boolean match$227(Node m) {
    return null != m && m.hasName("MatchExpression") && m.size() == 2;
  }

  static final boolean match$235(Node m) {
    return null != m && m.hasName("PatternMatching") && m.size() >= 0;
  }

  static final boolean match$243(Node m) {
    return null != m && m.hasName("Patterns") && m.size() >= 0;
  }

  static final boolean match$249(Node m) {
    return null != m && m.hasName("TuplePattern") && m.size() >= 0;
  }

  static final boolean match$253(Node m) {
    return null != m && m.hasName("WhenPattern") && m.size() == 2;
  }

  static final boolean match$267(Node m) {
    return null != m && m.hasName("TypedPattern") && m.size() == 2;
  }

  static final boolean match$272(Node m) {
    return null != m && m.hasName("ConsPattern") && m.size() == 2;
  }

  static final boolean match$279(Node m) {
    return null != m && m.hasName("ListPattern") && m.size() >= 0;
  }

  static final boolean match$281(Pair<Node> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$288(Node m) {
    return null != m && m.hasName("RecordPattern") && m.size() >= 0;
  }

  static final boolean match$299(Node m) {
    return null != m && m.hasName("FieldPattern") && m.size() == 2;
  }

  static final boolean match$314(Pair<Node> m) {
    return m.size() == 1 && (null != m.get(0) && m.get(0).hasName("PatternParameters") && m.get(0).size() >= 0);
  }

  static final boolean match$323(Pair<Node> m) {
    return m.size() == 1 && (null != m.get(0) && m.get(0).hasName("WildCard"));
  }

  static final boolean match$332(Node m) {
    return null != m && m.hasName("TupleLiteral") && m.size() >= 0;
  }

  static final boolean match$336(Node m) {
    return null != m && m.hasName("LogicalOrExpression") && m.size() == 2;
  }

  static final boolean match$342(Node m) {
    return null != m && m.hasName("LogicalAndExpression") && m.size() == 2;
  }

  static final boolean match$348(Node m) {
    return null != m && m.hasName("EqualityExpression") && m.size() == 3;
  }

  static final boolean match$353(Node m) {
    return null != m && m.hasName("RelationalExpression") && m.size() == 3;
  }

  static final boolean match$369(Node m) {
    return null != m && m.hasName("AdditiveExpression") && m.size() == 3;
  }

  static final boolean match$387(Node m) {
    return null != m && m.hasName("MultiplicativeExpression") && m.size() == 3;
  }

  static final boolean match$405(Node m) {
    return null != m && m.hasName("ConcatenationExpression") && m.size() == 3;
  }

  static final boolean match$411(Node m) {
    return null != m && m.hasName("ConsExpression") && m.size() == 2;
  }

  static final boolean match$416(Node m) {
    return null != m && m.hasName("FunctionApplication") && m.size() >= 0;
  }

  static final boolean match$418(Pair<Node> m) {
    return m.size() == 3;
  }

  static final boolean match$421(Pair<Node> m) {
    return m.size() == 2;
  }

  static final boolean match$424(Pair<Node> m) {
    return m.size() == 3 && (null != m.get(2) && m.get(2).hasName("ErrorClause"));
  }

  static final boolean match$427(Node m) {
    return null != m && m.hasName("ErrorClause") && m.size() == 3;
  }

  static final boolean match$437(Pair<Node> m) {
    return m.size() == 2 && (null != m.get(1) && m.get(1).hasName("ErrorClause"));
  }

  static final boolean match$449(Pair<Node> m) {
    return m.size() == 2 && (null != m.get(1) && m.get(1).hasName("LowerID"));
  }

  static final boolean match$452(Pair<Node> m) {
    return m.size() == 1;
  }

  static final boolean match$546(Node m) {
    return null != m && m.hasName("PredicateExpression") && m.size() == 2;
  }

  static final boolean match$551(Node m) {
    return null != m && m.hasName("PredicateArgument") && m.size() == 1;
  }

  static final boolean match$579(Node m) {
    return null != m && m.hasName("LogicalNegationExpression") && m.size() == 1;
  }

  static final boolean match$589(Node m) {
    return null != m && m.hasName("FunctionExpression") && m.size() == 1;
  }

  static final boolean match$596(Node m) {
    return null != m && m.hasName("RequireExpression") && m.size() >= 0;
  }

  static final boolean match$601(Node m) {
    return null != m && m.hasName("RequireArgs") && m.size() == 4;
  }

  static final boolean match$608(Node m) {
    return null != m && m.hasName("GuardExpression") && m.size() == 2;
  }

  static final boolean match$618(Node m) {
    return null != m && m.hasName("AssertClause") && m.size() == 2;
  }

  static final boolean match$641(Node m) {
    return null != m && m.hasName("RecordExpression") && m.size() >= 0;
  }

  static final boolean match$653(Node m) {
    return null != m && m.hasName("WithExpression") && m.size() == 1 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("Bottom"));
  }

  static final boolean match$660(Node m) {
    return null != m && m.hasName("WithExpression") && m.size() == 1;
  }

  static final boolean match$691(Node m) {
    return null != m && m.hasName("IfExpression") && m.size() == 2;
  }

  static final boolean match$696(Node m) {
    return null != m && m.hasName("IfElseExpression") && m.size() == 3;
  }

  static final boolean match$702(Node m) {
    return null != m && m.hasName("ListLiteral") && m.size() >= 0;
  }

  public static final Analyzer.NodeMatch nodeMatch$706 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("ScopeDefinition"));
    }
  };

  static final boolean match$712(Node m) {
    return null != m && m.hasName("ReduceExpression") && m.size() == 3;
  }

  static final boolean match$719(Node m) {
    return null != m && m.hasName("ReduceOptions") && m.size() >= 0;
  }

  static final boolean match$736(Node m) {
    return null != m && m.hasName("TypeVariable") && m.size() == 1;
  }

  static final boolean match$740(Node m) {
    return null != m && m.hasName("ConstraintType") && m.size() == 1;
  }

  static final boolean match$744(Node m) {
    return null != m && m.hasName("PolyVariantType") && m.size() >= 0;
  }

  static final boolean match$748(Node m) {
    return null != m && m.hasName("TupleType") && m.size() >= 0;
  }

  static final boolean match$759(Node m) {
    return null != m && m.hasName("AliasedType") && m.size() == 2;
  }

  static final boolean match$763(Node m) {
    return null != m && m.hasName("FunctionType") && m.size() == 2;
  }

  static final boolean match$776(Node m) {
    return null != m && m.hasName("NaryConstructedType") && m.size() == 2;
  }

  static final boolean match$780(Node m) {
    return null != m && m.hasName("Bottom");
  }

  static final boolean match$784(Node m) {
    return null != m && m.hasName("BottomPattern");
  }

  static final boolean match$788(Node m) {
    return null != m && m.hasName("WildCard");
  }

  static final boolean match$792(Node m) {
    return null != m && m.hasName("AnyType");
  }

  static final boolean match$796(Node m) {
    return null != m && m.hasName("StringLiteral");
  }

  static final boolean match$800(Node m) {
    return null != m && m.hasName("StringType");
  }

  static final boolean match$804(Node m) {
    return null != m && m.hasName("IntegerLiteral");
  }

  static final boolean match$808(Node m) {
    return null != m && m.hasName("IntType");
  }

  static final boolean match$812(Node m) {
    return null != m && m.hasName("BooleanLiteral");
  }

  static final boolean match$816(Node m) {
    return null != m && m.hasName("BooleanType");
  }

  static final boolean match$820(Node m) {
    return null != m && m.hasName("FloatingLiteral");
  }

  static final boolean match$824(Node m) {
    return null != m && m.hasName("Float64");
  }

  static final boolean match$828(Node m) {
    return null != m && m.hasName("Float32");
  }

  static final boolean match$837(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isWildcardT());
  }

  static final boolean match$838(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isWildcardT());
  }

  static final boolean match$839(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isBoolT()) && (null != m.get2() && m.get2().isBoolT());
  }

  static final boolean match$840(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isIntT()) && (null != m.get2() && m.get2().isIntT());
  }

  static final boolean match$841(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isStringT()) && (null != m.get2() && m.get2().isStringT());
  }

  static final boolean match$842(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFloat32T()) && (null != m.get2() && m.get2().isFloat32T());
  }

  static final boolean match$843(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFloat64T()) && (null != m.get2() && m.get2().isFloat64T());
  }

  static final boolean match$844(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isNodeTypeT()) && (null != m.get2() && m.get2().isNodeTypeT());
  }

  static final boolean match$845(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isStringT()) && (null != m.get2() && m.get2().isAnyT());
  }

  static final boolean match$846(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isAnyT()) && (null != m.get2() && m.get2().isStringT());
  }

  static final boolean match$847(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isAnyT());
  }

  static final boolean match$848(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isAnyT());
  }

  static final boolean match$849(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isNodeTypeT());
  }

  static final boolean match$850(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isNodeTypeT());
  }

  static final boolean match$851(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isTypeName()) && (null != m.get2() && m.get2().isTypeName());
  }

  static final boolean match$852(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isTypeName());
  }

  static final boolean match$853(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isTypeName());
  }

  static final boolean match$854(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isVariableT()) && (null != m.get2() && m.get2().isVariableT());
  }

  static final boolean match$855(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isVariableT());
  }

  static final boolean match$856(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isVariableT());
  }

  static final boolean match$857(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isPairOfType()) && (null != m.get2() && m.get2().isPairOfType());
  }

  static final boolean match$858(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFieldT()) && (null != m.get2() && m.get2().isFieldT());
  }

  static final boolean match$859(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFieldT());
  }

  static final boolean match$860(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isFieldT());
  }

  static final boolean match$861(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isRecordT()) && (null != m.get2() && m.get2().isRecordT());
  }

  static final boolean match$862(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isTupleT()) && (null != m.get2() && m.get2().isTupleT());
  }

  static final boolean match$863(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isConstructedT()) && (null != m.get2() && m.get2().isConstructedT());
  }

  static final boolean match$864(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isConstructedT() && "var".equals(m.get1().getTuple().get2()));
  }

  static final boolean match$865(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isConstructedT() && "var".equals(m.get2().getTuple().get2()));
  }

  static final boolean match$866(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isPolyVariantT());
  }

  static final boolean match$867(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isPolyVariantT());
  }

  static final boolean match$868(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isVariantT()) && (null != m.get2() && m.get2().isVariantT());
  }

  static final boolean match$870(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isConstructorT()) && (null != m.get2() && m.get2().isConstructorT());
  }

  static final boolean match$872(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isVariantT()) && (null != m.get2() && m.get2().isConstructorT());
  }

  static final boolean match$876(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isConstructorT()) && (null != m.get2() && m.get2().isVariantT());
  }

  static final boolean match$878(Tuple.T2<TypicalTypes.raw_type<?>, TypicalTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFunctionT()) && (null != m.get2() && m.get2().isFunctionT());
  }

  static final boolean match$932(Node m) {
    return null != m && m.hasName("TypeDefinition");
  }

  static final boolean match$944(Node m) {
    return null != m && m.hasName("AttributeDefinition");
  }

  static final boolean match$948(Node m) {
    return null != m && m.hasName("EqualAttributeDefinition");
  }

  static final boolean match$961(Node m) {
    return null != m && m.hasName("ScopeDefinition");
  }

  static final boolean match$965(Node m) {
    return null != m && m.hasName("NameSpaceDefinition");
  }

  static final boolean match$988(Pair<TypicalTypes.call> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$1046(Pair<String> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$1054(Node m) {
    return null != m && m.hasName("PolyVariantDeclaration");
  }

  static final boolean match$1068(Pair<TypicalTypes.entry> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$1072(Node m) {
    return null != m && m.hasName("LetBinding") && m.size() == 2;
  }

  static final boolean match$1074(Node m) {
    return null != m && m.hasName("TypedPattern") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("Variable"));
  }

  static final boolean match$1111(TypicalTypes.raw_type<?> m) {
    return null != m && m.isConstructedT() && "var".equals(m.getTuple().get2());
  }

  static final boolean match$1119(TypicalTypes.raw_type<?> m) {
    return null != m && m.isConstructedT() && "list".equals(m.getTuple().get2());
  }

  static final boolean match$1149(TypicalTypes.raw_type<?> m) {
    return null != m && m.isStringList();
  }

  static final boolean match$1194(Node m) {
    return null != m && m.hasName("TypeParameters") && m.size() >= 0;
  }

  static final boolean match$1198(Node m) {
    return null != m && m.hasName("NaryType") && m.size() >= 0;
  }

  static final boolean match$1202(Node m) {
    return null != m && m.hasName("Arguments") && m.size() >= 0;
  }

  static final boolean match$1210(Node m) {
    return null != m && m.hasName("LetBindings") && m.size() >= 0;
  }

  static final boolean match$1214(Node m) {
    return null != m && m.hasName("PatternMatch") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("Patterns") && m.getGeneric(0).size() >= 0);
  }

  static final boolean match$1284(Node m) {
    return null != m && m.hasName("PatternParameters") && m.size() >= 0;
  }

  static final boolean match$1725(TypicalTypes.raw_type<?> m) {
    return null != m && m.isStringName();
  }

  static final boolean match$1731(Pair<?> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$1732(Pair<?> m) {
    return m.size() == 1;
  }

  static final boolean match$1752(TypicalTypes.raw_type<?> m) {
    return null != m && m.isVariableT() && Boolean.TRUE.equals(m.getTuple().get2());
  }

  static final boolean match$1933(Pair<Node> m) {
    return m.size() == 2 && (null != m.get(1) && m.get(1).hasName("Arguments"));
  }

  static final boolean match$1934(Pair<Node> m) {
    return m.size() == 3 && (null != m.get(0) && m.get(0).hasName("UpperID")) && (null != m.get(1) && m.get(1).hasName("LowerID")) && (null != m.get(2) && m.get(2).hasName("Arguments") && m.get(2).size() >= 0);
  }

  static final boolean match$2014(Pair<Pair<String>> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$2081(Pair<String> m) {
    return m.size() == 1;
  }

  static final boolean match$2345(Node m) {
    return null != m && m.hasName("Variable");
  }

  static final boolean match$2349(Node m) {
    return null != m && m.hasName("MessageTag");
  }

  static final boolean match$2353(Node m) {
    return null != m && m.hasName("ReduceOptions");
  }

  static final boolean match$2357(Node m) {
    return null != m && m.hasName("LowerID");
  }

  static final boolean match$2361(Node m) {
    return null != m && m.hasName("UpperID");
  }

  static final boolean match$2365(Node m) {
    return null != m && m.hasName("UserDefinedType");
  }

  static final boolean match$2369(Node m) {
    return null != m && m.hasName("TypeVariable");
  }

  static final boolean match$2450(Node m) {
    return null != m && m.hasName("StringLiteral") && m.size() == 1;
  }

  static final boolean match$2454(Node m) {
    return null != m && m.hasName("IntegerLiteral") && m.size() == 1;
  }

  static final boolean match$2458(Node m) {
    return null != m && m.hasName("FloatingLiteral") && m.size() == 1;
  }

  static final boolean match$2462(Node m) {
    return null != m && m.hasName("BooleanLiteral") && m.size() == 1;
  }

  static final boolean match$2475(Pair<TypicalTypes.patternRecord> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$2497(TypicalTypes.pattern m) {
    return null != m && m.isWildCardPattern();
  }

  static final boolean match$2499(TypicalTypes.pattern m) {
    return null != m && m.isVariablePattern();
  }

  static final boolean match$2500(TypicalTypes.pattern m) {
    return null != m && m.isBotPattern();
  }

  static final boolean match$2504(TypicalTypes.pattern m) {
    return null != m && m.isConstantPattern();
  }

  static final boolean match$2508(Tuple.T2<TypicalTypes.value, TypicalTypes.value> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isStringValue()) && (null != m.get2() && m.get2().isStringValue());
  }

  static final boolean match$2509(Tuple.T2<TypicalTypes.value, TypicalTypes.value> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFloatValue()) && (null != m.get2() && m.get2().isFloatValue());
  }

  static final boolean match$2510(Tuple.T2<TypicalTypes.value, TypicalTypes.value> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isIntValue()) && (null != m.get2() && m.get2().isIntValue());
  }

  static final boolean match$2511(Tuple.T2<TypicalTypes.value, TypicalTypes.value> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isBoolValue()) && (null != m.get2() && m.get2().isBoolValue());
  }

  static final boolean match$2514(TypicalTypes.pattern m) {
    return null != m && m.isTupPattern();
  }

  static final boolean match$2518(TypicalTypes.pattern m) {
    return null != m && m.isConstructorPattern();
  }

  static final boolean match$2522(TypicalTypes.pattern m) {
    return null != m && m.isEmptyPattern();
  }

  static final boolean match$2526(TypicalTypes.pattern m) {
    return null != m && m.isPairPattern();
  }

  static final boolean match$2530(TypicalTypes.pattern m) {
    return null != m && m.isRecPattern();
  }

  static final boolean match$2534(TypicalTypes.pattern m) {
    return null != m && m.isRecFieldPattern();
  }

  static final boolean match$2547(Tuple.T2<TypicalTypes.pattern, TypicalTypes.pattern> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isVariablePattern()) && (null != m.get2() && m.get2().isVariablePattern());
  }

  static final boolean match$2548(Tuple.T2<TypicalTypes.pattern, TypicalTypes.pattern> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isBotPattern()) && (null != m.get2() && m.get2().isBotPattern());
  }

  static final boolean match$2549(Tuple.T2<TypicalTypes.pattern, TypicalTypes.pattern> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isConstantPattern()) && (null != m.get2() && m.get2().isConstantPattern());
  }

  static final boolean match$2556(Tuple.T2<TypicalTypes.pattern, TypicalTypes.pattern> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isTupPattern()) && (null != m.get2() && m.get2().isTupPattern());
  }

  static final boolean match$2557(Tuple.T2<TypicalTypes.pattern, TypicalTypes.pattern> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isConstructorPattern()) && (null != m.get2() && m.get2().isConstructorPattern());
  }

  static final boolean match$2614(Pair<Pair<TypicalTypes.patternRecord>> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$2634(TypicalTypes.result m) {
    return null != m && m.isNone();
  }

  static final boolean match$2635(TypicalTypes.result m) {
    return null != m && m.isSome();
  }

  static final boolean match$2643(Pair<TypicalTypes.constr> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$2646(TypicalTypes.constr m) {
    return null != m && m.isWildConstr();
  }

  static final boolean match$2662(TypicalTypes.constr m) {
    return null != m && m.isBotConstr();
  }

  static final boolean match$2664(TypicalTypes.constr m) {
    return null != m && m.isConst();
  }

  static final boolean match$2665(TypicalTypes.constr m) {
    return null != m && m.isEmptyConstr();
  }

  static final boolean match$2666(TypicalTypes.constr m) {
    return null != m && m.isRecordConstr();
  }

  static final boolean match$2667(TypicalTypes.constr m) {
    return null != m && m.isTupleConstr();
  }

  static final boolean match$2671(TypicalTypes.constr m) {
    return null != m && m.isPairConstr();
  }

  static final boolean match$2675(TypicalTypes.constr m) {
    return null != m && m.isCConstr();
  }

  static final boolean match$2721(Pair<TypicalTypes.pattern> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$2743(TypicalTypes.value m) {
    return null != m && m.isBoolValue();
  }

  static final boolean match$2776(TypicalTypes.value m) {
    return null != m && m.isIntValue();
  }

  static final boolean match$2777(TypicalTypes.value m) {
    return null != m && m.isFloatValue();
  }

  static final boolean match$2778(TypicalTypes.value m) {
    return null != m && m.isStringValue();
  }

  static final boolean match$2834(Pair<TypicalTypes.pattern> m) {
    return m.size() == 1;
  }

  static final boolean match$2839(Pair<TypicalTypes.patternRecord> m) {
    return m.size() == 1;
  }

  private TypicalSupport() {
  }
}
