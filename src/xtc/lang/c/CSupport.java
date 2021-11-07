// ===========================================================================
// This file has been generated by
// Typical, version 1.14.3,
// (C) 2004-2009 Robert Grimm and New York University,
// on Monday, September 28, 2009 at 12:18:32 PM.
// Edit at your own risk.
// ===========================================================================

package xtc.lang.c;

import xtc.util.Pair;

import xtc.tree.Node;

import xtc.typical.Analyzer;
import xtc.typical.Primitives;
import xtc.typical.Tuple;

/** Helper functionality for C. */
public class CSupport {
  static final Primitives.Map<CTypes.type, Node> map$213 = new Primitives.Map<CTypes.type, Node>();
  static final Primitives.Map<CTypes.gcc_attribute, Node> map$340 = new Primitives.Map<CTypes.gcc_attribute, Node>();
  static final Primitives.Append<CTypes.gcc_attribute> append$341 = new Primitives.Append<CTypes.gcc_attribute>();
  static final Primitives.Head<Node> head$355 = new Primitives.Head<Node>();
  static final Primitives.Nth<CTypes.type> nth$450 = new Primitives.Nth<CTypes.type>();
  static final Primitives.Head<CTypes.type> head$728 = new Primitives.Head<CTypes.type>();
  static final Primitives.Exists<CTypes.type> exists$838 = new Primitives.Exists<CTypes.type>();
  static final Primitives.Tail<CTypes.type> tail$1020 = new Primitives.Tail<CTypes.type>();
  static final Primitives.Union<CTypes.qualifier> union$1392 = new Primitives.Union<CTypes.qualifier>();
  static final Primitives.Append<CTypes.type> append$1407 = new Primitives.Append<CTypes.type>();
  static final Primitives.Append<CTypes.label_record> append$1417 = new Primitives.Append<CTypes.label_record>();
  static final Primitives.Exists<Node> exists$1686 = new Primitives.Exists<Node>();
  static final Primitives.Union<CTypes.label_record> union$1863 = new Primitives.Union<CTypes.label_record>();
  static final Primitives.Flatten<CTypes.label_record> flatten$1905 = new Primitives.Flatten<CTypes.label_record>();
  static final Primitives.Map<Pair<CTypes.label_record>, Node> map$1906 = new Primitives.Map<Pair<CTypes.label_record>, Node>();

  static final boolean match$2(Node m) {
    return null != m && m.hasName("PrimaryIdentifier") && m.size() == 1;
  }

  static final boolean match$6(Node m) {
    return null != m && m.hasName("SimpleDeclarator") && m.size() == 1;
  }

  static final boolean match$10(Node m) {
    return null != m && m.hasName("PointerDeclarator") && m.size() == 2;
  }

  static final boolean match$14(Node m) {
    return null != m && m.hasName("ArrayDeclarator") && m.size() == 3;
  }

  static final boolean match$18(Node m) {
    return null != m && m.hasName("FunctionDeclarator") && m.size() == 2;
  }

  static final boolean match$22(Node m) {
    return null != m && m.hasName("Enumerator") && m.size() == 2;
  }

  static final boolean match$26(Node m) {
    return null != m && m.hasName("TypedefName") && m.size() == 1;
  }

  static final boolean match$30(Node m) {
    return null != m && m.hasName("LabeledStatement") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("NamedLabel") && m.getGeneric(0).size() == 2);
  }

  static final boolean match$34(Node m) {
    return null != m && m.hasName("NamedLabel") && m.size() == 2;
  }

  static final boolean match$38(Node m) {
    return null != m && m.hasName("LabelAddressExpression") && m.size() == 1;
  }

  static final boolean match$42(Node m) {
    return null != m && m.hasName("DefaultLabel");
  }

  static final boolean match$46(Node m) {
    return null != m && m.hasName("GotoStatement") && m.size() == 2 && (null != m.getGeneric(1) && m.getGeneric(1).hasName("PrimaryIdentifier") && m.getGeneric(1).size() == 1);
  }

  static final boolean match$50(Node m) {
    return null != m && m.hasName("StructureTypeReference") && m.size() == 2;
  }

  static final boolean match$54(Node m) {
    return null != m && m.hasName("UnionTypeReference") && m.size() == 2;
  }

  static final boolean match$58(Node m) {
    return null != m && m.hasName("EnumerationTypeDefinition") && m.size() == 4;
  }

  static final boolean match$62(Node m) {
    return null != m && m.hasName("EnumerationTypeReference") && m.size() == 2;
  }

  static final boolean match$66(Node m) {
    return null != m && m.hasName("AttributedDeclarator") && m.size() == 3;
  }

  static final boolean match$70(Node m) {
    return null != m && m.hasName("IndirectComponentSelection") && m.size() == 2;
  }

  public static final Analyzer.NodeMatch nodeMatch$76 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("FunctionDefinition"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$78 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("ParameterTypeList"));
    }
  };

  static final boolean match$79(Node m) {
    return null != m && m.hasName("FunctionDeclarator") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("SimpleDeclarator") && m.getGeneric(0).size() == 1);
  }

  static final boolean match$80(Node m) {
    return null != m && m.hasName("FunctionDefinition") && m.size() == 5;
  }

  static final boolean match$82(Node m) {
    return null != m && m.hasName("ForStatement") && m.size() == 4 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("Declaration"));
  }

  static final boolean match$83(Node m) {
    return null != m && m.hasName("ForStatement") && m.size() == 4;
  }

  static final boolean match$84(Node m) {
    return null != m && m.hasName("CompoundStatement");
  }

  public static final Analyzer.NodeMatch nodeMatch$87 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Unsigned"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$89 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Long"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$92 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Int"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$97 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Signed"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$112 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Short"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$119 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Double"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$121 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Complex"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$135 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Char"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$139 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Float"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$160 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("VoidTypeSpecifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$166 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("Bool"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$168 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("VarArgListSpecifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$170 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("StructureTypeDefinition"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$173 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("StructureTypeReference"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$176 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("UnionTypeDefinition"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$179 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("UnionTypeReference"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$182 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("EnumerationTypeDefinition"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$185 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("EnumerationTypeReference"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$188 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("TypedefName"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$191 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("TypeofSpecifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$194 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("ExternSpecifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$196 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("RegisterSpecifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$198 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("StaticSpecifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$200 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("TypedefSpecifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$202 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("AutoSpecifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$204 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("ConstantQualifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$206 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("VolatileQualifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$208 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("RestrictQualifier"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$210 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("FunctionSpecifier"));
    }
  };

  static final boolean match$212(Node m) {
    return null != m && m.hasName("TranslationUnit") && m.size() >= 0;
  }

  static final boolean match$219(Node m) {
    return null != m && m.hasName("Declaration") && m.size() == 3;
  }

  static final boolean match$225(Node m) {
    return null != m && m.hasName("DeclarationList") && m.size() >= 0;
  }

  static final boolean match$236(Node m) {
    return null != m && m.hasName("EmptyDefinition");
  }

  static final boolean match$240(Node m) {
    return null != m && m.hasName("AssemblyDefinition");
  }

  static final boolean match$246(Node m) {
    return null != m && m.hasName("DeclarationSpecifiers") && m.size() >= 0;
  }

  static final boolean match$255(Node m) {
    return null != m && m.hasName("EnumerationTypeDefinition") && m.size() == 4 && (null != m.getGeneric(2) && m.getGeneric(2).hasName("EnumeratorList"));
  }

  static final boolean match$257(Node m) {
    return null != m && m.hasName("EnumeratorList") && m.size() >= 0;
  }

  static final boolean match$273(Node m) {
    return null != m && m.hasName("StructureTypeDefinition") && m.size() == 4;
  }

  public static final Analyzer.NodeMatch nodeMatch$275 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("StructureDeclarationList"));
    }
  };

  static final boolean match$277(CTypes.raw_type<?> m) {
    return null != m && m.isListT();
  }

  static final boolean match$280(CTypes.raw_type<?> m) {
    return null != m && m.isStructT();
  }

  public static final Analyzer.NodeMatch nodeMatch$283 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("ParameterDeclaration"));
    }
  };

  static final boolean match$292(Node m) {
    return null != m && m.hasName("UnionTypeDefinition") && m.size() == 4;
  }

  static final boolean match$312(Node m) {
    return null != m && m.hasName("TypeofSpecifier") && m.size() == 1;
  }

  static final boolean match$314(Node m) {
    return null != m && m.hasName("TypeName");
  }

  static final boolean match$330(Node m) {
    return null != m && m.hasName("AttributeSpecifierList") && m.size() >= 0;
  }

  static final boolean match$336(Pair<Node> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$339(Node m) {
    return null != m && m.hasName("AttributeSpecifier") && m.size() == 1 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("AttributeList") && m.getGeneric(0).size() >= 0);
  }

  static final boolean match$351(Node m) {
    return null != m && m.hasName("AttributeListEntry") && m.size() == 2;
  }

  static final boolean match$354(Node m) {
    return null != m && m.hasName("ExpressionList") && m.size() >= 0;
  }

  static final boolean match$366(Node m) {
    return null != m && m.hasName("InitializedDeclaratorList") && m.size() >= 0;
  }

  static final boolean match$379(Node m) {
    return null != m && m.hasName("InitializedDeclarator") && m.size() == 5;
  }

  static final boolean match$394(Node m) {
    return null != m && m.hasName("IdentifierList") && m.size() >= 0;
  }

  static final boolean match$400(CTypes.raw_type<?> m) {
    return null != m && m.isVoidT();
  }

  static final boolean match$409(Node m) {
    return null != m && m.hasName("ArrayDeclarator") && m.size() == 3 && (null != m.getGeneric(1) && m.getGeneric(1).hasName("ArrayQualifierList"));
  }

  static final boolean match$411(Node m) {
    return null != m && m.hasName("ArrayQualifierList") && m.size() >= 0;
  }

  public static final Analyzer.NodeMatch nodeMatch$424 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("StructureDeclaration"));
    }
  };

  static final boolean match$432(Node m) {
    return null != m && m.hasName("BitField") && m.size() == 4;
  }

  static final boolean match$441(Node m) {
    return null != m && m.hasName("EmptyStatement");
  }

  static final boolean match$445(Node m) {
    return null != m && m.hasName("ExpressionStatement") && m.size() == 1;
  }

  static final boolean match$449(Node m) {
    return null != m && m.hasName("CompoundStatement") && m.size() >= 0;
  }

  static final boolean match$454(Node m) {
    return null != m && m.hasName("IfElseStatement") && m.size() == 3;
  }

  static final boolean match$458(Node m) {
    return null != m && m.hasName("IfStatement") && m.size() == 2;
  }

  static final boolean match$462(Node m) {
    return null != m && m.hasName("WhileStatement") && m.size() == 2;
  }

  static final boolean match$466(Node m) {
    return null != m && m.hasName("DoStatement") && m.size() == 2;
  }

  static final boolean match$470(Node m) {
    return null != m && m.hasName("SwitchStatement") && m.size() == 2;
  }

  static final boolean match$478(Node m) {
    return null != m && m.hasName("BreakStatement");
  }

  static final boolean match$482(Node m) {
    return null != m && m.hasName("ContinueStatement");
  }

  static final boolean match$486(Node m) {
    return null != m && m.hasName("GotoStatement") && m.size() == 2 && (null != m.getGeneric(1) && m.getGeneric(1).hasName("PrimaryIdentifier"));
  }

  static final boolean match$499(Node m) {
    return null != m && m.hasName("GotoStatement") && m.size() == 2;
  }

  static final boolean match$503(Node m) {
    return null != m && m.hasName("LabeledStatement") && m.size() == 2;
  }

  static final boolean match$507(Node m) {
    return null != m && m.hasName("AssemblyStatement");
  }

  static final boolean match$511(Node m) {
    return null != m && m.hasName("ReturnStatement") && m.size() == 1;
  }

  static final boolean match$539(Node m) {
    return null != m && m.hasName("CommaExpression") && m.size() == 2;
  }

  static final boolean match$543(Node m) {
    return null != m && m.hasName("AssignmentExpression") && m.size() == 3;
  }

  static final boolean match$549(Node m) {
    return null != m && m.hasName("ConditionalExpression") && m.size() == 3;
  }

  static final boolean match$553(Node m) {
    return null != m && m.hasName("LogicalAndExpression") && m.size() == 2;
  }

  static final boolean match$557(Node m) {
    return null != m && m.hasName("LogicalOrExpression") && m.size() == 2;
  }

  static final boolean match$561(Node m) {
    return null != m && m.hasName("LogicalNegationExpression") && m.size() == 1;
  }

  static final boolean match$565(Node m) {
    return null != m && m.hasName("BitwiseOrExpression") && m.size() == 2;
  }

  static final boolean match$569(Node m) {
    return null != m && m.hasName("BitwiseAndExpression") && m.size() == 2;
  }

  static final boolean match$573(Node m) {
    return null != m && m.hasName("BitwiseXorExpression") && m.size() == 2;
  }

  static final boolean match$577(Node m) {
    return null != m && m.hasName("BitwiseNegationExpression") && m.size() == 1;
  }

  static final boolean match$581(Node m) {
    return null != m && m.hasName("EqualityExpression") && m.size() == 3;
  }

  static final boolean match$585(Node m) {
    return null != m && m.hasName("RelationalExpression") && m.size() == 3;
  }

  static final boolean match$589(Node m) {
    return null != m && m.hasName("ShiftExpression") && m.size() == 3 && "<<".equals(m.getString(1));
  }

  static final boolean match$593(Node m) {
    return null != m && m.hasName("ShiftExpression") && m.size() == 3 && ">>".equals(m.getString(1));
  }

  static final boolean match$597(Node m) {
    return null != m && m.hasName("AdditiveExpression") && m.size() == 3;
  }

  static final boolean match$603(Node m) {
    return null != m && m.hasName("MultiplicativeExpression") && m.size() == 3;
  }

  public static final Analyzer.NodeMatch nodeMatch$606 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("InitializedDeclarator"));
    }
  };

  static final boolean match$621(Node m) {
    return null != m && m.hasName("SizeofExpression") && m.size() == 1;
  }

  static final boolean match$634(Node m) {
    return null != m && m.hasName("AlignofExpression") && m.size() == 1;
  }

  static final boolean match$647(Node m) {
    return null != m && m.hasName("UnaryPlusExpression") && m.size() == 1;
  }

  static final boolean match$651(Node m) {
    return null != m && m.hasName("UnaryMinusExpression") && m.size() == 1;
  }

  static final boolean match$655(Node m) {
    return null != m && m.hasName("AddressExpression") && m.size() == 1;
  }

  static final boolean match$657(Node m) {
    return null != m && m.hasName("IndirectionExpression") && m.size() == 1;
  }

  static final boolean match$661(Node m) {
    return null != m && m.hasName("SubscriptExpression") && m.size() == 2;
  }

  static final boolean match$680(Node m) {
    return null != m && m.hasName("PreincrementExpression") && m.size() == 1;
  }

  static final boolean match$684(Node m) {
    return null != m && m.hasName("PredecrementExpression") && m.size() == 1;
  }

  static final boolean match$688(Node m) {
    return null != m && m.hasName("ExtensionExpression") && m.size() == 1;
  }

  static final boolean match$692(Node m) {
    return null != m && m.hasName("PostdecrementExpression") && m.size() == 1;
  }

  static final boolean match$696(Node m) {
    return null != m && m.hasName("PostincrementExpression") && m.size() == 1;
  }

  static final boolean match$700(Node m) {
    return null != m && m.hasName("StatementAsExpression") && m.size() == 1;
  }

  static final boolean match$704(Node m) {
    return null != m && m.hasName("CastExpression") && m.size() == 2;
  }

  static final boolean match$706(Node m) {
    return null != m && m.hasName("InitializerList");
  }

  static final boolean match$721(Node m) {
    return null != m && m.hasName("OffsetofExpression") && m.size() == 2;
  }

  static final boolean match$725(Node m) {
    return null != m && m.hasName("FunctionCall") && m.size() == 2;
  }

  static final boolean match$748(Node m) {
    return null != m && m.hasName("DirectComponentSelection") && m.size() == 2;
  }

  public static final Analyzer.NodeMatch nodeMatch$754 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("AddressExpression"));
    }
  };

  static final boolean match$758(Node m) {
    return null != m && m.hasName("CompoundLiteral") && m.size() == 2;
  }

  static final boolean match$762(Node m) {
    return null != m && m.hasName("VariableArgumentAccess") && m.size() == 2;
  }

  static final boolean match$771(Node m) {
    return null != m && m.hasName("FloatingConstant") && m.size() == 1;
  }

  static final boolean match$775(Node m) {
    return null != m && m.hasName("StringConstant") && m.size() >= 0;
  }

  static final boolean match$779(Node m) {
    return null != m && m.hasName("CharacterConstant") && m.size() == 1;
  }

  static final boolean match$783(Node m) {
    return null != m && m.hasName("IntegerConstant") && m.size() == 1;
  }

  static final boolean match$792(Node m) {
    return null != m && m.hasName("StructureDeclarationList") && m.size() >= 0;
  }

  static final boolean match$801(Pair<?> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$802(Pair<?> m) {
    return m.size() == 1;
  }

  static final boolean match$806(Node m) {
    return null != m && m.hasName("TypeName") && m.size() == 2;
  }

  static final boolean match$815(Node m) {
    return null != m && m.hasName("Pointer") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("TypeQualifierList") && m.getGeneric(0).size() >= 0) && null == m.getGeneric(1);
  }

  static final boolean match$819(Node m) {
    return null != m && m.hasName("Pointer") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("TypeQualifierList"));
  }

  static final boolean match$821(Node m) {
    return null != m && m.hasName("TypeQualifierList") && m.size() >= 0;
  }

  static final boolean match$837(Node m) {
    return null != m && m.hasName("ParameterTypeList") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("ParameterList"));
  }

  static final boolean match$840(Node m) {
    return null != m && m.hasName("ParameterList") && m.size() >= 0;
  }

  static final boolean match$856(Node m) {
    return null != m && m.hasName("CaseLabel") && m.size() >= 1;
  }

  static final boolean match$870(Node m) {
    return null != m && m.hasName("StructureDeclaration") && m.size() == 3;
  }

  static final boolean match$879(Node m) {
    return null != m && m.hasName("StructureDeclaratorList") && m.size() >= 0;
  }

  static final boolean match$892(Node m) {
    return null != m && m.hasName("SpecifierQualifierList") && m.size() >= 0;
  }

  static final boolean match$901(Node m) {
    return null != m && m.hasName("AbstractDeclarator") && m.size() == 2;
  }

  static final boolean match$910(Node m) {
    return null != m && m.hasName("ParameterDeclaration") && m.size() == 3;
  }

  static final boolean match$912(Node m) {
    return null != m && m.hasName("AbstractDeclarator");
  }

  static final boolean match$937(Node m) {
    return null != m && m.hasName("DirectAbstractDeclarator") && m.size() == 3;
  }

  static final boolean match$945(Node m) {
    return null != m && m.hasName("AttributedAbstractDeclarator") && m.size() == 2;
  }

  static final boolean match$972(CTypes.raw_type<?> m) {
    return null != m && m.isUnionT();
  }

  static final boolean match$975(Pair<CTypes.type> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$978(CTypes.raw_type<?> m) {
    return null != m && m.isMemberT();
  }

  public static final Analyzer.NodeMatch nodeMatch$999 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("DoStatement"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$1001 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("WhileStatement"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$1003 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("ForStatement"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$1005 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("SwitchStatement"));
    }
  };

  public static final Analyzer.NodeMatch nodeMatch$1015 = new Analyzer.NodeMatch() {
    public Boolean apply(Node m) {
      return (null != m && m.hasName("CompoundStatement"));
    }
  };

  static final boolean match$1023(Pair<String> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$1027(Pair<CTypes.label_record> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$1031(Node m) {
    return null != m && m.hasName("VariableLength");
  }

  static final boolean match$1041(CTypes.valueType m) {
    return null != m && m.isIValue();
  }

  static final boolean match$1042(CTypes.valueType m) {
    return null != m && m.isFValue();
  }

  static final boolean match$1045(Tuple.T2<CTypes.valueType, CTypes.valueType> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isIValue()) && (null != m.get2() && m.get2().isIValue());
  }

  static final boolean match$1046(Tuple.T2<CTypes.valueType, CTypes.valueType> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFValue()) && (null != m.get2() && m.get2().isFValue());
  }

  static final boolean match$1049(Pair<CTypes.qualifier> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$1053(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isStructT()) && (null != m.get2() && m.get2().isStructT());
  }

  static final boolean match$1054(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isUnionT()) && (null != m.get2() && m.get2().isUnionT());
  }

  static final boolean match$1055(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isPointerT()) && (null != m.get2() && m.get2().isPointerT());
  }

  static final boolean match$1056(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFunctionT()) && (null != m.get2() && m.get2().isFunctionT());
  }

  static final boolean match$1059(CTypes.raw_type<?> m) {
    return null != m && m.isPointerT();
  }

  static final boolean match$1060(CTypes.raw_type<?> m) {
    return null != m && m.isArrayT();
  }

  static final boolean match$1082(CTypes.raw_type<?> m) {
    return null != m && m.isFunctionT();
  }

  static final boolean match$1092(Pair<CTypes.gcc_attribute> m) {
    return null != m && ((Pair)m).isEmpty();
  }

  static final boolean match$1105(CTypes.raw_type<?> m) {
    return null != m && m.isEnumT();
  }

  static final boolean match$1108(CTypes.raw_type<?> m) {
    return null != m && m.isBoolT();
  }

  static final boolean match$1109(CTypes.raw_type<?> m) {
    return null != m && m.isCharT();
  }

  static final boolean match$1110(CTypes.raw_type<?> m) {
    return null != m && m.isSCharT();
  }

  static final boolean match$1111(CTypes.raw_type<?> m) {
    return null != m && m.isUCharT();
  }

  static final boolean match$1112(CTypes.raw_type<?> m) {
    return null != m && m.isShortT();
  }

  static final boolean match$1113(CTypes.raw_type<?> m) {
    return null != m && m.isUShortT();
  }

  static final boolean match$1114(CTypes.raw_type<?> m) {
    return null != m && m.isIntT();
  }

  static final boolean match$1115(CTypes.raw_type<?> m) {
    return null != m && m.isUIntT();
  }

  static final boolean match$1116(CTypes.raw_type<?> m) {
    return null != m && m.isLongT();
  }

  static final boolean match$1117(CTypes.raw_type<?> m) {
    return null != m && m.isULongT();
  }

  static final boolean match$1118(CTypes.raw_type<?> m) {
    return null != m && m.isLongLongT();
  }

  static final boolean match$1119(CTypes.raw_type<?> m) {
    return null != m && m.isULongLongT();
  }

  static final boolean match$1120(CTypes.raw_type<?> m) {
    return null != m && m.isFloatT();
  }

  static final boolean match$1121(CTypes.raw_type<?> m) {
    return null != m && m.isDoubleT();
  }

  static final boolean match$1122(CTypes.raw_type<?> m) {
    return null != m && m.isLongDoubleT();
  }

  static final boolean match$1123(CTypes.raw_type<?> m) {
    return null != m && m.isFloatComplexT();
  }

  static final boolean match$1124(CTypes.raw_type<?> m) {
    return null != m && m.isDoubleComplexT();
  }

  static final boolean match$1125(CTypes.raw_type<?> m) {
    return null != m && m.isLongDoubleComplexT();
  }

  static final boolean match$1129(CTypes.raw_type<?> m) {
    return null != m && m.isBitfieldT();
  }

  static final boolean match$1166(CTypes.arraySize m) {
    return null != m && m.isFixed();
  }

  static final boolean match$1210(CTypes.storageClass m) {
    return null != m && m.isExternS();
  }

  static final boolean match$1211(CTypes.storageClass m) {
    return null != m && m.isStaticS();
  }

  static final boolean match$1214(CTypes.storageClass m) {
    return null != m && m.isAutoS();
  }

  static final boolean match$1217(CTypes.storageClass m) {
    return null != m && m.isRegisterS();
  }

  static final boolean match$1220(CTypes.storageClass m) {
    return null != m && m.isTypedefS();
  }

  static final boolean match$1250(CTypes.valueType m) {
    return null != m && m.isSValue();
  }

  static final boolean match$1265(CTypes.raw_type<?> m) {
    return null != m && m.isComplexT();
  }

  static final boolean match$1316(CTypes.arraySize m) {
    return null != m && m.isIncomplete();
  }

  static final boolean match$1344(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isArrayT()) && (null != m.get2() && m.get2().isArrayT());
  }

  static final boolean match$1346(Tuple.T2<CTypes.arraySize, CTypes.arraySize> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isVarLength()) && (null != m.get2() && m.get2().isVarLength());
  }

  static final boolean match$1347(Tuple.T2<CTypes.arraySize, CTypes.arraySize> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFixed()) && (null != m.get2() && m.get2().isFixed());
  }

  static final boolean match$1348(Tuple.T2<CTypes.arraySize, CTypes.arraySize> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isFixed());
  }

  static final boolean match$1349(Tuple.T2<CTypes.arraySize, CTypes.arraySize> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isFixed());
  }

  static final boolean match$1366(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isULongLongT());
  }

  static final boolean match$1367(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isULongLongT());
  }

  static final boolean match$1368(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isLongLongT());
  }

  static final boolean match$1369(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isLongLongT());
  }

  static final boolean match$1370(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isULongT());
  }

  static final boolean match$1371(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isULongT());
  }

  static final boolean match$1372(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isLongT());
  }

  static final boolean match$1373(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isLongT());
  }

  static final boolean match$1374(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isUIntT());
  }

  static final boolean match$1375(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isUIntT());
  }

  static final boolean match$1376(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isIntT());
  }

  static final boolean match$1377(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isIntT());
  }

  static final boolean match$1378(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isUShortT());
  }

  static final boolean match$1379(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isUShortT());
  }

  static final boolean match$1380(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isShortT());
  }

  static final boolean match$1381(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isShortT());
  }

  static final boolean match$1382(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get1() && m.get1().isCharT());
  }

  static final boolean match$1383(Tuple.T2<CTypes.raw_type<?>, CTypes.raw_type<?>> m) {
    return null != m && m.size() == 2 && (null != m.get2() && m.get2().isCharT());
  }

  static final boolean match$1538(Node m) {
    return null != m && m.hasName("ShiftExpression") && m.size() == 3;
  }

  static final boolean match$1558(Node m) {
    return null != m && m.hasName("FunctionCall") && m.size() == 2 && (null != m.getGeneric(1) && m.getGeneric(1).hasName("ExpressionList"));
  }

  static final boolean match$1571(Node m) {
    return null != m && m.hasName("InitializerList") && m.size() >= 0;
  }

  static final boolean match$1678(Node m) {
    return null != m && m.hasName("Declaration") && m.size() == 3 && (null != m.getGeneric(2) && m.getGeneric(2).hasName("InitializedDeclaratorList") && m.getGeneric(2).size() >= 0);
  }

  static final boolean match$1708(Node m) {
    return null != m && m.hasName("InitializerListEntry") && m.size() == 2;
  }

  static final boolean match$1717(Node m) {
    return null != m && m.hasName("Declaration");
  }

  static final boolean match$1721(Node m) {
    return null != m && m.hasName("FunctionDefinition");
  }

  static final boolean match$1738(Node m) {
    return null != m && m.hasName("ExpressionStatement");
  }

  static final boolean match$1746(Node m) {
    return null != m && m.hasName("IfElseStatement");
  }

  static final boolean match$1750(Node m) {
    return null != m && m.hasName("IfStatement");
  }

  static final boolean match$1754(Node m) {
    return null != m && m.hasName("WhileStatement");
  }

  static final boolean match$1758(Node m) {
    return null != m && m.hasName("DoStatement");
  }

  static final boolean match$1762(Node m) {
    return null != m && m.hasName("ForStatement");
  }

  static final boolean match$1766(Node m) {
    return null != m && m.hasName("SwitchStatement");
  }

  static final boolean match$1770(Node m) {
    return null != m && m.hasName("LabeledStatement");
  }

  static final boolean match$1782(Node m) {
    return null != m && m.hasName("ReturnStatement");
  }

  static final boolean match$1786(Node m) {
    return null != m && m.hasName("GotoStatement");
  }

  static final boolean match$1803(Node m) {
    return null != m && m.hasName("InitializedDeclaratorList");
  }

  static final boolean match$1812(Node m) {
    return null != m && m.hasName("InitializedDeclarator");
  }

  static final boolean match$1821(Node m) {
    return null != m && m.hasName("InitializerListEntry");
  }

  static final boolean match$1871(Node m) {
    return null != m && m.hasName("LabeledStatement") && m.size() == 2 && (null != m.getGeneric(0) && m.getGeneric(0).hasName("NamedLabel"));
  }

  static final boolean match$1908(Node m) {
    return null != m && m.hasName("LocalLabelDeclaration") && m.size() >= 0;
  }

  static final boolean match$1963(Node m) {
    return null != m && m.hasName("Designation") && m.size() >= 0;
  }

  static final boolean match$1967(Node m) {
    return null != m && m.hasName("ObsoleteArrayDesignation") && m.size() >= 2;
  }

  static final boolean match$1971(Node m) {
    return null != m && m.hasName("ObsoleteFieldDesignation") && m.size() == 1;
  }

  static final boolean match$1980(Node m) {
    return null != m && m.hasName("Designator") && m.size() >= 2 && ".".equals(m.getString(0)) && (null != m.getGeneric(1) && m.getGeneric(1).hasName("PrimaryIdentifier") && m.getGeneric(1).size() == 1);
  }

  static final boolean match$1984(Node m) {
    return null != m && m.hasName("Designator") && m.size() >= 2 && "[".equals(m.getString(0));
  }

  static final boolean match$1997(Node m) {
    return null != m && m.hasName("InitializerListEntry") && m.size() == 2 && (null != m.getGeneric(1) && m.getGeneric(1).hasName("InitializerList"));
  }

  private CSupport() {
  }
}