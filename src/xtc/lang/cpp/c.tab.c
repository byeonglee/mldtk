/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.5"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */


/* Line 268 of yacc.c  */
#line 71 "c.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     AUTO = 258,
     DOUBLE = 259,
     INT = 260,
     STRUCT = 261,
     BREAK = 262,
     ELSE = 263,
     LONG = 264,
     SWITCH = 265,
     CASE = 266,
     ENUM = 267,
     REGISTER = 268,
     TYPEDEF = 269,
     CHAR = 270,
     EXTERN = 271,
     RETURN = 272,
     UNION = 273,
     CONST = 274,
     FLOAT = 275,
     SHORT = 276,
     UNSIGNED = 277,
     CONTINUE = 278,
     FOR = 279,
     SIGNED = 280,
     VOID = 281,
     DEFAULT = 282,
     GOTO = 283,
     SIZEOF = 284,
     VOLATILE = 285,
     DO = 286,
     IF = 287,
     STATIC = 288,
     WHILE = 289,
     IDENTIFIER = 290,
     STRINGliteral = 291,
     FLOATINGconstant = 292,
     INTEGERconstant = 293,
     CHARACTERconstant = 294,
     OCTALconstant = 295,
     HEXconstant = 296,
     TYPEDEFname = 297,
     ARROW = 298,
     ICR = 299,
     DECR = 300,
     LS = 301,
     RS = 302,
     LE = 303,
     GE = 304,
     EQ = 305,
     NE = 306,
     ANDAND = 307,
     OROR = 308,
     ELLIPSIS = 309,
     MULTassign = 310,
     DIVassign = 311,
     MODassign = 312,
     PLUSassign = 313,
     MINUSassign = 314,
     LSassign = 315,
     RSassign = 316,
     ANDassign = 317,
     ERassign = 318,
     ORassign = 319,
     LPAREN = 320,
     RPAREN = 321,
     COMMA = 322,
     HASH = 323,
     DHASH = 324,
     LBRACE = 325,
     RBRACE = 326,
     LBRACK = 327,
     RBRACK = 328,
     DOT = 329,
     AND = 330,
     STAR = 331,
     PLUS = 332,
     MINUS = 333,
     NEGATE = 334,
     NOT = 335,
     DIV = 336,
     MOD = 337,
     LT = 338,
     GT = 339,
     XOR = 340,
     PIPE = 341,
     QUESTION = 342,
     COLON = 343,
     SEMICOLON = 344,
     ASSIGN = 345,
     ASMSYM = 346,
     _BOOL = 347,
     _COMPLEX = 348,
     RESTRICT = 349,
     __ALIGNOF = 350,
     __ALIGNOF__ = 351,
     ASM = 352,
     __ASM = 353,
     __ASM__ = 354,
     AT = 355,
     USD = 356,
     __ATTRIBUTE = 357,
     __ATTRIBUTE__ = 358,
     __BUILTIN_OFFSETOF = 359,
     __BUILTIN_TYPES_COMPATIBLE_P = 360,
     __BUILTIN_VA_ARG = 361,
     __BUILTIN_VA_LIST = 362,
     __COMPLEX__ = 363,
     __CONST = 364,
     __CONST__ = 365,
     __EXTENSION__ = 366,
     INLINE = 367,
     __INLINE = 368,
     __INLINE__ = 369,
     __LABEL__ = 370,
     __RESTRICT = 371,
     __RESTRICT__ = 372,
     __SIGNED = 373,
     __SIGNED__ = 374,
     __THREAD = 375,
     TYPEOF = 376,
     __TYPEOF = 377,
     __TYPEOF__ = 378,
     __VOLATILE = 379,
     __VOLATILE__ = 380,
     PPNUM = 381,
     BACKSLASH = 382
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 240 "c.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   5144

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  128
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  188
/* YYNRULES -- Number of rules.  */
#define YYNRULES  574
/* YYNRULES -- Number of states.  */
#define YYNSTATES  952

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   382

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     6,     9,    11,    13,    15,    17,
      19,    21,    24,    31,    39,    42,    45,    49,    53,    57,
      61,    64,    68,    72,    76,    80,    83,    87,    91,    95,
      99,   107,   116,   120,   124,   128,   132,   136,   140,   144,
     148,   152,   156,   160,   164,   166,   169,   173,   177,   181,
     185,   192,   199,   208,   215,   222,   231,   233,   235,   237,
     239,   241,   243,   245,   247,   249,   251,   253,   256,   259,
     261,   264,   266,   268,   270,   272,   274,   276,   278,   280,
     282,   284,   286,   288,   290,   292,   294,   296,   298,   300,
     302,   305,   308,   311,   314,   316,   319,   322,   325,   328,
     331,   334,   336,   339,   342,   345,   348,   351,   353,   356,
     359,   362,   365,   368,   371,   373,   376,   379,   382,   387,
     392,   394,   396,   398,   401,   404,   407,   410,   412,   415,
     418,   421,   423,   425,   427,   429,   431,   433,   435,   437,
     439,   441,   443,   445,   447,   449,   451,   453,   455,   457,
     459,   461,   463,   465,   467,   469,   476,   484,   487,   495,
     504,   508,   510,   512,   513,   516,   519,   522,   525,   528,
     530,   534,   539,   543,   548,   551,   553,   556,   558,   559,
     561,   564,   569,   575,   578,   584,   591,   597,   604,   608,
     615,   623,   625,   629,   633,   637,   638,   641,   643,   647,
     649,   653,   655,   658,   663,   668,   670,   673,   678,   680,
     683,   688,   693,   695,   698,   703,   705,   709,   712,   714,
     716,   718,   721,   723,   726,   727,   730,   732,   735,   739,
     744,   746,   748,   751,   752,   756,   759,   761,   763,   765,
     768,   772,   778,   781,   784,   788,   794,   797,   799,   801,
     803,   805,   807,   809,   812,   814,   816,   819,   823,   827,
     832,   834,   839,   845,   848,   852,   856,   861,   866,   868,
     872,   874,   876,   878,   880,   883,   887,   889,   893,   896,
     901,   903,   907,   909,   911,   914,   918,   925,   929,   934,
     936,   938,   940,   942,   948,   949,   951,   954,   958,   963,
     965,   968,   971,   975,   979,   983,   987,   992,   994,   996,
     998,  1000,  1002,  1004,  1006,  1011,  1016,  1023,  1027,  1032,
    1033,  1035,  1037,  1040,  1044,  1046,  1050,  1051,  1054,  1056,
    1058,  1060,  1062,  1065,  1068,  1074,  1082,  1088,  1094,  1102,
    1112,  1114,  1116,  1118,  1120,  1124,  1129,  1132,  1135,  1139,
    1141,  1143,  1145,  1147,  1149,  1151,  1154,  1156,  1158,  1160,
    1164,  1166,  1168,  1170,  1177,  1183,  1185,  1187,  1189,  1191,
    1193,  1195,  1197,  1199,  1204,  1208,  1213,  1217,  1221,  1224,
    1227,  1234,  1236,  1240,  1242,  1245,  1248,  1251,  1254,  1259,
    1261,  1263,  1265,  1267,  1269,  1276,  1283,  1286,  1291,  1294,
    1296,  1298,  1301,  1303,  1305,  1307,  1309,  1311,  1313,  1315,
    1320,  1322,  1326,  1330,  1334,  1336,  1340,  1344,  1346,  1350,
    1354,  1356,  1360,  1364,  1368,  1372,  1374,  1378,  1382,  1384,
    1388,  1390,  1394,  1396,  1400,  1402,  1406,  1408,  1412,  1414,
    1420,  1425,  1427,  1431,  1433,  1435,  1437,  1439,  1441,  1443,
    1445,  1447,  1449,  1451,  1453,  1454,  1456,  1458,  1462,  1464,
    1465,  1467,  1469,  1472,  1479,  1481,  1483,  1484,  1486,  1489,
    1494,  1495,  1498,  1502,  1504,  1506,  1508,  1510,  1512,  1514,
    1516,  1518,  1520,  1522,  1524,  1526,  1528,  1530,  1532,  1534,
    1536,  1538,  1540,  1542,  1544,  1546,  1548,  1550,  1552,  1554,
    1556,  1558,  1560,  1562,  1564,  1566,  1568,  1570,  1572,  1574,
    1576,  1578,  1580,  1582,  1584,  1586,  1588,  1590,  1592,  1594,
    1596,  1598,  1600,  1602,  1604,  1606,  1608,  1610,  1612,  1614,
    1616,  1618,  1620,  1622,  1624,  1626,  1628,  1630,  1632,  1634,
    1637,  1642,  1643,  1645,  1651,  1658,  1665,  1673,  1679,  1683,
    1685,  1686,  1688,  1690,  1694,  1699,  1707,  1708,  1710,  1712,
    1716,  1726,  1728,  1732,  1734,  1736,  1738,  1739,  1740,  1741,
    1742,  1743,  1744,  1745,  1746
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     129,     0,    -1,   130,    -1,    -1,   130,   131,    -1,   133,
      -1,   141,    -1,   294,    -1,   132,    -1,    89,    -1,   134,
      -1,   111,   134,    -1,   136,   314,    70,   135,   312,    71,
      -1,   137,   314,   237,    70,   135,   312,    71,    -1,   231,
     235,    -1,   213,   309,    -1,   145,   213,   307,    -1,   146,
     213,   307,    -1,   147,   213,   307,    -1,   148,   213,   307,
      -1,   220,   309,    -1,   145,   220,   307,    -1,   146,   220,
     307,    -1,   147,   220,   307,    -1,   148,   220,   307,    -1,
     220,   309,    -1,   145,   220,   307,    -1,   146,   220,   307,
      -1,   147,   220,   307,    -1,   148,   220,   307,    -1,   139,
     314,    70,   231,   235,   312,    71,    -1,   140,   314,   237,
      70,   231,   235,   312,    71,    -1,   145,   213,   307,    -1,
     146,   213,   307,    -1,   147,   213,   307,    -1,   148,   213,
     307,    -1,   145,   220,   307,    -1,   146,   220,   307,    -1,
     147,   220,   307,    -1,   148,   220,   307,    -1,   145,   220,
     307,    -1,   146,   220,   307,    -1,   147,   220,   307,    -1,
     148,   220,   307,    -1,   142,    -1,   111,   142,    -1,   157,
     315,    89,    -1,   158,   315,    89,    -1,   144,   315,    89,
      -1,   143,   315,    89,    -1,   147,   213,   307,   296,   286,
     194,    -1,   148,   213,   307,   296,   286,   194,    -1,   143,
      67,   286,   213,   308,   296,   286,   194,    -1,   145,   204,
     307,   296,   286,   194,    -1,   146,   204,   307,   296,   286,
     194,    -1,   144,    67,   286,   204,   308,   296,   286,   194,
      -1,   155,    -1,   157,    -1,   159,    -1,   165,    -1,   161,
      -1,   156,    -1,   158,    -1,   160,    -1,   166,    -1,   162,
      -1,   168,    -1,   148,   168,    -1,   147,   149,    -1,   150,
      -1,   148,   150,    -1,   150,    -1,   168,    -1,   151,    -1,
     152,    -1,   153,    -1,   288,    -1,   154,    -1,    19,    -1,
     109,    -1,   110,    -1,    30,    -1,   124,    -1,   125,    -1,
      94,    -1,   116,    -1,   117,    -1,   112,    -1,   113,    -1,
     114,    -1,   156,   168,    -1,   147,   169,    -1,   155,   149,
      -1,   155,   169,    -1,   169,    -1,   148,   169,    -1,   156,
     150,    -1,   156,   169,    -1,   158,   168,    -1,   147,   172,
      -1,   157,   149,    -1,   172,    -1,   148,   172,    -1,   158,
     150,    -1,   160,   168,    -1,   147,    42,    -1,   159,   149,
      -1,    42,    -1,   148,    42,    -1,   160,   150,    -1,   162,
     168,    -1,   147,   163,    -1,   161,   149,    -1,   161,   163,
      -1,   163,    -1,   148,   163,    -1,   162,   150,    -1,   162,
     163,    -1,   164,    65,   193,    66,    -1,   164,    65,   284,
      66,    -1,   121,    -1,   122,    -1,   123,    -1,   166,   168,
      -1,   147,   167,    -1,   165,   149,    -1,   165,   167,    -1,
     167,    -1,   148,   167,    -1,   166,   150,    -1,   166,   167,
      -1,   107,    -1,    14,    -1,    16,    -1,    33,    -1,     3,
      -1,    13,    -1,    26,    -1,    15,    -1,    21,    -1,     5,
      -1,     9,    -1,    20,    -1,     4,    -1,   170,    -1,    22,
      -1,    92,    -1,   171,    -1,    25,    -1,   118,    -1,   119,
      -1,    93,    -1,   108,    -1,   173,    -1,   183,    -1,   174,
     311,    70,   175,   312,    71,    -1,   174,   192,   311,    70,
     175,   312,    71,    -1,   174,   192,    -1,   174,   287,   311,
      70,   175,   312,    71,    -1,   174,   287,   192,   311,    70,
     175,   312,    71,    -1,   174,   287,   192,    -1,     6,    -1,
      18,    -1,    -1,   175,   176,    -1,   178,    89,    -1,   177,
      89,    -1,   148,    89,    -1,   146,    89,    -1,    89,    -1,
     148,   180,   286,    -1,   177,    67,   180,   286,    -1,   146,
     179,   286,    -1,   178,    67,   179,   286,    -1,   204,   181,
      -1,   182,    -1,   213,   181,    -1,   182,    -1,    -1,   182,
      -1,    88,   285,    -1,    12,    70,   184,    71,    -1,    12,
     192,    70,   184,    71,    -1,    12,   192,    -1,    12,    70,
     184,    67,    71,    -1,    12,   192,    70,   184,    67,    71,
      -1,    12,   287,    70,   184,    71,    -1,    12,   287,   192,
      70,   184,    71,    -1,    12,   287,   192,    -1,    12,   287,
      70,   184,    67,    71,    -1,    12,   287,   192,    70,   184,
      67,    71,    -1,   185,    -1,   184,    67,   185,    -1,    35,
     310,   186,    -1,    42,   310,   186,    -1,    -1,    90,   285,
      -1,   188,    -1,   188,    67,    54,    -1,   189,    -1,   188,
      67,   189,    -1,   145,    -1,   145,   222,    -1,   145,   213,
     307,   286,    -1,   145,   207,   307,   286,    -1,   147,    -1,
     147,   222,    -1,   147,   213,   307,   286,    -1,   146,    -1,
     146,   222,    -1,   146,   213,   307,   286,    -1,   146,   207,
     307,   286,    -1,   148,    -1,   148,   222,    -1,   148,   213,
     307,   286,    -1,   191,    -1,   190,    67,   191,    -1,    35,
     309,    -1,    35,    -1,    42,    -1,   146,    -1,   146,   222,
      -1,   148,    -1,   148,   222,    -1,    -1,    90,   195,    -1,
     196,    -1,   199,   196,    -1,    70,   198,    71,    -1,    70,
     198,   195,    71,    -1,   281,    -1,   198,    -1,   198,   195,
      -1,    -1,   198,   195,    67,    -1,   200,    90,    -1,   202,
      -1,   203,    -1,   201,    -1,   200,   201,    -1,    72,   285,
      73,    -1,    72,   285,    54,   285,    73,    -1,    74,    35,
      -1,    74,    42,    -1,    72,   285,    73,    -1,    72,   285,
      54,   285,    73,    -1,    35,    88,    -1,   205,    -1,   213,
      -1,   206,    -1,   210,    -1,   207,    -1,    42,    -1,    42,
     223,    -1,   208,    -1,   209,    -1,    76,   207,    -1,    76,
     148,   207,    -1,    65,   208,    66,    -1,    65,   208,    66,
     223,    -1,   211,    -1,    76,    65,   212,    66,    -1,    76,
     148,    65,   212,    66,    -1,    76,   210,    -1,    76,   148,
     210,    -1,    65,   210,    66,    -1,    65,   212,   223,    66,
      -1,    65,   210,    66,   223,    -1,    42,    -1,    65,   212,
      66,    -1,   214,    -1,   215,    -1,   218,    -1,   216,    -1,
      76,   213,    -1,    76,   148,   213,    -1,   217,    -1,    65,
     215,    66,    -1,   218,   223,    -1,    65,   215,    66,   223,
      -1,   219,    -1,    65,   218,    66,    -1,    35,    -1,   221,
      -1,    76,   220,    -1,    76,   148,   220,    -1,   218,    65,
     311,   190,   313,    66,    -1,    65,   220,    66,    -1,    65,
     220,    66,   223,    -1,   226,    -1,   227,    -1,   223,    -1,
     225,    -1,    65,   311,   224,   313,    66,    -1,    -1,   187,
      -1,    72,    73,    -1,    72,   285,    73,    -1,   225,    72,
     285,    73,    -1,    76,    -1,    76,   148,    -1,    76,   222,
      -1,    76,   148,   222,    -1,    65,   226,    66,    -1,    65,
     227,    66,    -1,    65,   223,    66,    -1,    65,   226,    66,
     223,    -1,   229,    -1,   230,    -1,   238,    -1,   239,    -1,
     240,    -1,   241,    -1,   297,    -1,   192,    88,   286,   228,
      -1,    11,   285,    88,   228,    -1,    11,   285,    54,   285,
      88,   228,    -1,    27,    88,   228,    -1,    70,   231,   235,
      71,    -1,    -1,   232,    -1,   233,    -1,   232,   233,    -1,
     115,   234,    89,    -1,    35,    -1,   234,    67,    35,    -1,
      -1,   235,   236,    -1,   141,    -1,   228,    -1,   138,    -1,
     141,    -1,   237,   141,    -1,   283,    89,    -1,    32,    65,
     284,    66,   228,    -1,    32,    65,   284,    66,   228,     8,
     228,    -1,    10,    65,   284,    66,   228,    -1,    34,    65,
     284,    66,   228,    -1,    31,   228,    34,    65,   284,    66,
      89,    -1,    24,    65,   283,    89,   283,    89,   283,    66,
     228,    -1,   242,    -1,   243,    -1,   244,    -1,   245,    -1,
      28,   192,    89,    -1,    28,    76,   284,    89,    -1,    23,
      89,    -1,     7,    89,    -1,    17,   283,    89,    -1,    37,
      -1,    38,    -1,    40,    -1,    41,    -1,    39,    -1,    36,
      -1,   247,    36,    -1,   249,    -1,   246,    -1,   247,    -1,
      65,   284,    66,    -1,   251,    -1,   250,    -1,    35,    -1,
     106,    65,   281,    67,   193,    66,    -1,    65,   311,   230,
     312,    66,    -1,   248,    -1,   253,    -1,   254,    -1,   255,
      -1,   256,    -1,   257,    -1,   258,    -1,   259,    -1,   252,
      72,   284,    73,    -1,   252,    65,    66,    -1,   252,    65,
     260,    66,    -1,   252,    74,   192,    -1,   252,    43,   192,
      -1,   252,    44,    -1,   252,    45,    -1,    65,   193,    66,
      70,   197,    71,    -1,   281,    -1,   260,    67,   281,    -1,
     252,    -1,    44,   261,    -1,    45,   261,    -1,   268,   269,
      -1,    29,   261,    -1,    29,    65,   193,    66,    -1,   267,
      -1,   265,    -1,   264,    -1,   263,    -1,   262,    -1,   105,
      65,   193,    67,   193,    66,    -1,   104,    65,   193,    67,
     252,    66,    -1,   111,   269,    -1,   266,    65,   193,    66,
      -1,   266,   261,    -1,    96,    -1,    95,    -1,    52,    35,
      -1,    75,    -1,    76,    -1,    77,    -1,    78,    -1,    79,
      -1,    80,    -1,   261,    -1,    65,   193,    66,   269,    -1,
     269,    -1,   270,    76,   269,    -1,   270,    81,   269,    -1,
     270,    82,   269,    -1,   270,    -1,   271,    77,   270,    -1,
     271,    78,   270,    -1,   271,    -1,   272,    46,   271,    -1,
     272,    47,   271,    -1,   272,    -1,   273,    83,   272,    -1,
     273,    84,   272,    -1,   273,    48,   272,    -1,   273,    49,
     272,    -1,   273,    -1,   274,    50,   273,    -1,   274,    51,
     273,    -1,   274,    -1,   275,    75,   274,    -1,   275,    -1,
     276,    85,   275,    -1,   276,    -1,   277,    86,   276,    -1,
     277,    -1,   278,    52,   277,    -1,   278,    -1,   279,    53,
     278,    -1,   279,    -1,   279,    87,   284,    88,   280,    -1,
     279,    87,    88,   280,    -1,   280,    -1,   261,   282,   281,
      -1,    90,    -1,    55,    -1,    56,    -1,    57,    -1,    58,
      -1,    59,    -1,    60,    -1,    61,    -1,    62,    -1,    63,
      -1,    64,    -1,    -1,   284,    -1,   281,    -1,   284,    67,
     281,    -1,   280,    -1,    -1,   287,    -1,   288,    -1,   287,
     288,    -1,   289,    65,    65,   290,    66,    66,    -1,   102,
      -1,   103,    -1,    -1,   291,    -1,   293,   292,    -1,   291,
      67,   293,   292,    -1,    -1,    65,    66,    -1,    65,   260,
      66,    -1,    35,    -1,     3,    -1,     4,    -1,     5,    -1,
       6,    -1,     7,    -1,     8,    -1,     9,    -1,    10,    -1,
      11,    -1,    12,    -1,    13,    -1,    14,    -1,    15,    -1,
      16,    -1,    17,    -1,    18,    -1,    19,    -1,    20,    -1,
      21,    -1,    22,    -1,    23,    -1,    24,    -1,    25,    -1,
      26,    -1,    27,    -1,    28,    -1,    29,    -1,    30,    -1,
      31,    -1,    32,    -1,    33,    -1,    34,    -1,    91,    -1,
      92,    -1,    93,    -1,    94,    -1,    95,    -1,    96,    -1,
      97,    -1,    98,    -1,    99,    -1,   102,    -1,   103,    -1,
     104,    -1,   105,    -1,   106,    -1,   107,    -1,   108,    -1,
     109,    -1,   110,    -1,   111,    -1,   112,    -1,   113,    -1,
     114,    -1,   115,    -1,   116,    -1,   117,    -1,   118,    -1,
     119,    -1,   120,    -1,   121,    -1,   122,    -1,   123,    -1,
     124,    -1,   125,    -1,   295,    89,    -1,   306,    65,   247,
      66,    -1,    -1,   295,    -1,   306,    65,   298,    66,    89,
      -1,   306,    28,    65,   304,    66,    89,    -1,   306,   150,
      65,   298,    66,    89,    -1,   247,    88,   299,    88,   299,
      88,   303,    -1,   247,    88,   299,    88,   299,    -1,   247,
      88,   299,    -1,   247,    -1,    -1,   300,    -1,   301,    -1,
     300,    67,   301,    -1,   247,    65,   284,    66,    -1,    72,
     293,    73,   247,    65,   284,    66,    -1,    -1,   303,    -1,
     247,    -1,   303,    67,   247,    -1,   247,    88,   299,    88,
     299,    88,   302,    88,   305,    -1,   191,    -1,   305,    67,
     191,    -1,    97,    -1,    98,    -1,    99,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   168,   168,   173,   175,   179,   180,   181,   182,   186,
     190,   191,   195,   196,   202,   210,   211,   212,   213,   214,
     216,   217,   218,   219,   220,   224,   225,   226,   227,   228,
     235,   236,   240,   241,   242,   243,   245,   246,   247,   248,
     252,   253,   254,   255,   291,   292,   296,   297,   298,   299,
     306,   307,   308,   312,   313,   314,   318,   319,   320,   321,
     322,   326,   327,   328,   329,   330,   334,   335,   336,   340,
     341,   345,   346,   350,   351,   352,   353,   354,   358,   359,
     360,   364,   365,   366,   370,   371,   372,   376,   377,   378,
     382,   383,   384,   385,   389,   390,   391,   392,   396,   397,
     398,   402,   403,   404,   409,   410,   411,   415,   416,   417,
     421,   422,   423,   424,   428,   429,   430,   431,   435,   436,
     440,   441,   442,   446,   447,   448,   449,   453,   454,   455,
     456,   460,   464,   465,   466,   467,   468,   472,   473,   474,
     475,   476,   477,   478,   479,   480,   481,   482,   486,   487,
     488,   492,   493,   497,   498,   502,   503,   505,   506,   507,
     509,   513,   514,   517,   519,   523,   524,   525,   526,   527,
     531,   532,   536,   537,   542,   543,   547,   548,   551,   553,
     557,   561,   562,   563,   564,   565,   566,   567,   568,   569,
     570,   579,   580,   584,   585,   588,   590,   594,   595,   599,
     600,   604,   605,   606,   607,   608,   609,   610,   611,   612,
     613,   614,   615,   616,   617,   625,   626,   630,   634,   635,
     639,   640,   641,   642,   645,   647,   651,   652,   661,   662,
     663,   667,   668,   671,   672,   676,   677,   678,   682,   683,
     687,   688,   689,   690,   694,   695,   699,   703,   704,   708,
     712,   713,   717,   718,   719,   726,   727,   728,   732,   733,
     740,   741,   742,   744,   745,   749,   750,   751,   755,   756,
     760,   764,   765,   769,   770,   771,   775,   776,   780,   781,
     785,   786,   790,   794,   795,   796,   800,   801,   802,   806,
     807,   808,   812,   813,   816,   818,   822,   823,   824,   828,
     829,   830,   831,   835,   836,   837,   838,   844,   845,   846,
     847,   848,   849,   850,   854,   855,   856,   857,   868,   871,
     873,   877,   878,   882,   886,   887,   890,   891,   895,   896,
     897,   901,   902,   911,   915,   916,   917,   921,   922,   923,
     928,   929,   930,   931,   935,   936,   940,   944,   948,   955,
     956,   960,   961,   962,   967,   968,   974,   975,   976,   977,
     978,   979,   983,   987,   991,   995,   996,   997,   998,   999,
    1000,  1001,  1002,  1006,  1010,  1011,  1015,  1019,  1023,  1027,
    1035,  1039,  1040,  1044,  1045,  1046,  1047,  1048,  1049,  1050,
    1051,  1052,  1053,  1054,  1058,  1062,  1066,  1070,  1071,  1075,
    1076,  1080,  1084,  1085,  1086,  1087,  1088,  1089,  1093,  1094,
    1098,  1099,  1100,  1101,  1105,  1106,  1107,  1111,  1112,  1113,
    1117,  1118,  1119,  1120,  1121,  1125,  1126,  1127,  1131,  1132,
    1136,  1137,  1141,  1142,  1146,  1147,  1151,  1152,  1156,  1157,
    1159,  1164,  1165,  1169,  1170,  1171,  1172,  1173,  1174,  1175,
    1176,  1177,  1178,  1179,  1182,  1184,  1188,  1189,  1193,  1196,
    1198,  1202,  1203,  1207,  1211,  1212,  1215,  1217,  1221,  1222,
    1225,  1227,  1228,  1232,  1233,  1234,  1235,  1236,  1237,  1238,
    1239,  1240,  1241,  1242,  1243,  1244,  1245,  1246,  1247,  1248,
    1249,  1250,  1251,  1252,  1253,  1254,  1255,  1256,  1257,  1258,
    1259,  1260,  1261,  1262,  1263,  1264,  1265,  1266,  1267,  1268,
    1269,  1270,  1271,  1272,  1273,  1274,  1275,  1276,  1277,  1278,
    1279,  1280,  1281,  1282,  1283,  1284,  1285,  1286,  1287,  1288,
    1289,  1290,  1291,  1292,  1293,  1294,  1295,  1296,  1297,  1303,
    1307,  1310,  1312,  1316,  1318,  1319,  1323,  1324,  1325,  1326,
    1329,  1331,  1335,  1336,  1340,  1341,  1344,  1346,  1350,  1351,
    1355,  1359,  1360,  1364,  1365,  1366,  1375,  1378,  1381,  1384,
    1387,  1390,  1393,  1396,  1399
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "AUTO", "DOUBLE", "INT", "STRUCT",
  "BREAK", "ELSE", "LONG", "SWITCH", "CASE", "ENUM", "REGISTER", "TYPEDEF",
  "CHAR", "EXTERN", "RETURN", "UNION", "CONST", "FLOAT", "SHORT",
  "UNSIGNED", "CONTINUE", "FOR", "SIGNED", "VOID", "DEFAULT", "GOTO",
  "SIZEOF", "VOLATILE", "DO", "IF", "STATIC", "WHILE", "IDENTIFIER",
  "STRINGliteral", "FLOATINGconstant", "INTEGERconstant",
  "CHARACTERconstant", "OCTALconstant", "HEXconstant", "TYPEDEFname",
  "ARROW", "ICR", "DECR", "LS", "RS", "LE", "GE", "EQ", "NE", "ANDAND",
  "OROR", "ELLIPSIS", "MULTassign", "DIVassign", "MODassign", "PLUSassign",
  "MINUSassign", "LSassign", "RSassign", "ANDassign", "ERassign",
  "ORassign", "LPAREN", "RPAREN", "COMMA", "HASH", "DHASH", "LBRACE",
  "RBRACE", "LBRACK", "RBRACK", "DOT", "AND", "STAR", "PLUS", "MINUS",
  "NEGATE", "NOT", "DIV", "MOD", "LT", "GT", "XOR", "PIPE", "QUESTION",
  "COLON", "SEMICOLON", "ASSIGN", "ASMSYM", "_BOOL", "_COMPLEX",
  "RESTRICT", "__ALIGNOF", "__ALIGNOF__", "ASM", "__ASM", "__ASM__", "AT",
  "USD", "__ATTRIBUTE", "__ATTRIBUTE__", "__BUILTIN_OFFSETOF",
  "__BUILTIN_TYPES_COMPATIBLE_P", "__BUILTIN_VA_ARG", "__BUILTIN_VA_LIST",
  "__COMPLEX__", "__CONST", "__CONST__", "__EXTENSION__", "INLINE",
  "__INLINE", "__INLINE__", "__LABEL__", "__RESTRICT", "__RESTRICT__",
  "__SIGNED", "__SIGNED__", "__THREAD", "TYPEOF", "__TYPEOF", "__TYPEOF__",
  "__VOLATILE", "__VOLATILE__", "PPNUM", "BACKSLASH", "$accept",
  "TranslationUnit", "ExternalDeclarationList", "ExternalDeclaration",
  "EmptyDefinition", "FunctionDefinitionExtension", "FunctionDefinition",
  "FunctionCompoundStatement", "FunctionPrototype", "FunctionOldPrototype",
  "NestedFunctionDefinition", "NestedFunctionPrototype",
  "NestedFunctionOldPrototype", "DeclarationExtension", "Declaration",
  "DefaultDeclaringList", "DeclaringList", "DeclarationSpecifier",
  "TypeSpecifier", "DeclarationQualifierList", "TypeQualifierList",
  "DeclarationQualifier", "TypeQualifier", "ConstQualifier",
  "VolatileQualifier", "RestrictQualifier", "FunctionSpecifier",
  "BasicDeclarationSpecifier", "BasicTypeSpecifier",
  "SUEDeclarationSpecifier", "SUETypeSpecifier",
  "TypedefDeclarationSpecifier", "TypedefTypeSpecifier",
  "TypeofDeclarationSpecifier", "TypeofTypeSpecifier", "Typeofspecifier",
  "Typeofkeyword", "VarArgDeclarationSpecifier", "VarArgTypeSpecifier",
  "VarArgTypeName", "StorageClass", "BasicTypeName", "SignedKeyword",
  "ComplexKeyword", "ElaboratedTypeName", "StructOrUnionSpecifier",
  "StructOrUnion", "StructDeclarationList", "StructDeclaration",
  "StructDefaultDeclaringList", "StructDeclaringList", "StructDeclarator",
  "StructIdentifierDeclarator", "BitFieldSizeOpt", "BitFieldSize",
  "EnumSpecifier", "EnumeratorList", "Enumerator", "EnumeratorValueOpt",
  "ParameterTypeList", "ParameterList", "ParameterDeclaration",
  "IdentifierList", "Identifier", "IdentifierOrTypedefName", "TypeName",
  "InitializerOpt", "DesignatedInitializer", "Initializer",
  "InitializerList", "MatchedInitializerList", "Designation",
  "DesignatorList", "Designator", "ObsoleteArrayDesignation",
  "ObsoleteFieldDesignation", "Declarator", "TypedefDeclarator",
  "TypedefDeclaratorMain", "ParameterTypedefDeclarator",
  "CleanTypedefDeclarator", "CleanPostfixTypedefDeclarator",
  "ParenTypedefDeclarator", "ParenPostfixTypedefDeclarator",
  "SimpleParenTypedefDeclarator", "IdentifierDeclarator",
  "IdentifierDeclaratorMain", "UnaryIdentifierDeclarator",
  "PostfixIdentifierDeclarator", "FunctionDeclarator",
  "ParenIdentifierDeclarator", "SimpleDeclarator", "OldFunctionDeclarator",
  "PostfixOldFunctionDeclarator", "AbstractDeclarator",
  "PostfixingAbstractDeclarator", "ParameterTypeListOpt",
  "ArrayAbstractDeclarator", "UnaryAbstractDeclarator",
  "PostfixAbstractDeclarator", "Statement", "LabeledStatement",
  "CompoundStatement", "LocalLabelDeclarationListOpt",
  "LocalLabelDeclarationList", "LocalLabelDeclaration", "LocalLabelList",
  "DeclarationOrStatementList", "DeclarationOrStatement",
  "DeclarationList", "ExpressionStatement", "SelectionStatement",
  "IterationStatement", "JumpStatement", "GotoStatement",
  "ContinueStatement", "BreakStatement", "ReturnStatement", "Constant",
  "StringLiteralList", "PrimaryExpression", "PrimaryIdentifier",
  "VariableArgumentAccess", "StatementAsExpression", "PostfixExpression",
  "Subscript", "FunctionCall", "DirectSelection", "IndirectSelection",
  "Increment", "Decrement", "CompoundLiteral", "ExpressionList",
  "UnaryExpression", "TypeCompatibilityExpression", "OffsetofExpression",
  "ExtensionExpression", "AlignofExpression", "Alignofkeyword",
  "LabelAddressExpression", "Unaryoperator", "CastExpression",
  "MultiplicativeExpression", "AdditiveExpression", "ShiftExpression",
  "RelationalExpression", "EqualityExpression", "AndExpression",
  "ExclusiveOrExpression", "InclusiveOrExpression", "LogicalAndExpression",
  "LogicalORExpression", "ConditionalExpression", "AssignmentExpression",
  "AssignmentOperator", "ExpressionOpt", "Expression",
  "ConstantExpression", "AttributeSpecifierListOpt",
  "AttributeSpecifierList", "AttributeSpecifier", "AttributeKeyword",
  "AttributeListOpt", "AttributeList", "AttributeExpressionOpt", "Word",
  "AssemblyDefinition", "AssemblyExpression", "AssemblyExpressionOpt",
  "AssemblyStatement", "Assemblyargument", "AssemblyoperandsOpt",
  "Assemblyoperands", "Assemblyoperand", "AssemblyclobbersOpt",
  "Assemblyclobbers", "AssemblyGotoargument", "AssemblyJumpLabels",
  "AsmKeyword", "BindIdentifier", "BindIdentifierInList", "BindVar",
  "BindEnum", "EnterScope", "ExitScope", "ExitReentrantScope",
  "ReenterScope", "KillReentrantScope", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,   378,   379,   380,   381,   382
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   128,   129,   130,   130,   131,   131,   131,   131,   132,
     133,   133,   134,   134,   135,   136,   136,   136,   136,   136,
     136,   136,   136,   136,   136,   137,   137,   137,   137,   137,
     138,   138,   139,   139,   139,   139,   139,   139,   139,   139,
     140,   140,   140,   140,   141,   141,   142,   142,   142,   142,
     143,   143,   143,   144,   144,   144,   145,   145,   145,   145,
     145,   146,   146,   146,   146,   146,   147,   147,   147,   148,
     148,   149,   149,   150,   150,   150,   150,   150,   151,   151,
     151,   152,   152,   152,   153,   153,   153,   154,   154,   154,
     155,   155,   155,   155,   156,   156,   156,   156,   157,   157,
     157,   158,   158,   158,   159,   159,   159,   160,   160,   160,
     161,   161,   161,   161,   162,   162,   162,   162,   163,   163,
     164,   164,   164,   165,   165,   165,   165,   166,   166,   166,
     166,   167,   168,   168,   168,   168,   168,   169,   169,   169,
     169,   169,   169,   169,   169,   169,   169,   169,   170,   170,
     170,   171,   171,   172,   172,   173,   173,   173,   173,   173,
     173,   174,   174,   175,   175,   176,   176,   176,   176,   176,
     177,   177,   178,   178,   179,   179,   180,   180,   181,   181,
     182,   183,   183,   183,   183,   183,   183,   183,   183,   183,
     183,   184,   184,   185,   185,   186,   186,   187,   187,   188,
     188,   189,   189,   189,   189,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   189,   190,   190,   191,   192,   192,
     193,   193,   193,   193,   194,   194,   195,   195,   196,   196,
     196,   197,   197,   198,   198,   199,   199,   199,   200,   200,
     201,   201,   201,   201,   202,   202,   203,   204,   204,   205,
     206,   206,   207,   207,   207,   208,   208,   208,   209,   209,
     210,   210,   210,   210,   210,   211,   211,   211,   212,   212,
     213,   214,   214,   215,   215,   215,   216,   216,   217,   217,
     218,   218,   219,   220,   220,   220,   221,   221,   221,   222,
     222,   222,   223,   223,   224,   224,   225,   225,   225,   226,
     226,   226,   226,   227,   227,   227,   227,   228,   228,   228,
     228,   228,   228,   228,   229,   229,   229,   229,   230,   231,
     231,   232,   232,   233,   234,   234,   235,   235,   236,   236,
     236,   237,   237,   238,   239,   239,   239,   240,   240,   240,
     241,   241,   241,   241,   242,   242,   243,   244,   245,   246,
     246,   246,   246,   246,   247,   247,   248,   248,   248,   248,
     248,   248,   249,   250,   251,   252,   252,   252,   252,   252,
     252,   252,   252,   253,   254,   254,   255,   256,   257,   258,
     259,   260,   260,   261,   261,   261,   261,   261,   261,   261,
     261,   261,   261,   261,   262,   263,   264,   265,   265,   266,
     266,   267,   268,   268,   268,   268,   268,   268,   269,   269,
     270,   270,   270,   270,   271,   271,   271,   272,   272,   272,
     273,   273,   273,   273,   273,   274,   274,   274,   275,   275,
     276,   276,   277,   277,   278,   278,   279,   279,   280,   280,
     280,   281,   281,   282,   282,   282,   282,   282,   282,   282,
     282,   282,   282,   282,   283,   283,   284,   284,   285,   286,
     286,   287,   287,   288,   289,   289,   290,   290,   291,   291,
     292,   292,   292,   293,   293,   293,   293,   293,   293,   293,
     293,   293,   293,   293,   293,   293,   293,   293,   293,   293,
     293,   293,   293,   293,   293,   293,   293,   293,   293,   293,
     293,   293,   293,   293,   293,   293,   293,   293,   293,   293,
     293,   293,   293,   293,   293,   293,   293,   293,   293,   293,
     293,   293,   293,   293,   293,   293,   293,   293,   293,   293,
     293,   293,   293,   293,   293,   293,   293,   293,   293,   294,
     295,   296,   296,   297,   297,   297,   298,   298,   298,   298,
     299,   299,   300,   300,   301,   301,   302,   302,   303,   303,
     304,   305,   305,   306,   306,   306,   307,   308,   309,   310,
     311,   312,   313,   314,   315
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     0,     2,     1,     1,     1,     1,     1,
       1,     2,     6,     7,     2,     2,     3,     3,     3,     3,
       2,     3,     3,     3,     3,     2,     3,     3,     3,     3,
       7,     8,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     2,     3,     3,     3,     3,
       6,     6,     8,     6,     6,     8,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     2,     1,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       2,     2,     2,     2,     1,     2,     2,     2,     2,     2,
       2,     1,     2,     2,     2,     2,     2,     1,     2,     2,
       2,     2,     2,     2,     1,     2,     2,     2,     4,     4,
       1,     1,     1,     2,     2,     2,     2,     1,     2,     2,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     6,     7,     2,     7,     8,
       3,     1,     1,     0,     2,     2,     2,     2,     2,     1,
       3,     4,     3,     4,     2,     1,     2,     1,     0,     1,
       2,     4,     5,     2,     5,     6,     5,     6,     3,     6,
       7,     1,     3,     3,     3,     0,     2,     1,     3,     1,
       3,     1,     2,     4,     4,     1,     2,     4,     1,     2,
       4,     4,     1,     2,     4,     1,     3,     2,     1,     1,
       1,     2,     1,     2,     0,     2,     1,     2,     3,     4,
       1,     1,     2,     0,     3,     2,     1,     1,     1,     2,
       3,     5,     2,     2,     3,     5,     2,     1,     1,     1,
       1,     1,     1,     2,     1,     1,     2,     3,     3,     4,
       1,     4,     5,     2,     3,     3,     4,     4,     1,     3,
       1,     1,     1,     1,     2,     3,     1,     3,     2,     4,
       1,     3,     1,     1,     2,     3,     6,     3,     4,     1,
       1,     1,     1,     5,     0,     1,     2,     3,     4,     1,
       2,     2,     3,     3,     3,     3,     4,     1,     1,     1,
       1,     1,     1,     1,     4,     4,     6,     3,     4,     0,
       1,     1,     2,     3,     1,     3,     0,     2,     1,     1,
       1,     1,     2,     2,     5,     7,     5,     5,     7,     9,
       1,     1,     1,     1,     3,     4,     2,     2,     3,     1,
       1,     1,     1,     1,     1,     2,     1,     1,     1,     3,
       1,     1,     1,     6,     5,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     3,     4,     3,     3,     2,     2,
       6,     1,     3,     1,     2,     2,     2,     2,     4,     1,
       1,     1,     1,     1,     6,     6,     2,     4,     2,     1,
       1,     2,     1,     1,     1,     1,     1,     1,     1,     4,
       1,     3,     3,     3,     1,     3,     3,     1,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     1,     3,
       1,     3,     1,     3,     1,     3,     1,     3,     1,     5,
       4,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     1,     1,     3,     1,     0,
       1,     1,     2,     6,     1,     1,     0,     1,     2,     4,
       0,     2,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       4,     0,     1,     5,     6,     6,     7,     5,     3,     1,
       0,     1,     1,     3,     4,     7,     0,     1,     1,     3,
       9,     1,     3,     1,     1,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     0,     2,     1,   135,   143,   140,   161,   141,     0,
     136,   132,   138,   133,   162,    78,   142,   139,   145,   148,
     137,    81,   134,   282,   107,     0,     0,     9,   146,   151,
      84,   563,   564,   565,   464,   465,   131,   152,    79,    80,
       0,    87,    88,    89,    85,    86,   149,   150,   120,   121,
     122,    82,    83,     4,     8,     5,    10,   573,   573,     6,
      44,   574,   574,     0,     0,     0,     0,    69,    73,    74,
      75,    77,    56,    61,    57,    62,    58,    63,    60,    65,
     114,     0,    59,    64,   127,    66,    94,   144,   147,   101,
     153,   570,   154,   568,   270,   271,   273,   276,   272,   280,
     568,   283,    76,     0,     7,     0,     0,   218,   219,     0,
     183,     0,   461,     0,     0,     0,     0,   274,   284,    11,
      45,     0,     0,   459,     0,   459,     0,   252,     0,     0,
     566,   247,   249,   251,   254,   255,   250,   260,   248,   566,
     566,   248,   566,   105,    68,    71,   111,   124,    72,    91,
      99,   566,   566,   108,    70,   115,   128,    67,    95,   102,
     566,   566,    92,    93,    96,    90,    97,   100,     0,   103,
      98,     0,   106,   109,   104,   112,   113,   116,   117,   110,
       0,   125,   126,   129,   130,   123,   157,   570,     0,    15,
     570,     0,   278,   292,    25,     0,   539,     0,   569,   569,
       0,   191,     0,     0,   188,   462,   277,   281,   287,   275,
     285,   319,     0,   331,     0,     0,     0,     0,     0,     0,
     460,    49,     0,    48,   570,   253,   268,     0,     0,     0,
       0,     0,     0,   256,   263,   541,    16,    26,   541,    17,
      27,   541,    28,   541,    29,    46,    47,     0,   362,   354,
     349,   350,   353,   351,   352,     0,     0,     0,   570,   402,
     403,   404,   405,   406,   407,   400,   399,     0,     0,     0,
       0,   220,   222,    61,    62,    63,    65,    64,     0,   357,
     358,   365,   356,   361,   360,   383,   366,   367,   368,   369,
     370,   371,   372,   408,   393,   392,   391,   390,     0,   389,
       0,   410,   414,   417,   420,   425,   428,   430,   432,   434,
     436,   438,   441,   456,     0,     0,   160,     0,   163,   294,
     296,   408,   458,     0,     0,   466,     0,   195,   195,     0,
     181,     0,     0,     0,   279,   288,     0,   571,   326,   320,
     321,     0,     0,   248,   272,     0,     0,   566,   566,   319,
     332,   567,   567,   294,     0,   258,   265,     0,     0,     0,
     257,   264,   542,   459,   459,   459,   459,   570,   387,   570,
     384,   385,   401,     0,     0,     0,     0,     0,     0,   396,
     570,   299,   221,   291,   289,   290,   223,   118,   355,     0,
     378,   379,     0,     0,     0,   444,   445,   446,   447,   448,
     449,   450,   451,   452,   453,   443,     0,   570,   398,   386,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   119,
       0,   163,     0,   163,   571,   568,   201,   208,   205,   212,
      57,    62,   295,   197,   199,   572,   215,   572,   297,     0,
     474,   475,   476,   477,   478,   479,   480,   481,   482,   483,
     484,   485,   486,   487,   488,   489,   490,   491,   492,   493,
     494,   495,   496,   497,   498,   499,   500,   501,   502,   503,
     504,   505,   473,   506,   507,   508,   509,   510,   511,   512,
     513,   514,   515,   516,   517,   518,   519,   520,   521,   522,
     523,   524,   525,   526,   527,   528,   529,   530,   531,   532,
     533,   534,   535,   536,   537,   538,     0,   467,   470,   540,
       0,   193,   194,   184,   192,     0,   182,     0,   186,     0,
     324,     0,     0,    14,   322,     0,     0,     0,     0,     0,
     541,   541,   571,   541,   541,   269,   259,   267,   266,   261,
       0,   224,   224,   224,   224,     0,     0,     0,   359,   319,
     571,     0,     0,     0,     0,     0,     0,   300,   301,   377,
     374,     0,   381,     0,   376,   442,     0,   411,   412,   413,
     415,   416,   418,   419,   423,   424,   421,   422,   426,   427,
     429,   431,   433,   435,   437,     0,     0,   457,   571,   163,
     571,   169,     0,     0,   164,     0,     0,     0,   217,   570,
     299,   566,   566,   202,   566,   566,   209,   570,   299,   566,
     206,   566,   213,     0,     0,     0,     0,   298,     0,     0,
       0,   468,   196,   185,   189,     0,   187,     0,   323,    12,
       0,     0,     0,   454,     0,     0,     0,     0,   454,     0,
       0,   362,   107,     0,   330,   573,   573,   328,     0,     0,
       0,     0,     0,   329,   307,   308,   327,   309,   310,   311,
     312,   340,   341,   342,   343,     0,   455,   313,     0,     0,
       0,   459,   459,   262,     0,    53,    54,    50,    51,   388,
       0,   233,   409,   326,     0,     0,     0,     0,   305,   303,
     304,   302,   375,     0,   373,   397,   440,     0,     0,   571,
       0,     0,   168,   459,   175,   178,   167,   459,   177,   178,
       0,   166,     0,   165,   155,   300,   459,   459,   459,   459,
     300,   459,   459,   198,   200,   216,   286,   293,   463,   470,
     471,     0,   190,   325,   347,     0,     0,     0,   346,   454,
     454,     0,     0,     0,     0,     0,     0,     0,   248,   566,
     248,   566,   566,   566,   566,   566,   459,   333,     0,     0,
       0,    13,   224,   224,   362,   233,     0,     0,   225,   226,
       0,     0,   238,   236,   237,   230,     0,   231,   454,   364,
       0,     0,     0,   306,   382,   439,   156,     0,   158,   180,
     172,   174,   179,   170,   176,   459,   459,   204,   203,   211,
     210,   207,   214,   469,   472,     0,     0,   454,   348,     0,
     317,     0,   344,     0,     0,     0,   319,     0,    32,    40,
      33,    41,   541,    42,   541,    43,   454,     0,   549,     0,
       0,    52,    55,   246,     0,     0,   242,   243,   227,     0,
     235,   239,   380,   232,   318,   395,   394,   363,   159,   171,
     173,   454,     0,   315,   454,   345,     0,   454,   454,   326,
     319,   314,     0,     0,   550,     0,     0,   228,     0,     0,
     244,     0,   234,   336,   454,     0,     0,   334,   337,   454,
     326,   550,     0,     0,     0,   548,   551,   552,   543,     0,
     229,     0,     0,   240,   316,   454,     0,   454,     0,   454,
       0,   544,     0,     0,   550,     0,   545,   245,     0,     0,
     338,   335,    30,     0,   550,     0,     0,   547,   553,   241,
     454,    31,     0,     0,   554,     0,   339,   556,     0,   558,
     546,     0,   557,     0,     0,     0,   555,   559,   561,   560,
       0,   562
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,    53,    54,    55,    56,   337,    57,    58,
     654,   655,   656,   657,    60,    61,    62,   214,   271,   216,
     272,   144,    67,    68,    69,    70,    71,    72,    73,    74,
     274,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,   434,   604,   605,
     606,   713,   717,   801,   714,    92,   200,   201,   521,   442,
     443,   444,   445,   446,   662,   278,   685,   778,   779,   786,
     787,   780,   781,   782,   783,   784,   130,   131,   132,   133,
     134,   135,   136,   137,   230,   117,    94,    95,    96,    97,
     344,    99,   115,   101,   568,   383,   447,   193,   384,   385,
     663,   664,   665,   338,   339,   340,   531,   533,   666,   218,
     667,   668,   669,   670,   671,   672,   673,   674,   279,   280,
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   571,   293,   294,   295,   296,   297,   298,   299,
     300,   301,   302,   303,   304,   305,   306,   307,   308,   309,
     310,   311,   312,   313,   406,   675,   676,   323,   219,   220,
     102,   103,   516,   517,   631,   518,   104,   362,   365,   677,
     839,   895,   896,   897,   941,   940,   873,   949,   678,   235,
     543,   189,   327,   353,   532,   625,   121,   124
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -762
static const yytype_int16 yypact[] =
{
    -762,    89,  2076,  -762,  -762,  -762,  -762,  -762,  -762,    72,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,   246,  3907,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    2445,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,    30,    39,   297,   297,  2568,  2691,  -762,  -762,  -762,
    -762,  -762,  1138,  1138,  1323,  1323,  2264,  2264,  1282,  1282,
    -762,    46,  2021,  2021,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,    98,  -762,  -762,  -762,  -762,  -762,  -762,   233,  -762,
    -762,  -762,  -762,    86,  -762,    73,   102,  -762,  -762,   296,
     108,    96,  -762,   158,   473,   186,  3907,  -762,  -762,  -762,
    -762,   203,  3135,   -23,   196,   -23,   223,   396,   300,  4045,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,   253,  -762,
    -762,   253,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,   244,  -762,
    -762,   312,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    3537,  -762,  -762,  -762,  -762,  -762,   369,    98,   377,  -762,
    -762,  4555,  -762,   356,   380,   371,  -762,   428,  -762,  -762,
     307,  -762,   296,   296,   411,  -762,   396,  -762,   396,  -762,
    -762,   351,  3415,  -762,   358,   358,  2814,  2937,  2978,   408,
     -23,  -762,   358,  -762,  -762,  -762,  -762,   300,   412,   425,
     396,   300,  4084,  -762,  -762,   557,  -762,   454,   557,  -762,
     467,   181,   470,   416,   482,  -762,  -762,  4855,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  4933,  4933,   487,  3537,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,   512,   529,   535,
    4955,   372,  3781,  2503,  2134,  2134,  1777,   975,   537,  -762,
     581,  -762,  -762,  -762,  -762,   585,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,   896,  -762,  -762,  -762,  -762,  5033,  -762,
    4955,  -762,   507,   427,   336,    61,   341,   530,   547,   552,
     588,    47,  -762,  -762,   508,   574,   369,   579,  -762,  3258,
    -762,  -762,  -762,   592,  4955,  1830,   124,   568,   568,   194,
    -762,   378,   439,   296,  -762,  -762,   636,  -762,  -762,   351,
    -762,   387,  4101,  -762,   396,   408,  4154,  -762,  -762,   351,
    -762,  -762,  -762,  3415,   476,   396,   396,   595,   490,   300,
    -762,  -762,  -762,   -23,   -23,   -23,   -23,  3537,  -762,  3537,
    -762,  -762,  -762,   607,   524,   608,  3944,  3944,  4955,  -762,
     372,  4210,  -762,  -762,  -762,  -762,  -762,  -762,  -762,   485,
    -762,  -762,  4577,  4955,   485,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  4955,  3537,  -762,  -762,
    4955,  4955,  4955,  4955,  4955,  4955,  4955,  4955,  4955,  4955,
    4955,  4955,  4955,  4955,  4955,  4955,  4955,  4955,  4655,  -762,
    4955,  -762,   613,  -762,  3822,  -762,   104,   104,  2199,  2322,
    2264,  2264,  -762,   618,  -762,   625,  -762,  -762,  -762,   646,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,  -762,   632,   663,   670,  -762,
    4955,  -762,  -762,  -762,  -762,   226,  -762,   314,  -762,   452,
    -762,    88,   682,  1461,  -762,   387,   504,   387,  4186,  4154,
     557,   557,  -762,   557,   557,  -762,  -762,  -762,  -762,  -762,
     514,   651,   651,   651,   651,   685,   692,  4677,  -762,   351,
    -762,   695,   696,   699,   701,   703,   707,  4210,  -762,  -762,
    -762,   544,  -762,   291,  -762,  -762,   708,  -762,  -762,  -762,
     507,   507,   427,   427,   336,   336,   336,   336,    61,    61,
     341,   530,   547,   552,   588,  4955,   170,  -762,  3822,  -762,
    3822,  -762,   119,  3659,  -762,   120,   299,   712,  -762,    43,
    3983,  -762,  -762,  -762,  -762,  -762,  -762,   435,  3377,  -762,
    -762,  -762,  -762,  3292,   743,   718,   719,  -762,   726,  1830,
    4755,  -762,  -762,  -762,  -762,   315,  -762,   759,  -762,  -762,
     710,   732,  4955,  4955,   711,   736,   714,   129,  4321,   738,
     739,   728,   730,  1953,  -762,  -762,  -762,  -762,   297,   297,
    2568,  2691,   731,  -762,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,   733,   753,  -762,  2636,   387,
     750,   -23,   -23,  -762,  4477,  -762,  -762,  -762,  -762,   754,
     754,  -762,  -762,  -762,   763,   909,  3944,  3944,  -762,   396,
    -762,  -762,  -762,  4955,  -762,   754,  -762,  4955,   761,  3822,
     762,  4955,  -762,   -23,  -762,   742,  -762,   -23,  -762,   742,
     178,  -762,    53,  -762,  -762,  3983,   -23,   -23,   -23,   -23,
    3377,   -23,   -23,  -762,  -762,  -762,  -762,  -762,  -762,   670,
    -762,   548,  -762,  -762,  -762,  4955,    94,   745,  -762,  4955,
    4321,  4955,   747,   804,  4955,  4955,   770,  3135,   253,  -762,
     253,  -762,  -762,  -762,  -762,  -762,   -23,  -762,   777,   428,
     778,  -762,   651,   651,   764,  -762,  4955,   518,  -762,  -762,
    4833,   366,  -762,  -762,  -762,  -762,   779,  4477,  1584,  -762,
     680,   783,   785,  -762,  -762,  -762,  -762,   784,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,   -23,   -23,  -762,  -762,  -762,
    -762,  -762,  -762,  -762,  -762,   569,  4955,  4321,  -762,   765,
    -762,   305,  -762,   791,   597,   624,   351,  3101,  -762,   796,
    -762,   797,   419,   798,   431,   803,  4321,   428,    13,   795,
     428,  -762,  -762,  -762,  4399,    32,  -762,  -762,  -762,  4955,
    -762,  -762,  -762,   809,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  4321,   789,  -762,  4955,  -762,  4955,  4321,  4321,  -762,
     351,  -762,    48,   815,    51,   793,   817,  -762,   494,  4955,
     397,   237,  -762,  -762,  4321,   810,   639,   878,  -762,  1707,
    -762,    51,   811,  1830,   150,   805,   825,  -762,  -762,   816,
    -762,   833,  4955,  -762,  -762,  4955,   823,  4321,   827,  1707,
     826,  -762,   840,  4955,    51,    51,  -762,   400,   842,   852,
    -762,  -762,  -762,   861,    51,   428,   662,   847,  -762,  -762,
    4321,  -762,   850,   224,  -762,   428,  -762,   428,  4955,   581,
     872,   873,   872,   672,   428,   743,  -762,   581,  -762,   895,
     743,  -762
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -762,  -762,  -762,  -762,  -762,  -762,   924,   617,  -762,  -762,
    -762,  -762,  -762,     4,   -27,  -762,  -762,     1,    -1,     2,
      -2,   -53,   851,  -762,  -762,  -762,  -762,  -762,   611,  -310,
       0,  -762,   626,  -762,   637,   282,  -762,  -762,   673,    16,
     -14,   204,  -762,  -762,   376,  -762,  -762,  -376,  -762,  -762,
    -762,   247,   250,   252,  -547,  -762,  -136,  -321,   644,  -762,
    -762,   352,  -762,  -570,    41,  -188,  -477,  -761,   197,  -762,
     201,  -762,  -762,   200,  -762,  -762,   -52,  -762,  -762,  -107,
     -84,  -762,   648,  -762,  -194,   243,  -762,    22,  -762,  -762,
     261,  -762,     8,  -762,   -41,   666,  -762,  -762,  -350,  -345,
     191,  -762,   609,  -542,  -762,   643,  -762,  -648,  -762,   228,
    -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -762,  -165,
    -762,  -762,  -762,  -762,   288,  -762,  -762,  -762,  -762,  -762,
    -762,  -762,   361,    -8,  -762,  -762,  -762,  -762,  -762,  -762,
    -762,  -254,   171,   328,   277,   326,   573,   575,   567,   571,
     582,  -762,   -74,   417,  -762,  -590,  -173,  -175,   131,    11,
       5,  -762,  -762,  -762,   259,  -611,  -762,   998,  -207,  -762,
     161,  -620,  -762,    97,  -762,    74,  -762,  -762,     3,   -48,
     664,   -89,   818,   293,  -407,   572,   -43,   152
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -575
static const yytype_int16 yytable[] =
{
      66,    64,    75,    63,    65,   106,    59,   314,   524,   440,
     100,   194,   140,   120,   112,   122,   379,   693,   739,   162,
     111,   167,   233,   172,   116,   175,   853,   607,   363,   181,
     565,   364,   326,   354,   118,   566,   366,   358,    66,    64,
      75,    63,    65,   440,   228,   788,   409,   113,   100,   388,
     110,   148,   157,   747,   735,   598,   718,   600,   148,   165,
     148,   170,   148,   174,   148,   179,   331,   332,   148,   185,
     373,   139,   142,   152,   161,   686,   687,   688,    23,    34,
      35,   147,   156,   878,   388,   374,   879,   249,    23,     3,
     236,   237,   238,   239,   240,   127,   112,   123,   182,   184,
     427,   874,   187,   241,   242,   880,   125,   107,   609,   417,
     418,   180,   243,   244,   108,   191,   205,   322,   341,   610,
     217,   215,    75,   893,   210,   360,   213,   232,   112,   342,
     112,   107,   186,   107,   428,   680,   891,   118,   108,    23,
     108,   711,   109,   228,   419,   420,   127,   228,   816,   449,
     113,   195,   204,   694,    23,   637,   577,   578,   579,   819,
     388,   127,   196,   140,   107,   550,   203,   197,   802,   609,
     352,   108,   802,   718,    34,    35,   191,   638,   202,   555,
     610,   556,   817,   321,   341,   120,   388,   720,   561,   562,
     519,   708,   205,   710,   374,   342,   374,   529,    34,    35,
      34,    35,   148,   157,   524,   751,   524,   711,   712,   721,
     217,   215,    75,    23,   126,   913,   217,   215,    75,   576,
     573,   889,   350,   709,   206,   205,   168,   171,   316,   198,
     382,   386,   147,   156,   374,   233,   199,   430,   106,   368,
     210,   106,   909,   345,   106,    93,   106,   370,   371,   113,
     322,   -18,   208,   113,   346,   596,   222,   228,   707,   565,
     388,   198,   321,    98,   566,   523,   711,   565,   199,   149,
     158,   910,   566,   211,   885,   228,   163,   166,    31,    32,
      33,    23,   912,    93,   869,   221,   114,    98,   156,   938,
     408,   902,   321,   184,   927,   841,   842,   633,   190,   540,
     541,    98,   797,   692,   932,   191,   138,   141,   151,   160,
     903,    25,   223,   440,   524,   919,   321,   439,   437,   441,
     436,   438,    26,  -566,    98,    98,    98,    98,   890,   611,
     614,   198,    23,   245,   366,    23,   681,   682,   199,   127,
     538,   354,   226,   358,   539,   632,   608,   146,   155,   198,
     198,   439,   437,   441,   436,   438,   199,   199,   430,   209,
     176,   178,   128,   113,   704,   227,   722,   113,   112,   112,
     112,   112,   430,   129,   329,   948,   129,    98,   330,   567,
     951,   113,   415,   416,   188,   634,   742,   167,   723,   114,
      98,   421,   422,    23,   865,   613,   616,   620,   622,   379,
     127,   246,   321,   321,   321,   321,   321,   321,   321,   321,
     321,   321,   321,   321,   321,   321,   321,   321,   321,   321,
     149,   158,    23,   341,   148,   157,   148,   170,   324,   226,
     569,   360,   603,   602,   342,   574,   325,   380,   849,  -570,
     777,   150,   159,    23,   191,   525,   322,   318,   381,   526,
     -20,   228,   535,   228,   147,   156,   850,   343,   343,   347,
     348,   224,   351,   342,   249,   343,   336,   746,   191,  -240,
      23,  -240,  -241,   345,  -241,   209,   158,   166,   355,   315,
     317,   333,   908,   319,   346,   550,   -19,  -240,   114,   -34,
    -241,   356,   114,    98,   551,   552,   553,   554,   146,   155,
     617,   -35,   923,   233,   413,   414,   527,   191,   791,   792,
     528,   618,   321,    31,    32,    33,    31,    32,    33,   635,
     107,   706,   372,   636,   -21,   228,   701,   108,    31,    32,
      33,   661,   659,    75,   658,   660,   799,   -22,   190,   207,
     -23,   224,   545,   106,   106,   191,   106,   106,   191,   321,
     715,   375,   -24,   846,   155,   224,   549,   113,   178,   113,
     847,   882,   191,   726,   727,   900,   728,   729,   322,   224,
     207,   731,   815,   732,   429,   430,   191,   376,   821,   224,
     683,   824,   825,   410,   580,   581,   191,   321,   411,   412,
     558,   430,   150,   159,   377,   228,   603,   602,   603,   602,
     378,   845,   536,   387,   838,   423,   536,   140,   725,   432,
     702,   703,   756,   757,   814,   703,   730,   388,   360,   156,
     114,   439,   437,   441,   436,   438,   120,   366,   389,   390,
     391,   113,   424,   795,   321,   861,   430,   322,   425,   113,
     426,   862,   149,   158,   431,   321,   148,   157,   159,   433,
     392,   217,   215,    75,    31,    32,    33,   393,   520,   394,
     375,   548,   375,   867,   430,   448,   759,   761,   763,   765,
     715,   530,   872,   557,   881,   838,   147,   156,   559,   612,
     615,   619,   621,   599,   701,   623,   112,   112,   752,   701,
     868,   430,   624,   886,   584,   585,   586,   587,   628,   321,
     375,   113,   322,   321,   901,   906,   430,   603,   602,   894,
     828,   829,   830,   831,   832,   833,   834,   835,   112,   627,
     146,   155,   112,   389,   390,   391,   894,   918,   934,   430,
     629,   112,   112,   112,   112,   630,   112,   112,   946,   430,
     926,   684,   322,   582,   583,   392,   855,   588,   589,   894,
     894,   689,   393,   639,   394,   217,   215,    75,   690,   894,
     933,   213,   695,   696,   192,   943,   697,   698,   321,   699,
     939,   112,   939,   700,   705,   322,   229,   234,   435,   947,
     192,   209,   209,   724,   736,   737,   661,   659,    75,   658,
     660,   273,   738,   225,   743,   563,   536,   745,   536,   744,
     748,   749,   750,   754,   755,   322,   275,   158,   321,   572,
     112,   112,   772,   773,   150,   159,  -218,   276,  -219,   766,
     430,   771,   767,   575,   691,   217,   215,    75,   322,   789,
     711,   350,   796,   798,   818,   106,   822,   106,   823,   753,
     826,   321,   837,   840,   800,   343,   719,   597,   803,   856,
     852,   857,   843,   277,   864,   858,   866,   807,   808,   809,
     810,   875,   811,   812,   149,   158,   -36,   -37,   -38,   273,
     536,   321,   334,   -39,   335,   229,   882,   884,   536,   229,
     361,   892,   898,   899,   275,   155,   907,   661,   659,    75,
     658,   660,   915,   914,   321,   276,   357,   836,   922,   905,
     911,   758,   760,   762,   764,   916,   917,   661,   659,    75,
     658,   660,   920,   925,   924,   929,   145,   154,   930,    98,
      98,    98,    98,   145,   164,   145,   169,   145,   173,   145,
     177,   277,   931,   145,   183,   935,   859,   860,   937,   944,
     536,   820,   146,   155,   248,   249,   250,   251,   252,   253,
     254,   395,   396,   397,   398,   399,   400,   401,   402,   403,
     404,   945,   950,   719,   119,   343,   542,   154,   209,   806,
     805,   804,   522,   209,   369,   734,   844,   848,   273,   159,
     273,   851,   534,   790,   560,   827,   405,   273,   273,   229,
     234,   741,   592,   275,    15,   275,   590,   593,   813,   591,
     105,   876,   275,   275,   276,    21,   276,   229,   863,   594,
     192,   942,   928,   276,   276,   269,   544,   328,   273,   626,
     357,   546,   547,     0,   357,     0,     0,   871,     0,     0,
       0,     0,     0,   275,     0,     0,   150,   159,     0,     0,
     277,     0,   277,     0,   276,   273,   564,   572,     0,   277,
     277,     0,   883,     0,     0,     0,     0,     0,   887,   888,
     275,     0,     0,     0,     0,     0,     0,   145,   154,    30,
       0,   276,     0,     0,     0,   904,     0,    34,    35,     0,
     277,     0,    36,   154,    38,    39,     0,    41,    42,    43,
       0,    44,    45,     0,     0,     0,     0,     0,   921,    51,
      52,   785,     0,     0,     0,     0,     0,   277,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     794,   936,     0,   154,   164,   169,   173,   177,   183,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     4,     5,     6,     0,     0,     0,     8,     0,     0,
       0,    10,    11,    12,    13,     0,     0,    15,    16,    17,
      18,     0,     0,    19,    20,     0,     0,     0,    21,     0,
       0,    22,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   229,     0,   229,   361,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   785,     0,     0,
       0,     0,   192,     0,   785,     0,     0,     0,     0,   273,
       0,   273,     0,     0,     0,     0,   357,     0,     0,     0,
       0,     0,     0,     0,   275,     0,   275,     0,     0,     0,
      28,    29,    30,     0,     0,   276,     0,   276,     0,     0,
      34,    35,     0,     0,     0,     0,    37,    38,    39,     0,
      41,    42,    43,     0,    44,    45,    46,    47,     0,     0,
       0,   785,    51,    52,     0,     0,     0,     0,     0,     0,
       0,   277,     0,   277,     0,   564,     0,     0,     0,     0,
       0,     0,     0,   564,     0,     4,     0,     0,     0,   145,
     154,   145,   169,     0,     0,    10,    11,     0,    13,     0,
       0,    15,     0,     0,     0,     0,     0,   273,   273,     0,
       0,     0,    21,     0,     0,    22,     0,     0,     0,     0,
     273,     0,   275,   275,     0,     0,     4,   229,     0,     0,
       0,     0,     0,   276,   276,   275,    10,    11,     0,    13,
       0,     0,    15,     0,     0,     0,   276,     0,     0,     0,
       0,     0,     0,    21,     0,     0,    22,     0,     0,     0,
       0,     0,     0,     0,     0,   793,     0,     0,     0,   277,
     277,     0,     0,     0,     0,     0,    30,     0,     0,     0,
       0,     0,   277,     0,    34,    35,     0,     0,     0,   154,
     154,    38,    39,     0,    41,    42,    43,     0,    44,    45,
       0,     0,     0,    48,    49,    50,    51,    52,     0,     0,
       0,     0,  -574,     0,     0,     0,     0,    30,   154,     0,
       0,     0,     0,     0,     0,    34,    35,     0,     0,     0,
       0,     0,    38,    39,     0,    41,    42,    43,     0,    44,
      45,     0,     0,     0,     0,     0,     0,    51,    52,     0,
       0,     0,     0,     0,   154,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     4,     5,     6,     7,   640,     0,
       8,   641,   642,     9,    10,    11,    12,    13,   643,    14,
      15,    16,    17,    18,   644,   645,    19,    20,   646,   647,
     247,    21,   648,   649,    22,   650,   651,   249,   250,   251,
     252,   253,   254,   652,     0,   255,   256,     0,     0,     0,
       0,   145,   154,   257,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   258,     0,     0,   770,
       0,   559,     0,     0,     0,     0,   259,   260,   261,   262,
     263,   264,     0,     0,     0,     0,     0,     0,     0,     0,
    -454,     0,     0,    28,    29,    30,   265,   266,    31,    32,
      33,     0,     0,    34,    35,   267,   268,   269,    36,    37,
      38,    39,   653,    41,    42,    43,   154,    44,    45,    46,
      47,   154,    48,    49,    50,    51,    52,     4,     5,     6,
       7,   640,     0,     8,   641,   642,     9,    10,    11,    12,
      13,   643,    14,    15,    16,    17,    18,   644,   645,    19,
      20,   646,   647,   247,    21,   648,   649,    22,   650,   651,
     249,   250,   251,   252,   253,   254,   652,     0,   255,   256,
       0,     0,     0,     0,     0,     0,   257,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   258,
       0,     0,     0,     0,   559,   854,     0,     0,     0,   259,
     260,   261,   262,   263,   264,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,    29,    30,   265,
     266,    31,    32,    33,     0,     0,    34,    35,   267,   268,
     269,    36,    37,    38,    39,   653,    41,    42,    43,     0,
      44,    45,    46,    47,     0,    48,    49,    50,    51,    52,
       4,     5,     6,     7,   640,     0,     8,   641,   642,     9,
      10,    11,    12,    13,   643,    14,    15,    16,    17,    18,
     644,   645,    19,    20,   646,   647,   247,    21,   648,   649,
      22,   650,   651,   249,   250,   251,   252,   253,   254,   652,
       0,   255,   256,     0,     0,     0,     0,     0,     0,   257,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   258,     0,     0,     0,     0,   559,  -571,     0,
       0,     0,   259,   260,   261,   262,   263,   264,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     0,     0,    28,
      29,    30,   265,   266,    31,    32,    33,    21,     0,    34,
      35,   267,   268,   269,    36,    37,    38,    39,   653,    41,
      42,    43,     0,    44,    45,    46,    47,     0,    48,    49,
      50,    51,    52,   450,   451,   452,   453,   454,   455,   456,
     457,   458,   459,   460,   461,   462,   463,   464,   465,   466,
     467,   468,   469,   470,   471,   472,   473,   474,   475,   476,
     477,   478,   479,   480,   481,   482,     0,     0,     0,     0,
       0,    30,     0,     0,     0,     0,     0,     0,     0,    34,
      35,     0,     0,     0,     0,     0,    38,    39,     0,    41,
      42,    43,     0,    44,    45,     0,     0,     0,    48,    49,
      50,    51,    52,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   483,   484,   485,   486,   487,   488,   489,   490,   491,
       0,     0,   492,   493,   494,   495,   496,   497,   498,   499,
     500,   501,   502,   503,   504,   505,   506,   507,   508,   509,
     510,   511,   512,   513,   514,   515,     4,     5,     6,     7,
       0,     0,     8,     0,     0,     9,    10,    11,    12,    13,
       0,    14,    15,    16,    17,    18,     0,     0,    19,    20,
       0,     0,   247,    21,     0,     0,    22,     0,   248,   249,
     250,   251,   252,   253,   254,    24,     0,   255,   256,     0,
       0,     0,     0,     0,     0,   257,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   258,     0,
       0,     0,     0,     0,     4,     0,     0,     0,   259,   260,
     261,   262,   263,   264,    10,    11,     0,    13,     0,     0,
      15,     0,     0,     0,     0,    28,    29,    30,   265,   266,
       0,    21,     0,     0,    22,    34,    35,   267,   268,   269,
      36,    37,    38,    39,   270,    41,    42,    43,     0,    44,
      45,    46,    47,     0,    48,    49,    50,    51,    52,     4,
       5,     6,     7,     0,     0,     8,     0,     0,     9,    10,
      11,    12,    13,     0,    14,    15,    16,    17,    18,     0,
       0,    19,    20,     0,     0,     0,    21,     0,     0,    22,
       0,    23,     0,     0,     0,    30,     0,     0,    24,     0,
       0,     0,     0,    34,    35,     0,     0,     0,    36,     0,
      38,    39,     0,    41,    42,    43,     0,    44,    45,     0,
       0,    25,     0,     0,     0,    51,    52,     0,     0,     0,
       0,     0,    26,    15,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    21,    27,     0,     0,    28,    29,
      30,     0,     0,    31,    32,    33,     0,     0,    34,    35,
       0,     0,     0,    36,    37,    38,    39,    40,    41,    42,
      43,     0,    44,    45,    46,    47,     0,    48,    49,    50,
      51,    52,     4,     5,     6,     7,     0,     0,     8,     0,
       0,     9,    10,    11,    12,    13,     0,    14,    15,    16,
      17,    18,     0,     0,    19,    20,     0,     0,    30,    21,
       0,     0,    22,     0,    23,     0,    34,    35,     0,     0,
       0,   143,     0,    38,    39,     0,    41,    42,    43,     0,
      44,    45,     0,     0,     0,     0,     0,     0,    51,    52,
       0,     0,     0,     0,   617,     0,     0,     4,     0,     0,
       0,   191,     0,     0,     0,   618,     0,    10,    11,     0,
      13,     0,     0,    15,     0,     0,     0,     0,     0,     0,
       0,    28,    29,    30,    21,     0,     0,    22,     0,     0,
       0,    34,    35,     0,     0,     0,    36,    37,    38,    39,
       0,    41,    42,    43,     0,    44,    45,    46,    47,     0,
      48,    49,    50,    51,    52,     4,     5,     6,     7,     0,
       0,     8,     0,     0,     9,    10,    11,    12,    13,     0,
      14,    15,    16,    17,    18,     0,     0,    19,    20,     0,
       0,     0,    21,     0,     0,    22,     0,    23,    30,     0,
       0,     0,     0,     0,   153,     0,    34,    35,     0,     0,
       0,     0,     0,    38,    39,     0,    41,    42,    43,     0,
      44,    45,     0,     0,     0,     0,     0,   617,    51,    52,
       0,     0,     0,     0,   191,     0,     0,     0,   618,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,    29,    30,     0,     0,     0,
       0,     0,     0,     0,    34,    35,     0,     0,     0,    36,
      37,    38,    39,     0,    41,    42,    43,     0,    44,    45,
      46,    47,     0,    48,    49,    50,    51,    52,     4,     5,
       6,     7,     0,     0,     8,     0,     0,     9,    10,    11,
      12,    13,     0,    14,    15,    16,    17,    18,     0,     0,
      19,    20,     0,     0,     0,    21,     0,     0,    22,     0,
      23,     0,     0,     0,     0,     0,     0,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     5,     6,     0,
      25,     0,     8,     0,     0,     0,     0,     0,    12,     0,
       0,    26,    15,    16,    17,    18,     0,     0,    19,    20,
       0,     0,     0,    21,     0,     0,     0,    28,    29,    30,
       0,     0,     0,     0,     0,     0,     0,    34,    35,     0,
       0,     0,    36,    37,    38,    39,     0,    41,    42,    43,
       0,    44,    45,    46,    47,     0,    48,    49,    50,    51,
      52,     4,     5,     6,     7,     0,     0,     8,     0,     0,
       9,    10,    11,    12,    13,     0,    14,    15,    16,    17,
      18,     0,     0,    19,    20,    28,    29,    30,    21,     0,
       0,    22,     0,    23,     0,    34,    35,     0,     0,     0,
     143,    37,    38,    39,     0,    41,    42,    43,     0,    44,
      45,    46,    47,     0,     0,     0,     0,    51,    52,     0,
       0,     0,     0,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    15,     0,     0,     0,     0,
      28,    29,    30,     0,   768,     0,    21,     0,     0,     0,
      34,    35,     0,     0,     0,    36,    37,    38,    39,     0,
      41,    42,    43,     0,    44,    45,    46,    47,     0,    48,
      49,    50,    51,    52,     4,     5,     6,     7,     0,     0,
       8,   769,     0,     9,    10,    11,    12,    13,     0,    14,
      15,    16,    17,    18,     0,     0,    19,    20,     0,     0,
       0,    21,     0,     0,    22,     0,    23,     0,     0,     0,
      30,     0,     0,   153,     0,     0,     0,     0,    34,    35,
       0,     0,     0,     0,     0,    38,    39,     0,    41,    42,
      43,     0,    44,    45,     0,     0,    25,     0,     0,     0,
      51,    52,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,    29,    30,     0,     0,     0,     0,
       0,     0,     0,    34,    35,     0,     0,     0,    36,    37,
      38,    39,     0,    41,    42,    43,     0,    44,    45,    46,
      47,     0,    48,    49,    50,    51,    52,     4,     5,     6,
       7,     0,     0,     8,     0,     0,     9,    10,    11,    12,
      13,     0,    14,    15,    16,    17,    18,     0,     0,    19,
      20,     0,     0,     0,    21,     0,     0,    22,     0,    23,
       0,     0,     0,     0,     0,     0,   143,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   345,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     346,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,    29,    30,     0,
       0,     0,     0,     0,     0,     0,    34,    35,     0,     0,
       0,    36,    37,    38,    39,     0,    41,    42,    43,     0,
      44,    45,    46,    47,     0,    48,    49,    50,    51,    52,
       4,     5,     6,     7,     0,     0,     8,     0,     0,     9,
      10,    11,    12,    13,     0,    14,    15,    16,    17,    18,
       0,     0,    19,    20,     0,     0,     0,    21,     0,     0,
      22,     0,    23,     0,     0,     0,     0,     0,     0,   153,
       0,     4,     5,     6,     7,     0,     0,     8,     0,     0,
       9,    10,    11,    12,    13,     0,    14,    15,    16,    17,
      18,     0,   345,    19,    20,     0,     0,     0,    21,     0,
       0,    22,     0,   346,     0,     0,     0,     0,     0,     0,
      24,     0,     0,     0,     0,     0,     0,     0,     0,    28,
      29,    30,     0,     0,     0,     0,     0,     0,     0,    34,
      35,     0,     0,     0,    36,    37,    38,    39,   349,    41,
      42,    43,     0,    44,    45,    46,    47,     0,    48,    49,
      50,    51,    52,     0,     0,     0,     0,     0,     0,     0,
      28,    29,    30,     0,     0,     0,     0,     0,     0,     0,
      34,    35,     0,     0,     0,    36,    37,    38,    39,   212,
      41,    42,    43,     0,    44,    45,    46,    47,     0,    48,
      49,    50,    51,    52,     4,     5,     6,     7,     0,     0,
       8,     0,     0,     9,    10,    11,    12,    13,     0,    14,
      15,    16,    17,    18,     0,     0,    19,    20,     0,     0,
       0,    21,     0,     0,    22,     0,     0,     0,     4,     5,
       6,     7,     0,    24,     8,     0,     0,     9,    10,    11,
      12,    13,     0,    14,    15,    16,    17,    18,     0,     0,
      19,    20,     0,     0,     0,    21,     0,     0,    22,     0,
       0,   870,     0,     0,     0,     0,     0,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,    29,    30,     0,     0,     0,     0,
       0,     0,     0,    34,    35,     0,     0,     0,    36,    37,
      38,    39,   212,    41,    42,    43,     0,    44,    45,    46,
      47,     0,    48,    49,    50,    51,    52,    28,    29,    30,
       0,     0,     0,     0,     0,     0,     0,    34,    35,     0,
       0,     0,    36,    37,    38,    39,   212,    41,    42,    43,
       0,    44,    45,    46,    47,     0,    48,    49,    50,    51,
      52,     4,     5,     6,     7,     0,     0,     8,     0,     0,
       9,    10,    11,    12,    13,     0,    14,    15,    16,    17,
      18,     0,     0,    19,    20,     0,     0,     0,    21,     0,
       0,    22,     0,   435,     0,     4,     5,     6,     7,     0,
      24,     8,     0,     0,     9,    10,    11,    12,    13,     0,
      14,    15,    16,    17,    18,     0,     0,    19,    20,     0,
       0,     0,    21,     0,     0,    22,     0,     0,     0,     0,
       0,     0,     0,     0,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   733,     0,     0,     0,
      28,    29,    30,     0,     0,     0,     0,     0,     0,     0,
      34,    35,     0,     0,     0,    36,    37,    38,    39,     0,
      41,    42,    43,     0,    44,    45,    46,    47,     0,    48,
      49,    50,    51,    52,    28,    29,    30,     0,     0,     0,
       0,     0,     0,     0,    34,    35,    15,     0,     0,    36,
      37,    38,    39,     0,    41,    42,    43,    21,    44,    45,
      46,    47,    23,    48,    49,    50,    51,    52,     4,     5,
       6,     7,     0,     0,     8,     0,     0,     9,    10,    11,
      12,    13,     0,    14,    15,    16,    17,    18,     0,     0,
      19,    20,   617,     0,     0,    21,     0,     0,    22,   191,
       0,     0,     0,   618,     0,     0,     0,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    30,     0,     0,     0,     0,     0,     0,     0,    34,
      35,     0,     0,     0,     0,     0,    38,    39,     0,    41,
      42,    43,     0,    44,    45,     0,     0,     0,     0,     0,
       0,    51,    52,     0,     0,     0,     0,    28,    29,    30,
       0,     0,     0,     0,     0,     0,     0,    34,    35,     0,
       0,     0,    36,    37,    38,    39,     0,    41,    42,    43,
       0,    44,    45,    46,    47,     0,    48,    49,    50,    51,
      52,     5,     6,     7,     0,     0,     8,     0,     0,     9,
       0,     0,    12,     0,     0,    14,    15,    16,    17,    18,
       0,     0,    19,    20,     0,     0,   247,    21,     0,     0,
       0,     0,   248,   249,   250,   251,   252,   253,   254,    24,
       0,   255,   256,     0,     0,     0,     0,     0,     0,   257,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   258,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   259,   260,   261,   262,   263,   264,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
      29,    30,   265,   266,     0,     0,     0,     0,     0,    34,
      35,   267,   268,   269,    36,    37,    38,    39,   270,    41,
      42,    43,     0,    44,    45,    46,    47,     0,    48,    49,
      50,    51,    52,     5,     6,     7,     0,     0,     8,     0,
       0,     9,     0,     0,    12,     0,     0,    14,    15,    16,
      17,    18,     0,     0,    19,    20,     0,     0,     0,    21,
       0,     0,     0,     0,    23,     0,     0,     0,     0,     0,
       0,   153,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   345,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   346,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   711,   716,     0,
       0,    28,    29,    30,     0,     0,     0,     0,     0,     0,
       0,    34,    35,     0,     0,     0,    36,    37,    38,    39,
       0,    41,    42,    43,     0,    44,    45,    46,    47,     0,
      48,    49,    50,    51,    52,     5,     6,     7,     0,     0,
       8,     0,     0,     9,     0,     0,    12,     0,     0,    14,
      15,    16,    17,    18,     0,     0,    19,    20,     0,     0,
       0,    21,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   153,     0,     0,     5,     6,     7,     0,
       0,     8,     0,     0,     9,     0,     0,    12,     0,     0,
      14,    15,    16,    17,    18,     0,   380,    19,    20,     0,
       0,     0,    21,   191,     0,     0,     0,   381,     0,     0,
       0,     0,     0,     0,    24,     0,     0,     0,     0,     0,
       0,     0,     0,    28,    29,    30,     0,     0,     0,     0,
       0,     0,     0,    34,    35,     0,     0,     0,    36,    37,
      38,    39,     0,    41,    42,    43,     0,    44,    45,    46,
      47,     0,    48,    49,    50,    51,    52,     0,     0,     0,
       0,   601,     0,     0,    28,    29,    30,     0,     0,     0,
       0,     0,     0,     0,    34,    35,    15,     0,     0,    36,
      37,    38,    39,     0,    41,    42,    43,    21,    44,    45,
      46,    47,    23,    48,    49,    50,    51,    52,     5,     6,
       7,     0,     0,     8,     0,     0,     9,     0,     0,    12,
       0,     0,    14,    15,    16,    17,    18,     0,     0,    19,
      20,     0,    25,     0,    21,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    30,    15,     0,     0,     0,     0,     0,     0,    34,
      35,     0,     0,    21,     0,     0,    38,    39,    23,    41,
      42,    43,     0,    44,    45,   127,     0,     0,     0,     0,
       0,    51,    52,     0,     0,     0,    28,    29,    30,     0,
       0,     0,     0,     0,     0,     0,    34,    35,   609,     0,
       0,    36,    37,    38,    39,   191,    41,    42,    43,   610,
      44,    45,    46,    47,    15,    48,    49,    50,    51,    52,
       0,     0,     0,     0,     0,    21,     0,    30,     0,     0,
      23,     0,     0,     0,     0,    34,    35,   127,     0,     0,
       0,     0,    38,    39,     0,    41,    42,    43,     0,    44,
      45,     0,     0,    15,     0,     0,     0,    51,    52,     0,
     231,     0,     0,     0,    21,     0,     0,     0,     0,    23,
      15,   129,     0,     0,     0,     0,   127,     0,     0,     0,
       0,    21,     0,     0,     0,     0,    23,     0,     0,    30,
       0,     0,     0,   127,     0,     0,     0,    34,    35,   359,
       0,     0,     0,     0,    38,    39,     0,    41,    42,    43,
     129,    44,    45,     0,     0,     0,   537,     0,     0,    51,
      52,     0,     0,    15,     0,     0,     0,   342,    30,     0,
       0,     0,     0,     0,    21,     0,    34,    35,     0,    23,
       0,     0,     0,    38,    39,    30,    41,    42,    43,     0,
      44,    45,     0,    34,    35,    15,     0,     0,    51,    52,
      38,    39,     0,    41,    42,    43,    21,    44,    45,   345,
       0,    23,     0,     0,     0,    51,    52,     0,   127,    15,
     346,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      21,     0,     0,     0,     0,     0,     0,     0,    30,     0,
       0,   679,     0,     0,     0,     0,    34,    35,     0,     0,
       0,     0,   342,    38,    39,     0,    41,    42,    43,     0,
      44,    45,     0,     0,     0,   380,     0,     0,    51,    52,
      30,     0,   191,     0,     0,     0,   381,     0,    34,    35,
       0,     0,     0,     0,     0,    38,    39,     0,    41,    42,
      43,     0,    44,    45,    30,     0,     0,     0,     0,     0,
      51,    52,    34,    35,     0,     0,     0,     0,     0,    38,
      39,     0,    41,    42,    43,     0,    44,    45,   640,     0,
       0,   641,   642,     0,    51,    52,     0,     0,   643,     0,
       0,     0,     0,     0,   644,   645,     0,     0,   646,   647,
     247,     0,   648,   649,     0,   650,   651,   249,   250,   251,
     252,   253,   254,   108,     0,   255,   256,     0,     0,     0,
       0,     0,     0,   257,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   258,     0,     0,     0,
       0,   559,     0,     0,     0,     0,   259,   260,   261,   262,
     263,   264,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   265,   266,    31,    32,
      33,     0,     0,     0,     0,   267,   268,   269,   247,     0,
       0,     0,   270,     0,   774,   249,   250,   251,   252,   253,
     254,     0,     0,   255,   256,     0,     0,     0,     0,     0,
       0,   257,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   258,     0,     0,     0,     0,   775,
     877,   776,     0,   777,   259,   260,   261,   262,   263,   264,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   265,   266,     0,     0,     0,     0,
       0,     0,     0,   267,   268,   269,   247,     0,     0,     0,
     270,     0,   774,   249,   250,   251,   252,   253,   254,     0,
       0,   255,   256,     0,     0,     0,     0,     0,     0,   257,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   258,     0,     0,     0,     0,   775,     0,   776,
       0,   777,   259,   260,   261,   262,   263,   264,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   265,   266,     0,     0,     0,     0,     0,     0,
       0,   267,   268,   269,   247,     0,     0,     0,   270,     0,
     248,   249,   250,   251,   252,   253,   254,     0,     0,   255,
     256,     0,     0,     0,     0,     0,   247,   257,     0,     0,
       0,     0,   248,   249,   250,   251,   252,   253,   254,     0,
     258,   255,   256,     0,     0,     0,     0,     0,   320,   257,
     259,   260,   261,   262,   263,   264,     0,     0,     0,     0,
       0,     0,   258,   570,     0,     0,     0,     0,     0,     0,
     265,   266,   259,   260,   261,   262,   263,   264,     0,   267,
     268,   269,     0,     0,     0,     0,   270,     0,     0,     0,
       0,     0,   265,   266,     0,     0,     0,     0,     0,     0,
       0,   267,   268,   269,   247,     0,     0,     0,   270,     0,
     248,   249,   250,   251,   252,   253,   254,     0,     0,   255,
     256,     0,     0,     0,     0,     0,   247,   257,     0,     0,
       0,     0,   248,   249,   250,   251,   252,   253,   254,     0,
     258,   255,   256,     0,     0,     0,     0,     0,     0,   257,
     259,   260,   261,   262,   263,   264,     0,     0,     0,     0,
       0,     0,   258,   595,     0,     0,     0,   691,     0,     0,
     265,   266,   259,   260,   261,   262,   263,   264,     0,   267,
     268,   269,     0,     0,     0,     0,   270,     0,     0,     0,
       0,     0,   265,   266,     0,     0,     0,     0,     0,     0,
       0,   267,   268,   269,   247,     0,     0,     0,   270,     0,
     248,   249,   250,   251,   252,   253,   254,     0,     0,   255,
     256,     0,     0,     0,     0,     0,     0,   257,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     258,   740,     0,     0,     0,     0,     0,     0,     0,     0,
     259,   260,   261,   262,   263,   264,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     265,   266,     0,     0,     0,     0,     0,     0,     0,   267,
     268,   269,   247,     0,     0,     0,   270,     0,   248,   249,
     250,   251,   252,   253,   254,     0,     0,   255,   256,     0,
       0,     0,     0,     0,   247,   257,     0,     0,     0,     0,
     248,   249,   250,   251,   252,   253,   254,     0,   258,   255,
     256,     0,     0,   775,     0,     0,     0,   257,   259,   260,
     261,   262,   263,   264,     0,     0,     0,     0,     0,     0,
     367,     0,     0,     0,     0,     0,     0,     0,   265,   266,
     259,   260,   261,   262,   263,   264,     0,   267,   268,   269,
       0,     0,     0,     0,   270,     0,     0,     0,     0,     0,
     265,   266,     0,     0,     0,     0,     0,     0,     0,   267,
     268,   269,   247,     0,     0,     0,   270,     0,   248,   249,
     250,   251,   252,   253,   254,     0,     0,   255,   256,     0,
       0,     0,     0,     0,   247,   257,     0,     0,     0,     0,
     248,   249,   250,   251,   252,   253,   254,     0,   369,   255,
     256,     0,     0,     0,     0,     0,     0,   257,   259,   260,
     261,   262,   263,   264,     0,     0,     0,     0,     0,     0,
     258,     0,     0,     0,     0,     0,     0,     0,   265,   266,
     259,   260,   261,   262,   263,   264,     0,   267,   268,   269,
       0,     0,     0,     0,   270,     0,     0,     0,     0,     0,
     265,   266,     0,     0,     0,     0,     0,     0,     0,   267,
     268,   269,   247,     0,     0,     0,   270,     0,   248,   249,
     250,   251,   252,   253,   254,     0,     0,   255,   256,     0,
       0,     0,     0,     0,     0,   257,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   407,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   259,   260,
     261,   262,   263,   264,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   265,   266,
       0,     0,     0,     0,     0,     0,     0,   267,   268,   269,
       0,     0,     0,     0,   270
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-762))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       2,     2,     2,     2,     2,     2,     2,   180,   329,   319,
       2,   100,    64,    40,     9,    58,   270,   559,   629,    72,
       9,    74,   129,    76,    26,    78,   787,   434,   235,    82,
     380,   238,   197,   227,    26,   380,   243,   231,    40,    40,
      40,    40,    40,   353,   128,   693,   300,    25,    40,    36,
       9,    65,    66,   643,   624,   431,   603,   433,    72,    73,
      74,    75,    76,    77,    78,    79,   202,   203,    82,    83,
     258,    63,    64,    65,    66,   552,   553,   554,    35,   102,
     103,    65,    66,   844,    36,   258,    54,    36,    35,     0,
     138,   139,   140,   141,   142,    42,    91,    67,    82,    83,
      53,    88,    91,   151,   152,    73,    67,    35,    65,    48,
      49,    65,   160,   161,    42,    72,   111,   191,    65,    76,
     122,   122,   122,    72,   116,   232,   122,   129,   123,    76,
     125,    35,    91,    35,    87,   542,    88,   129,    42,    35,
      42,    88,    70,   227,    83,    84,    42,   231,    54,   324,
     128,    65,   111,   560,    35,    67,   410,   411,   412,   749,
      36,    42,    89,   215,    35,   359,    70,    65,   715,    65,
     222,    42,   719,   720,   102,   103,    72,    89,    70,   367,
      76,   369,    88,   191,    65,   212,    36,    67,   376,   377,
      66,   598,   187,   600,   367,    76,   369,   333,   102,   103,
     102,   103,   216,   217,   525,    76,   527,    88,    89,    89,
     212,   212,   212,    35,    62,    65,   218,   218,   218,   407,
     393,   869,   218,   599,    66,   220,    74,    75,   187,    35,
     271,   272,   216,   217,   407,   342,    42,    67,   235,   247,
     232,   238,   890,    65,   241,     2,   243,   255,   256,   227,
     324,    70,    66,   231,    76,   428,   125,   341,    88,   609,
      36,    35,   270,     2,   609,    71,    88,   617,    42,    65,
      66,   891,   617,    70,   864,   359,    72,    73,    97,    98,
      99,    35,   893,    40,   826,    89,    25,    26,   272,    65,
     298,    54,   300,   277,   914,   772,   773,    71,    65,   347,
     348,    40,   709,   557,   924,    72,    63,    64,    65,    66,
      73,    65,    89,   623,   635,   905,   324,   319,   319,   319,
     319,   319,    76,    70,    63,    64,    65,    66,   870,   436,
     437,    35,    35,    89,   541,    35,   543,   544,    42,    42,
     342,   535,    42,   537,   346,   520,   435,    65,    66,    35,
      35,   353,   353,   353,   353,   353,    42,    42,    67,   116,
      78,    79,    65,   341,    73,    65,    67,   345,   363,   364,
     365,   366,    67,    76,    67,   945,    76,   116,    71,   381,
     950,   359,    46,    47,    91,    71,    71,   440,    89,   128,
     129,    50,    51,    35,    89,   436,   437,   438,   439,   653,
      42,    89,   410,   411,   412,   413,   414,   415,   416,   417,
     418,   419,   420,   421,   422,   423,   424,   425,   426,   427,
     216,   217,    35,    65,   438,   439,   440,   441,    72,    42,
     389,   538,   434,   434,    76,   394,    65,    65,    72,    70,
      74,    65,    66,    35,    72,    67,   520,    70,    76,    71,
      70,   535,    65,   537,   438,   439,    90,   214,   215,   216,
     217,    65,   219,    76,    36,   222,   115,   642,    72,    72,
      35,    74,    72,    65,    74,   232,   272,   273,    66,   186,
     187,    70,   889,   190,    76,   679,    70,    90,   227,    70,
      90,    66,   231,   232,   363,   364,   365,   366,   216,   217,
      65,    70,   909,   610,    77,    78,    67,    72,   696,   697,
      71,    76,   520,    97,    98,    99,    97,    98,    99,    67,
      35,   595,    35,    71,    70,   609,   567,    42,    97,    98,
      99,   533,   533,   533,   533,   533,   711,    70,    65,    66,
      70,    65,    66,   540,   541,    72,   543,   544,    72,   557,
     602,   258,    70,    35,   272,    65,    66,   535,   276,   537,
      42,    67,    72,   611,   612,    71,   614,   615,   642,    65,
      66,   619,   745,   621,    66,    67,    72,    65,   751,    65,
      66,   754,   755,    76,   413,   414,    72,   595,    81,    82,
      66,    67,   216,   217,    65,   679,   598,   598,   600,   600,
      65,   776,   341,    66,   769,    75,   345,   659,   610,   316,
      66,    67,   655,   656,    66,    67,   618,    36,   725,   603,
     359,   623,   623,   623,   623,   623,   653,   834,    43,    44,
      45,   609,    85,   707,   642,    66,    67,   711,    86,   617,
      52,   816,   438,   439,    70,   653,   660,   661,   272,    70,
      65,   653,   653,   653,    97,    98,    99,    72,    90,    74,
     367,    66,   369,    66,    67,    73,   658,   659,   660,   661,
     722,    35,   837,    66,   849,   840,   660,   661,    70,   436,
     437,   438,   439,    70,   725,    67,   681,   682,   647,   730,
      66,    67,    67,   866,   417,   418,   419,   420,    66,   707,
     407,   679,   776,   711,   879,    66,    67,   709,   709,   874,
     758,   759,   760,   761,   762,   763,   764,   765,   713,    73,
     438,   439,   717,    43,    44,    45,   891,   902,    66,    67,
      67,   726,   727,   728,   729,    65,   731,   732,    66,    67,
     913,    90,   816,   415,   416,    65,    66,   421,   422,   914,
     915,    66,    72,    71,    74,   757,   757,   757,    66,   924,
     925,   757,    67,    67,    98,   938,    67,    66,   776,    66,
     935,   766,   937,    66,    66,   849,   128,   129,    35,   944,
     114,   538,   539,    71,    66,    66,   788,   788,   788,   788,
     788,   180,    66,   127,    35,   378,   535,    65,   537,    89,
      89,    65,    88,    65,    65,   879,   180,   603,   816,   392,
     805,   806,   681,   682,   438,   439,    88,   180,    88,    88,
      67,    71,    89,   406,    70,   827,   827,   827,   902,    66,
      88,   827,    71,    71,    89,   832,    89,   834,    34,   648,
      70,   849,    65,    65,   713,   602,   603,   430,   717,    66,
      71,    66,    88,   180,    89,    71,    65,   726,   727,   728,
     729,    66,   731,   732,   660,   661,    70,    70,    70,   258,
     609,   879,   206,    70,   208,   227,    67,    88,   617,   231,
     232,    66,    89,    66,   258,   603,     8,   889,   889,   889,
     889,   889,    67,    88,   902,   258,   230,   766,    71,    89,
      89,   658,   659,   660,   661,    89,    73,   909,   909,   909,
     909,   909,    89,    73,    88,    73,    65,    66,    66,   658,
     659,   660,   661,    72,    73,    74,    75,    76,    77,    78,
      79,   258,    71,    82,    83,    88,   805,   806,    88,    67,
     679,   750,   660,   661,    35,    36,    37,    38,    39,    40,
      41,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    88,    67,   720,    40,   722,   349,   116,   725,   722,
     720,   719,   328,   730,    65,   623,   775,   780,   367,   603,
     369,   781,   339,   695,   375,   757,    90,   376,   377,   341,
     342,   630,   425,   367,    19,   369,   423,   426,   739,   424,
       2,   840,   376,   377,   367,    30,   369,   359,   817,   427,
     344,   937,   915,   376,   377,   106,   352,   199,   407,   447,
     354,   355,   356,    -1,   358,    -1,    -1,   836,    -1,    -1,
      -1,    -1,    -1,   407,    -1,    -1,   660,   661,    -1,    -1,
     367,    -1,   369,    -1,   407,   434,   380,   630,    -1,   376,
     377,    -1,   861,    -1,    -1,    -1,    -1,    -1,   867,   868,
     434,    -1,    -1,    -1,    -1,    -1,    -1,   216,   217,    94,
      -1,   434,    -1,    -1,    -1,   884,    -1,   102,   103,    -1,
     407,    -1,   107,   232,   109,   110,    -1,   112,   113,   114,
      -1,   116,   117,    -1,    -1,    -1,    -1,    -1,   907,   124,
     125,   684,    -1,    -1,    -1,    -1,    -1,   434,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     703,   930,    -1,   272,   273,   274,   275,   276,   277,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,     4,     5,    -1,    -1,    -1,     9,    -1,    -1,
      -1,    13,    14,    15,    16,    -1,    -1,    19,    20,    21,
      22,    -1,    -1,    25,    26,    -1,    -1,    -1,    30,    -1,
      -1,    33,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   535,    -1,   537,   538,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   780,    -1,    -1,
      -1,    -1,   536,    -1,   787,    -1,    -1,    -1,    -1,   598,
      -1,   600,    -1,    -1,    -1,    -1,   550,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   598,    -1,   600,    -1,    -1,    -1,
      92,    93,    94,    -1,    -1,   598,    -1,   600,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,   108,   109,   110,    -1,
     112,   113,   114,    -1,   116,   117,   118,   119,    -1,    -1,
      -1,   844,   124,   125,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   598,    -1,   600,    -1,   609,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   617,    -1,     3,    -1,    -1,    -1,   438,
     439,   440,   441,    -1,    -1,    13,    14,    -1,    16,    -1,
      -1,    19,    -1,    -1,    -1,    -1,    -1,   696,   697,    -1,
      -1,    -1,    30,    -1,    -1,    33,    -1,    -1,    -1,    -1,
     709,    -1,   696,   697,    -1,    -1,     3,   679,    -1,    -1,
      -1,    -1,    -1,   696,   697,   709,    13,    14,    -1,    16,
      -1,    -1,    19,    -1,    -1,    -1,   709,    -1,    -1,    -1,
      -1,    -1,    -1,    30,    -1,    -1,    33,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   699,    -1,    -1,    -1,   696,
     697,    -1,    -1,    -1,    -1,    -1,    94,    -1,    -1,    -1,
      -1,    -1,   709,    -1,   102,   103,    -1,    -1,    -1,   538,
     539,   109,   110,    -1,   112,   113,   114,    -1,   116,   117,
      -1,    -1,    -1,   121,   122,   123,   124,   125,    -1,    -1,
      -1,    -1,    89,    -1,    -1,    -1,    -1,    94,   567,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,    -1,   112,   113,   114,    -1,   116,
     117,    -1,    -1,    -1,    -1,    -1,    -1,   124,   125,    -1,
      -1,    -1,    -1,    -1,   603,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,     4,     5,     6,     7,    -1,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    -1,    44,    45,    -1,    -1,    -1,
      -1,   660,   661,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,   678,
      -1,    70,    -1,    -1,    -1,    -1,    75,    76,    77,    78,
      79,    80,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      89,    -1,    -1,    92,    93,    94,    95,    96,    97,    98,
      99,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   725,   116,   117,   118,
     119,   730,   121,   122,   123,   124,   125,     3,     4,     5,
       6,     7,    -1,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    -1,    44,    45,
      -1,    -1,    -1,    -1,    -1,    -1,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    70,    71,    -1,    -1,    -1,    75,
      76,    77,    78,    79,    80,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    92,    93,    94,    95,
      96,    97,    98,    99,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,    -1,
     116,   117,   118,   119,    -1,   121,   122,   123,   124,   125,
       3,     4,     5,     6,     7,    -1,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      -1,    44,    45,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    70,    71,    -1,
      -1,    -1,    75,    76,    77,    78,    79,    80,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    19,    -1,    -1,    92,
      93,    94,    95,    96,    97,    98,    99,    30,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,    -1,   116,   117,   118,   119,    -1,   121,   122,
     123,   124,   125,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    -1,    -1,    -1,    -1,
      -1,    94,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,    -1,   112,
     113,   114,    -1,   116,   117,    -1,    -1,    -1,   121,   122,
     123,   124,   125,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    91,    92,    93,    94,    95,    96,    97,    98,    99,
      -1,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,     3,     4,     5,     6,
      -1,    -1,     9,    -1,    -1,    12,    13,    14,    15,    16,
      -1,    18,    19,    20,    21,    22,    -1,    -1,    25,    26,
      -1,    -1,    29,    30,    -1,    -1,    33,    -1,    35,    36,
      37,    38,    39,    40,    41,    42,    -1,    44,    45,    -1,
      -1,    -1,    -1,    -1,    -1,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    75,    76,
      77,    78,    79,    80,    13,    14,    -1,    16,    -1,    -1,
      19,    -1,    -1,    -1,    -1,    92,    93,    94,    95,    96,
      -1,    30,    -1,    -1,    33,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,    -1,   116,
     117,   118,   119,    -1,   121,   122,   123,   124,   125,     3,
       4,     5,     6,    -1,    -1,     9,    -1,    -1,    12,    13,
      14,    15,    16,    -1,    18,    19,    20,    21,    22,    -1,
      -1,    25,    26,    -1,    -1,    -1,    30,    -1,    -1,    33,
      -1,    35,    -1,    -1,    -1,    94,    -1,    -1,    42,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,   107,    -1,
     109,   110,    -1,   112,   113,   114,    -1,   116,   117,    -1,
      -1,    65,    -1,    -1,    -1,   124,   125,    -1,    -1,    -1,
      -1,    -1,    76,    19,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    30,    89,    -1,    -1,    92,    93,
      94,    -1,    -1,    97,    98,    99,    -1,    -1,   102,   103,
      -1,    -1,    -1,   107,   108,   109,   110,   111,   112,   113,
     114,    -1,   116,   117,   118,   119,    -1,   121,   122,   123,
     124,   125,     3,     4,     5,     6,    -1,    -1,     9,    -1,
      -1,    12,    13,    14,    15,    16,    -1,    18,    19,    20,
      21,    22,    -1,    -1,    25,    26,    -1,    -1,    94,    30,
      -1,    -1,    33,    -1,    35,    -1,   102,   103,    -1,    -1,
      -1,    42,    -1,   109,   110,    -1,   112,   113,   114,    -1,
     116,   117,    -1,    -1,    -1,    -1,    -1,    -1,   124,   125,
      -1,    -1,    -1,    -1,    65,    -1,    -1,     3,    -1,    -1,
      -1,    72,    -1,    -1,    -1,    76,    -1,    13,    14,    -1,
      16,    -1,    -1,    19,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    92,    93,    94,    30,    -1,    -1,    33,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,   107,   108,   109,   110,
      -1,   112,   113,   114,    -1,   116,   117,   118,   119,    -1,
     121,   122,   123,   124,   125,     3,     4,     5,     6,    -1,
      -1,     9,    -1,    -1,    12,    13,    14,    15,    16,    -1,
      18,    19,    20,    21,    22,    -1,    -1,    25,    26,    -1,
      -1,    -1,    30,    -1,    -1,    33,    -1,    35,    94,    -1,
      -1,    -1,    -1,    -1,    42,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,    -1,   112,   113,   114,    -1,
     116,   117,    -1,    -1,    -1,    -1,    -1,    65,   124,   125,
      -1,    -1,    -1,    -1,    72,    -1,    -1,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    92,    93,    94,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,   107,
     108,   109,   110,    -1,   112,   113,   114,    -1,   116,   117,
     118,   119,    -1,   121,   122,   123,   124,   125,     3,     4,
       5,     6,    -1,    -1,     9,    -1,    -1,    12,    13,    14,
      15,    16,    -1,    18,    19,    20,    21,    22,    -1,    -1,
      25,    26,    -1,    -1,    -1,    30,    -1,    -1,    33,    -1,
      35,    -1,    -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     4,     5,    -1,
      65,    -1,     9,    -1,    -1,    -1,    -1,    -1,    15,    -1,
      -1,    76,    19,    20,    21,    22,    -1,    -1,    25,    26,
      -1,    -1,    -1,    30,    -1,    -1,    -1,    92,    93,    94,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,   107,   108,   109,   110,    -1,   112,   113,   114,
      -1,   116,   117,   118,   119,    -1,   121,   122,   123,   124,
     125,     3,     4,     5,     6,    -1,    -1,     9,    -1,    -1,
      12,    13,    14,    15,    16,    -1,    18,    19,    20,    21,
      22,    -1,    -1,    25,    26,    92,    93,    94,    30,    -1,
      -1,    33,    -1,    35,    -1,   102,   103,    -1,    -1,    -1,
      42,   108,   109,   110,    -1,   112,   113,   114,    -1,   116,
     117,   118,   119,    -1,    -1,    -1,    -1,   124,   125,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    19,    -1,    -1,    -1,    -1,
      92,    93,    94,    -1,    28,    -1,    30,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,   107,   108,   109,   110,    -1,
     112,   113,   114,    -1,   116,   117,   118,   119,    -1,   121,
     122,   123,   124,   125,     3,     4,     5,     6,    -1,    -1,
       9,    65,    -1,    12,    13,    14,    15,    16,    -1,    18,
      19,    20,    21,    22,    -1,    -1,    25,    26,    -1,    -1,
      -1,    30,    -1,    -1,    33,    -1,    35,    -1,    -1,    -1,
      94,    -1,    -1,    42,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,    -1,   112,   113,
     114,    -1,   116,   117,    -1,    -1,    65,    -1,    -1,    -1,
     124,   125,    -1,    -1,    -1,    -1,    -1,    76,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    92,    93,    94,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,   107,   108,
     109,   110,    -1,   112,   113,   114,    -1,   116,   117,   118,
     119,    -1,   121,   122,   123,   124,   125,     3,     4,     5,
       6,    -1,    -1,     9,    -1,    -1,    12,    13,    14,    15,
      16,    -1,    18,    19,    20,    21,    22,    -1,    -1,    25,
      26,    -1,    -1,    -1,    30,    -1,    -1,    33,    -1,    35,
      -1,    -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    92,    93,    94,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,   107,   108,   109,   110,    -1,   112,   113,   114,    -1,
     116,   117,   118,   119,    -1,   121,   122,   123,   124,   125,
       3,     4,     5,     6,    -1,    -1,     9,    -1,    -1,    12,
      13,    14,    15,    16,    -1,    18,    19,    20,    21,    22,
      -1,    -1,    25,    26,    -1,    -1,    -1,    30,    -1,    -1,
      33,    -1,    35,    -1,    -1,    -1,    -1,    -1,    -1,    42,
      -1,     3,     4,     5,     6,    -1,    -1,     9,    -1,    -1,
      12,    13,    14,    15,    16,    -1,    18,    19,    20,    21,
      22,    -1,    65,    25,    26,    -1,    -1,    -1,    30,    -1,
      -1,    33,    -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,
      42,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    92,
      93,    94,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,   107,   108,   109,   110,    70,   112,
     113,   114,    -1,   116,   117,   118,   119,    -1,   121,   122,
     123,   124,   125,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      92,    93,    94,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,   107,   108,   109,   110,   111,
     112,   113,   114,    -1,   116,   117,   118,   119,    -1,   121,
     122,   123,   124,   125,     3,     4,     5,     6,    -1,    -1,
       9,    -1,    -1,    12,    13,    14,    15,    16,    -1,    18,
      19,    20,    21,    22,    -1,    -1,    25,    26,    -1,    -1,
      -1,    30,    -1,    -1,    33,    -1,    -1,    -1,     3,     4,
       5,     6,    -1,    42,     9,    -1,    -1,    12,    13,    14,
      15,    16,    -1,    18,    19,    20,    21,    22,    -1,    -1,
      25,    26,    -1,    -1,    -1,    30,    -1,    -1,    33,    -1,
      -1,    70,    -1,    -1,    -1,    -1,    -1,    42,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    92,    93,    94,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,   107,   108,
     109,   110,   111,   112,   113,   114,    -1,   116,   117,   118,
     119,    -1,   121,   122,   123,   124,   125,    92,    93,    94,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,   107,   108,   109,   110,   111,   112,   113,   114,
      -1,   116,   117,   118,   119,    -1,   121,   122,   123,   124,
     125,     3,     4,     5,     6,    -1,    -1,     9,    -1,    -1,
      12,    13,    14,    15,    16,    -1,    18,    19,    20,    21,
      22,    -1,    -1,    25,    26,    -1,    -1,    -1,    30,    -1,
      -1,    33,    -1,    35,    -1,     3,     4,     5,     6,    -1,
      42,     9,    -1,    -1,    12,    13,    14,    15,    16,    -1,
      18,    19,    20,    21,    22,    -1,    -1,    25,    26,    -1,
      -1,    -1,    30,    -1,    -1,    33,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    54,    -1,    -1,    -1,
      92,    93,    94,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,   107,   108,   109,   110,    -1,
     112,   113,   114,    -1,   116,   117,   118,   119,    -1,   121,
     122,   123,   124,   125,    92,    93,    94,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    19,    -1,    -1,   107,
     108,   109,   110,    -1,   112,   113,   114,    30,   116,   117,
     118,   119,    35,   121,   122,   123,   124,   125,     3,     4,
       5,     6,    -1,    -1,     9,    -1,    -1,    12,    13,    14,
      15,    16,    -1,    18,    19,    20,    21,    22,    -1,    -1,
      25,    26,    65,    -1,    -1,    30,    -1,    -1,    33,    72,
      -1,    -1,    -1,    76,    -1,    -1,    -1,    42,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    94,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,    -1,   112,
     113,   114,    -1,   116,   117,    -1,    -1,    -1,    -1,    -1,
      -1,   124,   125,    -1,    -1,    -1,    -1,    92,    93,    94,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,   107,   108,   109,   110,    -1,   112,   113,   114,
      -1,   116,   117,   118,   119,    -1,   121,   122,   123,   124,
     125,     4,     5,     6,    -1,    -1,     9,    -1,    -1,    12,
      -1,    -1,    15,    -1,    -1,    18,    19,    20,    21,    22,
      -1,    -1,    25,    26,    -1,    -1,    29,    30,    -1,    -1,
      -1,    -1,    35,    36,    37,    38,    39,    40,    41,    42,
      -1,    44,    45,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    77,    78,    79,    80,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    92,
      93,    94,    95,    96,    -1,    -1,    -1,    -1,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,    -1,   116,   117,   118,   119,    -1,   121,   122,
     123,   124,   125,     4,     5,     6,    -1,    -1,     9,    -1,
      -1,    12,    -1,    -1,    15,    -1,    -1,    18,    19,    20,
      21,    22,    -1,    -1,    25,    26,    -1,    -1,    -1,    30,
      -1,    -1,    -1,    -1,    35,    -1,    -1,    -1,    -1,    -1,
      -1,    42,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    76,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    88,    89,    -1,
      -1,    92,    93,    94,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,   107,   108,   109,   110,
      -1,   112,   113,   114,    -1,   116,   117,   118,   119,    -1,
     121,   122,   123,   124,   125,     4,     5,     6,    -1,    -1,
       9,    -1,    -1,    12,    -1,    -1,    15,    -1,    -1,    18,
      19,    20,    21,    22,    -1,    -1,    25,    26,    -1,    -1,
      -1,    30,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    42,    -1,    -1,     4,     5,     6,    -1,
      -1,     9,    -1,    -1,    12,    -1,    -1,    15,    -1,    -1,
      18,    19,    20,    21,    22,    -1,    65,    25,    26,    -1,
      -1,    -1,    30,    72,    -1,    -1,    -1,    76,    -1,    -1,
      -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    92,    93,    94,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,   107,   108,
     109,   110,    -1,   112,   113,   114,    -1,   116,   117,   118,
     119,    -1,   121,   122,   123,   124,   125,    -1,    -1,    -1,
      -1,    89,    -1,    -1,    92,    93,    94,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    19,    -1,    -1,   107,
     108,   109,   110,    -1,   112,   113,   114,    30,   116,   117,
     118,   119,    35,   121,   122,   123,   124,   125,     4,     5,
       6,    -1,    -1,     9,    -1,    -1,    12,    -1,    -1,    15,
      -1,    -1,    18,    19,    20,    21,    22,    -1,    -1,    25,
      26,    -1,    65,    -1,    30,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    76,    -1,    -1,    42,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    94,    19,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    30,    -1,    -1,   109,   110,    35,   112,
     113,   114,    -1,   116,   117,    42,    -1,    -1,    -1,    -1,
      -1,   124,   125,    -1,    -1,    -1,    92,    93,    94,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    65,    -1,
      -1,   107,   108,   109,   110,    72,   112,   113,   114,    76,
     116,   117,   118,   119,    19,   121,   122,   123,   124,   125,
      -1,    -1,    -1,    -1,    -1,    30,    -1,    94,    -1,    -1,
      35,    -1,    -1,    -1,    -1,   102,   103,    42,    -1,    -1,
      -1,    -1,   109,   110,    -1,   112,   113,   114,    -1,   116,
     117,    -1,    -1,    19,    -1,    -1,    -1,   124,   125,    -1,
      65,    -1,    -1,    -1,    30,    -1,    -1,    -1,    -1,    35,
      19,    76,    -1,    -1,    -1,    -1,    42,    -1,    -1,    -1,
      -1,    30,    -1,    -1,    -1,    -1,    35,    -1,    -1,    94,
      -1,    -1,    -1,    42,    -1,    -1,    -1,   102,   103,    65,
      -1,    -1,    -1,    -1,   109,   110,    -1,   112,   113,   114,
      76,   116,   117,    -1,    -1,    -1,    65,    -1,    -1,   124,
     125,    -1,    -1,    19,    -1,    -1,    -1,    76,    94,    -1,
      -1,    -1,    -1,    -1,    30,    -1,   102,   103,    -1,    35,
      -1,    -1,    -1,   109,   110,    94,   112,   113,   114,    -1,
     116,   117,    -1,   102,   103,    19,    -1,    -1,   124,   125,
     109,   110,    -1,   112,   113,   114,    30,   116,   117,    65,
      -1,    35,    -1,    -1,    -1,   124,   125,    -1,    42,    19,
      76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      30,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    94,    -1,
      -1,    65,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    76,   109,   110,    -1,   112,   113,   114,    -1,
     116,   117,    -1,    -1,    -1,    65,    -1,    -1,   124,   125,
      94,    -1,    72,    -1,    -1,    -1,    76,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,    -1,   112,   113,
     114,    -1,   116,   117,    94,    -1,    -1,    -1,    -1,    -1,
     124,   125,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,    -1,   112,   113,   114,    -1,   116,   117,     7,    -1,
      -1,    10,    11,    -1,   124,   125,    -1,    -1,    17,    -1,
      -1,    -1,    -1,    -1,    23,    24,    -1,    -1,    27,    28,
      29,    -1,    31,    32,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    -1,    44,    45,    -1,    -1,    -1,
      -1,    -1,    -1,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    70,    -1,    -1,    -1,    -1,    75,    76,    77,    78,
      79,    80,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    95,    96,    97,    98,
      99,    -1,    -1,    -1,    -1,   104,   105,   106,    29,    -1,
      -1,    -1,   111,    -1,    35,    36,    37,    38,    39,    40,
      41,    -1,    -1,    44,    45,    -1,    -1,    -1,    -1,    -1,
      -1,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    70,
      71,    72,    -1,    74,    75,    76,    77,    78,    79,    80,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    95,    96,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   104,   105,   106,    29,    -1,    -1,    -1,
     111,    -1,    35,    36,    37,    38,    39,    40,    41,    -1,
      -1,    44,    45,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    70,    -1,    72,
      -1,    74,    75,    76,    77,    78,    79,    80,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    95,    96,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   104,   105,   106,    29,    -1,    -1,    -1,   111,    -1,
      35,    36,    37,    38,    39,    40,    41,    -1,    -1,    44,
      45,    -1,    -1,    -1,    -1,    -1,    29,    52,    -1,    -1,
      -1,    -1,    35,    36,    37,    38,    39,    40,    41,    -1,
      65,    44,    45,    -1,    -1,    -1,    -1,    -1,    73,    52,
      75,    76,    77,    78,    79,    80,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      95,    96,    75,    76,    77,    78,    79,    80,    -1,   104,
     105,   106,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,
      -1,    -1,    95,    96,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   104,   105,   106,    29,    -1,    -1,    -1,   111,    -1,
      35,    36,    37,    38,    39,    40,    41,    -1,    -1,    44,
      45,    -1,    -1,    -1,    -1,    -1,    29,    52,    -1,    -1,
      -1,    -1,    35,    36,    37,    38,    39,    40,    41,    -1,
      65,    44,    45,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      75,    76,    77,    78,    79,    80,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    88,    -1,    -1,    -1,    70,    -1,    -1,
      95,    96,    75,    76,    77,    78,    79,    80,    -1,   104,
     105,   106,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,
      -1,    -1,    95,    96,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   104,   105,   106,    29,    -1,    -1,    -1,   111,    -1,
      35,    36,    37,    38,    39,    40,    41,    -1,    -1,    44,
      45,    -1,    -1,    -1,    -1,    -1,    -1,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    77,    78,    79,    80,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      95,    96,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,
     105,   106,    29,    -1,    -1,    -1,   111,    -1,    35,    36,
      37,    38,    39,    40,    41,    -1,    -1,    44,    45,    -1,
      -1,    -1,    -1,    -1,    29,    52,    -1,    -1,    -1,    -1,
      35,    36,    37,    38,    39,    40,    41,    -1,    65,    44,
      45,    -1,    -1,    70,    -1,    -1,    -1,    52,    75,    76,
      77,    78,    79,    80,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    95,    96,
      75,    76,    77,    78,    79,    80,    -1,   104,   105,   106,
      -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,    -1,    -1,
      95,    96,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,
     105,   106,    29,    -1,    -1,    -1,   111,    -1,    35,    36,
      37,    38,    39,    40,    41,    -1,    -1,    44,    45,    -1,
      -1,    -1,    -1,    -1,    29,    52,    -1,    -1,    -1,    -1,
      35,    36,    37,    38,    39,    40,    41,    -1,    65,    44,
      45,    -1,    -1,    -1,    -1,    -1,    -1,    52,    75,    76,
      77,    78,    79,    80,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    95,    96,
      75,    76,    77,    78,    79,    80,    -1,   104,   105,   106,
      -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,    -1,    -1,
      95,    96,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,
     105,   106,    29,    -1,    -1,    -1,   111,    -1,    35,    36,
      37,    38,    39,    40,    41,    -1,    -1,    44,    45,    -1,
      -1,    -1,    -1,    -1,    -1,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      77,    78,    79,    80,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    95,    96,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,   105,   106,
      -1,    -1,    -1,    -1,   111
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   129,   130,     0,     3,     4,     5,     6,     9,    12,
      13,    14,    15,    16,    18,    19,    20,    21,    22,    25,
      26,    30,    33,    35,    42,    65,    76,    89,    92,    93,
      94,    97,    98,    99,   102,   103,   107,   108,   109,   110,
     111,   112,   113,   114,   116,   117,   118,   119,   121,   122,
     123,   124,   125,   131,   132,   133,   134,   136,   137,   141,
     142,   143,   144,   145,   146,   147,   148,   150,   151,   152,
     153,   154,   155,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   166,   167,   168,   169,   170,   171,   172,
     173,   174,   183,   213,   214,   215,   216,   217,   218,   219,
     220,   221,   288,   289,   294,   295,   306,    35,    42,    70,
     192,   287,   288,   215,   218,   220,   148,   213,   220,   134,
     142,   314,   314,    67,   315,    67,   315,    42,    65,    76,
     204,   205,   206,   207,   208,   209,   210,   211,   213,   220,
     204,   213,   220,    42,   149,   150,   163,   167,   168,   169,
     172,   213,   220,    42,   150,   163,   167,   168,   169,   172,
     213,   220,   149,   169,   150,   168,   169,   149,   315,   150,
     168,   315,   149,   150,   168,   149,   163,   150,   163,   168,
      65,   149,   167,   150,   167,   168,   192,   287,   311,   309,
      65,    72,   223,   225,   309,    65,    89,    65,    35,    42,
     184,   185,    70,    70,   192,   288,    66,    66,    66,   213,
     220,    70,   111,   141,   145,   146,   147,   148,   237,   286,
     287,    89,   286,    89,    65,   223,    42,    65,   208,   210,
     212,    65,   148,   207,   210,   307,   307,   307,   307,   307,
     307,   307,   307,   307,   307,    89,    89,    29,    35,    36,
      37,    38,    39,    40,    41,    44,    45,    52,    65,    75,
      76,    77,    78,    79,    80,    95,    96,   104,   105,   106,
     111,   146,   148,   156,   158,   160,   162,   166,   193,   246,
     247,   248,   249,   250,   251,   252,   253,   254,   255,   256,
     257,   258,   259,   261,   262,   263,   264,   265,   266,   267,
     268,   269,   270,   271,   272,   273,   274,   275,   276,   277,
     278,   279,   280,   281,   284,   311,   192,   311,    70,   311,
      73,   261,   280,   285,    72,    65,   247,   310,   310,    67,
      71,   184,   184,    70,   223,   223,   115,   135,   231,   232,
     233,    65,    76,   213,   218,    65,    76,   213,   213,    70,
     141,   213,   204,   311,   212,    66,    66,   223,   212,    65,
     207,   210,   295,   296,   296,   296,   296,    65,   261,    65,
     261,   261,    35,   193,   284,   311,    65,    65,    65,   269,
      65,    76,   222,   223,   226,   227,   222,    66,    36,    43,
      44,    45,    65,    72,    74,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    90,   282,    65,   261,   269,
      76,    81,    82,    77,    78,    46,    47,    48,    49,    83,
      84,    50,    51,    75,    85,    86,    52,    53,    87,    66,
      67,    70,   311,    70,   175,    35,   145,   146,   147,   148,
     157,   158,   187,   188,   189,   190,   191,   224,    73,   285,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    91,    92,    93,    94,    95,    96,    97,
      98,    99,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   290,   291,   293,    66,
      90,   186,   186,    71,   185,    67,    71,    67,    71,   184,
      35,   234,   312,   235,   233,    65,   218,    65,   148,   148,
     307,   307,   135,   308,   308,    66,   223,   223,    66,    66,
     212,   286,   286,   286,   286,   193,   193,    66,    66,    70,
     230,   193,   193,   281,   223,   226,   227,   148,   222,   192,
      66,   260,   281,   284,   192,   281,   193,   269,   269,   269,
     270,   270,   271,   271,   272,   272,   272,   272,   273,   273,
     274,   275,   276,   277,   278,    88,   284,   281,   175,    70,
     175,    89,   146,   148,   176,   177,   178,   312,   309,    65,
      76,   207,   213,   222,   207,   213,   222,    65,    76,   213,
     222,   213,   222,    67,    67,   313,   313,    73,    66,    67,
      65,   292,   285,    71,    71,    67,    71,    67,    89,    71,
       7,    10,    11,    17,    23,    24,    27,    28,    31,    32,
      34,    35,    42,   111,   138,   139,   140,   141,   145,   146,
     147,   148,   192,   228,   229,   230,   236,   238,   239,   240,
     241,   242,   243,   244,   245,   283,   284,   297,   306,    65,
     312,   296,   296,    66,    90,   194,   194,   194,   194,    66,
      66,    70,   269,   231,   312,    67,    67,    67,    66,    66,
      66,   222,    66,    67,    73,    66,   280,    88,   312,   175,
     312,    88,    89,   179,   182,   204,    89,   180,   182,   213,
      67,    89,    67,    89,    71,   148,   307,   307,   307,   307,
     148,   307,   307,    54,   189,   191,    66,    66,    66,   293,
      66,   260,    71,    35,    89,    65,   285,   283,    89,    65,
      88,    76,   192,   228,    65,    65,   314,   314,   213,   220,
     213,   220,   213,   220,   213,   220,    88,    89,    28,    65,
     150,    71,   286,   286,    35,    70,    72,    74,   195,   196,
     199,   200,   201,   202,   203,   281,   197,   198,   235,    66,
     252,   193,   193,   223,   281,   280,    71,   312,    71,   285,
     286,   181,   182,   286,   181,   180,   179,   286,   286,   286,
     286,   286,   286,   292,    66,   284,    54,    88,    89,   283,
     228,   284,    89,    34,   284,   284,    70,   237,   307,   307,
     307,   307,   307,   307,   307,   307,   286,    65,   247,   298,
      65,   194,   194,    88,   198,   285,    35,    42,   196,    72,
      90,   201,    71,   195,    71,    66,    66,    66,    71,   286,
     286,    66,   285,   228,    89,    89,    65,    66,    66,   231,
      70,   228,   247,   304,    88,    66,   298,    71,   195,    54,
      73,   285,    67,   228,    88,   283,   284,   228,   228,   235,
     231,    88,    66,    72,   247,   299,   300,   301,    89,    66,
      71,   285,    54,    73,   228,    89,    66,     8,   312,   235,
     299,    89,   293,    65,    88,    67,    89,    73,   285,   283,
      89,   228,    71,   312,    88,    73,   284,   299,   301,    73,
      66,    71,   299,   247,    66,    88,   228,    88,    65,   247,
     303,   302,   303,   284,    67,    88,    66,   247,   191,   305,
      67,   191
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* This macro is provided for backward compatibility. */

#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  YYSIZE_T yysize1;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = 0;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
                if (! (yysize <= yysize1
                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                  return 2;
                yysize = yysize1;
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  yysize1 = yysize + yystrlen (yyformat);
  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
    return 2;
  yysize = yysize1;

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
      

/* Line 1806 of yacc.c  */
#line 3309 "c.tab.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



