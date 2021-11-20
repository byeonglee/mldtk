package xtc.lang.blink.agent;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import xtc.lang.blink.agent.JNIFunction.ExtraArgumentType;
import xtc.lang.blink.agent.JNIFunction.JNIAnnotatedType;
import xtc.lang.blink.agent.JNIType.CStringType;
import xtc.lang.blink.agent.JNIType.JFieldIDType;
import xtc.lang.blink.agent.JNIType.JMethodIDType;
import xtc.lang.blink.agent.JNIType.PointerType;
import xtc.lang.blink.agent.JNIType.PrimitiveType;
import xtc.lang.blink.agent.JNIType.ReferenceType;

/**
 * A JNI Function proxy generator.
 *
 * @author Byeong Lee
 */
public final class GenerateJNIFunctionProxy implements JNIConstants {

  private static void usage(String reason) {
    if (reason != null) {
      System.out.println(reason);
    }
    System.out.println(
        "usage: " +  GenerateJNIFunctionProxy.class.getName() + " [options]\n"
        + "options:"
        + " -help               show help message.\n"
        + " -o <output file>    specify the C source file\n"
    );
    System.exit(-1);
  }

  /**
   * @param args The command line arguments.
   */
  public static void main(String[] args) {
    String outputSourceFileName = null;
    for(int i = 0;i < args.length;i++) {
      if (args[i].equals("-help")) {
    	  usage(null);
      } else if (args[i].equals("-o") ) {
        if ((i + 1) < args.length) {
          outputSourceFileName = args[++i];
        } else {
          usage("Please, specify output file after -o");
        }
      }    
    }

    try {
      //generate source file.
      PrintWriter os = new PrintWriter(
          (outputSourceFileName == null) ? System.out : new FileOutputStream(
              outputSourceFileName));
      GenerateJNIFunctionProxy p = new GenerateJNIFunctionProxy(os);
      p.gen();
      os.flush();
      os.close();
    } catch (IOException e) {
      System.err.println("Can not recover from the input or output fault");
    }
  }

  /** Output stream for the generated JNI function proxy source code. */
  private final PrintWriter w;
  private final ArrayList<ProxyGenerator> pgs;
  
  private GenerateJNIFunctionProxy(PrintWriter w) {
    this.w = w;
    this.pgs = new ArrayList<ProxyGenerator>();
    for(JNIFunction proxyFunction: JNIFunction.jniFunctionList) {
      String fname = proxyFunction.name;
      ProxyGenerator pg;
      
      if (proxyFunction.extraArgType == ExtraArgumentType.DOT_DOT_DOT) {
        String targetName = fname + "V";
        final JNIFunction targetFunction = JNIFunction.jniFunctionMap.get(targetName);
        assert targetFunction != null;
        pg = new VariableArgProxyGenerator(proxyFunction, targetFunction);
      } else {
        pg = new FixedArgProxyGenerator(proxyFunction);
      }
      pgs.add(pg);
    }
  }

  private void gen() throws IOException{
    genHeaders();
    genStatDefinitions();
    for (final ProxyGenerator pg: pgs) {
      pg.genFuncDef(w);
    }
    genProxyInstall();
  }

  private void genHeaders() throws IOException{
    String[] headers = {
      "<string.h>", "<assert.h>", "<jni.h>", "<jvmti.h>", 
      "\"agent_main.h\"",
      "\"state.h\"", "\"util.h\"", "\"agent.h\"",
      "\"options.h\"", "\"jnicheck.h\"",
      "\"classfile_constants.h\"",
    };
    w.printf("/* This source file is generated by %s.java\n", GenerateJNIFunctionProxy.class.getSimpleName());
    w.printf("Please, do not edit manually.*/\n");
    for(final String h: headers) {
      w.printf("#include %s\n", h);
    }
    w.printf("\n");
  }

  private void genStatDefinitions() throws IOException {
    w.printf("static jniNativeInterface* proxy_jni_funcs = NULL;\n");
  }

  private void genProxyInstall() throws IOException {
    w.printf("void bda_c2j_proxy_install(jvmtiEnv *jvmti)\n");
    w.printf("{\n");
    w.printf("  jvmtiError err;\n");
    w.printf("  err = (*jvmti)->GetJNIFunctionTable(jvmti, &proxy_jni_funcs);\n");
    w.printf("  assert(err == JVMTI_ERROR_NONE);\n");
    for(final ProxyGenerator p : pgs) {
      w.printf("  proxy_jni_funcs->%s = %s;\n", p.getJNIFuncName(), p.getProxyFuncName());
    }
    w.printf("  err = (*jvmti)->SetJNIFunctionTable(jvmti, proxy_jni_funcs);\n");
    w.printf("  assert(err == JVMTI_ERROR_NONE);\n");
    w.printf("}\n");
  }


  private static class FormalArgument {
    final JNIAnnotatedType type;
    final String varName;
    public FormalArgument(JNIAnnotatedType type, String varName) {
      this.type = type;
      this.varName = varName;
    }
  }

  private static abstract class ProxyGenerator {

    protected final JNIFunction wrapperJNIFunction;

    protected final FormalArgument[] fargs;

    protected final JNIFunction targetJNIFunction;

    ProxyGenerator(JNIFunction proxyFunction, JNIFunction targetFunction) {
      this.wrapperJNIFunction = proxyFunction;
      this.targetJNIFunction = targetFunction;

      this.fargs = new FormalArgument[proxyFunction.argumenTypes.length];
      JNIAnnotatedType[] arguments = proxyFunction.argumenTypes;
      assert arguments.length > 0 && arguments[0].jniType == JNI_ENV;
      fargs[0] = new FormalArgument(arguments[0], "env");
      for(int i = 1;i < arguments.length;i++) {
        fargs[i] = new FormalArgument(arguments[i], "p" + i);
      }
    }

    String getJNIEnvName() {
      assert fargs[0].type.jniType == JNI_ENV;
      return fargs[0].varName;
    }

    String getJNIFuncName() {
      return this.wrapperJNIFunction.name;
    }

    String getProxyFuncName() {
      return "bda_c2j_proxy_" + getJNIFuncName();
    }


    FormalArgument findMethodIDVariable() {
      for(FormalArgument a: fargs) {
        if (a.type.jniType == JNIConstants.JMETHODID) {
          return a;
        }
      }
      return null;
    }

    private void ensureFormalTypes(JNIType ... types) {
      for(int i=0; i <types.length;i++) {
        assert fargs[i].type.jniType == types[i];
      }
    }

    static final Pattern pGetField =  Pattern.compile("(Get|Set)(Static|)(Object|Boolean|Byte|Char|Short|Int|Long|Float|Double)Field");

    private void genJNICheckFieldID(PrintWriter w, FormalArgument f, int i) {
      final String jniFuncName = getJNIFuncName();
      final Matcher m = pGetField.matcher(wrapperJNIFunction.name);

      if (wrapperJNIFunction == JNIFunction.ToReflectedField) {
        w.printf("    && bda_check_jfieldid_to_reflected_field(%s, %s, %s, %s, \"%s\")\n", 
                 "s", fargs[1].varName, fargs[2].varName, fargs[3].varName, 
                 jniFuncName);
      } else if (m.matches()) {
        boolean getter = m.group(1).equals("Get");
        boolean isStatic = m.group(2).equals("Static");
        String fieldType = m.group(3);
        if (!isStatic) {
          if (getter) {
            w.printf("    && bda_check_jfieldid_get_instance(s, %s, %s, '%s', \"%s\")\n", 
                     fargs[1].varName, fargs[2].varName, getFieldDescFromType(fieldType), jniFuncName);
          } else {
            w.printf("    && bda_check_jfieldid_set_instance(s, %s, %s, v, '%s', \"%s\")\n", 
                     fargs[1].varName, fargs[2].varName, getFieldDescFromType(fieldType), jniFuncName);
          }
        } else {
          if (getter) {
            w.printf("    && bda_check_jfieldid_get_static(s, %s, %s, '%s', \"%s\")\n", 
                     fargs[1].varName, fargs[2].varName, getFieldDescFromType(fieldType), jniFuncName);
          } else {
            w.printf("    && bda_check_jfieldid_set_static(s, %s, %s, v, '%s', \"%s\")\n", 
                     fargs[1].varName, fargs[2].varName, getFieldDescFromType(fieldType), jniFuncName);
          }
        }

      } else {
        assert wrapperJNIFunction.name.equals("ToReflectedField");
      }
    }
    
    private static final Pattern jniNewObjectXPattern = Pattern.compile("NewObject(|V|A)");
    private static final Pattern jniCallXXXMethodXPattern = Pattern.compile("Call(|Nonvirtual|Static)(Object|Boolean|Byte|Char|Short|Int|Long|Float|Double|Void)Method(|V|A)");
      
    private void genJNICheckMethodID(PrintWriter w, FormalArgument f, int i) {
      String jniFuncName = getJNIFuncName();
      Matcher m;
      if (wrapperJNIFunction == JNIFunction.ToReflectedMethod) {
        w.printf("    && bda_check_jmethodid_to_reflected(%s, %s, %s, %s, \"%s\")\n", 
            "s", fargs[1].varName, fargs[2].varName, fargs[3].varName, 
            jniFuncName);
      } else if ((m = jniNewObjectXPattern.matcher(jniFuncName)).matches()) {
        String argPass = m.group(1);
        if (argPass.equals("")) {
          w.printf("    && bda_check_jmethodid_new_object(%s, %s, %s, awrap, \"%s\")\n", 
              "s", fargs[1].varName, fargs[2].varName, jniFuncName);
        } else if (argPass.equals("V")) {
          w.printf("    && bda_check_jmethodid_new_object(%s, %s, %s, %s, \"%s\")\n", 
              "s", fargs[1].varName, fargs[2].varName, "awrap", 
              jniFuncName);
        } else if (argPass.equals("A")) {
          w.printf("    && bda_check_jmethodid_new_object(%s, %s, %s, %s, \"%s\")\n", 
              "s", fargs[1].varName, fargs[2].varName, "awrap", 
              jniFuncName);
        } else {
          assert false ;
        }
      } else if ((m = jniCallXXXMethodXPattern.matcher(jniFuncName)).matches()){
        String methodType = m.group(1);
        String returnType = m.group(2); 
        String argPass = m.group(3);

        if (argPass.equals("")) {
          if (methodType.equals("")) {
            w.printf("    && bda_check_jmethodid_instance(%s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else if (methodType.equals("Nonvirtual")) {
            w.printf("    && bda_check_jmethodid_nonvirtual(%s, %s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, fargs[3].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else if (methodType.equals("Static")) {
            w.printf("    && bda_check_jmethodid_static(%s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else {
            assert false;
          }
        } else if (argPass.equals("V")) {
          if (methodType.equals("")) {
            w.printf("    && bda_check_jmethodid_instance(%s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else if (methodType.equals("Nonvirtual")) {
            w.printf("    &&  bda_check_jmethodid_nonvirtual(%s, %s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, fargs[3].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else if (methodType.equals("Static")) {
            w.printf("    &&  bda_check_jmethodid_static(%s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else {
            assert false;
          }
        } else if (argPass.equals("A")) {
          if (methodType.equals("")) {
            w.printf("    && bda_check_jmethodid_instance(%s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else if (methodType.equals("Nonvirtual")) {
            w.printf("    && bda_check_jmethodid_nonvirtual(%s, %s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, fargs[3].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else if (methodType.equals("Static")) {
            w.printf("    && bda_check_jmethodid_static(%s, %s, %s, %s, \"%s\", '%s')\n",
                     "s", fargs[1].varName, fargs[2].varName, "awrap",
                     jniFuncName, getFieldDescFromType(returnType));
          } else {
            assert false;
          }
        } else {
          assert false;
        }
      } else {
        assert false : "Not reachable with " + jniFuncName;
      }
    }
    
    static final String getMethodIDCheckerPrefix(String type) {
      if (type.equals("")) {
        return "bda_check_jmethodid_instance_check";
      } else if (type.equals("Nonvirtual")) {
        return "bda_check_jmethodid_nonvirtual_check";
      } else if (type.equals("Static")) {
        return "bda_check_jmethodid_static_check";
      } else {
        assert false;
        return "";
      }
    }

    static final HashMap<String,String> type2fieldDesc = new HashMap<String,String>();
    {
      type2fieldDesc.put("Boolean", "Z");
      type2fieldDesc.put("Byte", "B");
      type2fieldDesc.put("Char", "C");
      type2fieldDesc.put("Short", "S");
      type2fieldDesc.put("Int", "I");
      type2fieldDesc.put("Long", "J");
      type2fieldDesc.put("Float", "F");
      type2fieldDesc.put("Double", "D");
      type2fieldDesc.put("Object", "O");
      type2fieldDesc.put("Void", "V");
    }

  static String getFieldDescFromType(String s) {
    String fdesc = type2fieldDesc.get(s);
    assert fdesc != null;
    return fdesc;
  }

  static final HashMap<String,String> type2jvalueFieldName = new HashMap<String,String>();
    {
      type2jvalueFieldName.put("Boolean", "z");
      type2jvalueFieldName.put("Byte", "b");
      type2jvalueFieldName.put("Char", "c");
      type2jvalueFieldName.put("Short", "s");
      type2jvalueFieldName.put("Int", "i");
      type2jvalueFieldName.put("Long", "j");
      type2jvalueFieldName.put("Float", "f");
      type2jvalueFieldName.put("Double", "d");
      type2jvalueFieldName.put("Object", "l");
    }

    static final String getJValueFieldFromType(String type) {
      String fname = type2jvalueFieldName.get(type);
      assert fname != null;
      return fname;
    }

    private static String getCformatStringFor(JNIType type) {
      if (type instanceof PrimitiveType) {
        PrimitiveType ptype = (PrimitiveType)type;
        if (ptype == JNIConstants.JBOOLEAN) {
          return "%d";
        } else if (ptype == JNIConstants.JBYTE) {
          return "%d";
        } else if (ptype == JNIConstants.JCHAR) {
          return "%d";
        } else if (ptype == JNIConstants.JSHORT) {
          return "%d";
        } else if (ptype == JNIConstants.JINT) {
          return "%d";
        } else if (ptype == JNIConstants.JLONG) {
          return "%lld";
        } else if (ptype == JNIConstants.JFLOAT) {
          return "%f";
        } else if (ptype == JNIConstants.JDOUBLE) {
          return "%lf";
        } else if (ptype == JNIConstants.JSIZE) {
          return "%d";
        } else if (ptype == JNIConstants.JOBJECT_REF_TYPE) {
          return "%d";
        } else {
          assert false;
          return "";
        }
      } else if ((type instanceof ReferenceType) 
            ||(type instanceof JMethodIDType)
            ||(type instanceof JFieldIDType)) {
          return "%p";
      } else if (type instanceof PointerType) {
        if (type instanceof CStringType) {
          return "%s";
        } else if (type == JNIConstants.JBYTE_CONST_POINTER) {
          return "%s";
        } else {
          return "%p";
        }
      } else {
          assert false;
          return null;
      }
    }

    static class PrintfFormatAndArgument {
      final String fmt;
      final String list;
      public PrintfFormatAndArgument(String fmt, String list) {
        this.fmt = fmt;
        this.list = list;
      }
    }

    PrintfFormatAndArgument getFixedArgumentPrintFormatAndArgumentExpression() {
      StringBuffer fmt = new StringBuffer();
      StringBuffer list = new StringBuffer();
      boolean first = true;
      for(FormalArgument f : fargs) {
        JNIType jnitype = f.type.jniType;
        if (first) { first=false;} else { fmt.append(" ");}
        fmt.append(getCformatStringFor(jnitype));
        fmt.append('(').append(jnitype.name).append(')');
        list.append(", ").append(f.varName);
      }
      return new PrintfFormatAndArgument(fmt.toString(), list.toString());
    }

    void genFuncDef(PrintWriter w) {
      genFuncBegin(w);
      genLocalVariableDeclarations(w);
      genPrologue(w);
      genGetStateInfo(w);
      genStatPrologueBegin(w);
      genJNICheckBefore(w);
      genC2JInfoBefore(w);
      genCallOriginal(w);
      genC2JInfoAfter(w);
      genJNICheckAfter(w);
      genFuncEnd(w);
    }

    void genFuncBegin(PrintWriter w) {
      JNIAnnotatedType[] arguments = wrapperJNIFunction.argumenTypes;
      final String jniFuncName = getJNIFuncName();
      final String returnType = wrapperJNIFunction.returnType.getTypeName();
      // function declaration
      w.printf("\n/* proxy for %s*/\n", jniFuncName);
      w.printf("static %s JNICALL %s(", returnType, getProxyFuncName());
      for(int i = 0;i < arguments.length;i++) {
        w.printf("%s%s %s", i==0? "":", ", fargs[i].type.getTypeName(), fargs[i].varName);
      }
      if (wrapperJNIFunction.extraArgType == ExtraArgumentType.DOT_DOT_DOT) {
        w.printf(", ..."); 
      }
      w.printf(")\n{\n");
    }

    void genLocalVariableDeclarations(PrintWriter w) {
      // local variable declaration
      w.printf("  /* local variables */\n");
      if (wrapperJNIFunction.hasReturnType()) {
        w.printf("  %s result;\n", wrapperJNIFunction.returnType.getTypeName());
      }
      w.printf("  void *fp, *ret_addr, *ret_addr_from_original;\n");
      w.printf("  struct bda_jni_function_frame c2j;\n");
      w.printf("  struct bda_state_info *s;\n");
      w.printf("  enum bda_mode saved_mode;\n");
      w.printf("\n");
    }

    void genPrologue(PrintWriter w) {
      w.printf("  /* Prologue */\n");
      w.printf("  GET_FRAME_POINTER(fp)\n");
      w.printf("  GET_RETURN_ADDRESS(ret_addr);\n");
      w.printf("\n");
    }

    void genGetStateInfo(PrintWriter w) {
      w.printf("  /* Obtain a state variable for the current thraed. */\n");
      // if (wrapperJNIFunction == JNIFunction.ReleaseStringCritical
      //     || wrapperJNIFunction == JNIFunction.ReleasePrimitiveArrayCritical) {
      //   w.printf("  s = bda_state_find(%s);\n", getJNIEnvName());
      // } else {
        w.printf("  s = bda_get_state_info(%s);\n", getJNIEnvName());
        //}
    }

    void genStatPrologueBegin(PrintWriter w) {
      w.printf("  /* Update call counts. */\n");
      w.printf("  if (s != NULL){\n");  
      w.printf("    saved_mode = s->mode;\n");
      w.printf("  }\n");
      w.printf("\n");
    }

    void genJNICheckBefore(PrintWriter w) {
      final String jniFuncName = getJNIFuncName();
      final String jniEnvName = getJNIEnvName();
      boolean exceptionCheck = !wrapperJNIFunction.isExceptionOblivious();
      Matcher m;
    
      // check the validity of incoming arguments.
      w.printf("  /* Check the JNI Function call. */\n");
      w.printf("  if (bda_jvmti && agent_options.jinn && (s != NULL) && (s->mode != JVM) && !bda_is_in_jdwp_region(ret_addr)) {\n");
      w.printf("    int success;");
      if ((m = jniNewObjectXPattern.matcher(jniFuncName)).matches()) {
        String argPass = m.group(1);
        w.printf("    struct bda_var_arg_wrap awrap;\n");
        if (argPass.equals("")) {
          w.printf("    va_start(awrap.value.ap, %s);\n", fargs[fargs.length-1].varName);
          w.printf("    awrap.type = BDA_VA_LIST;\n");
        } else if (argPass.equals("V")) {
          w.printf("    awrap.type = BDA_VA_LIST;\n");
          w.printf("    va_copy(awrap.value.ap, %s);\n", fargs[3].varName);
        } else if (argPass.equals("A")) {
          w.printf("    awrap.type = BDA_JARRAY;\n");
          w.printf("    awrap.value.array = %s;\n", fargs[3].varName);
        }
      } else if ((m = jniCallXXXMethodXPattern.matcher(jniFuncName)).matches()){
        String methodType = m.group(1);
        String returnType = m.group(2); 
        String argPass = m.group(3);
        w.printf("    struct bda_var_arg_wrap awrap;\n");
        if (argPass.equals("")) {
          w.printf("    va_start(awrap.value.ap, %s);\n", fargs[fargs.length-1].varName);
          w.printf("    awrap.type = BDA_VA_LIST;\n");
        } else if (argPass.equals("V")) {
          w.printf("    awrap.type = BDA_VA_LIST;\n");
          if (methodType.equals("")) {
            w.printf("     va_copy(awrap.value.ap, %s);\n", fargs[3].varName);
          } else if (methodType.equals("Nonvirtual")) {
            w.printf("     va_copy(awrap.value.ap, %s);\n", fargs[4].varName);
          } else if (methodType.equals("Static")) {
            w.printf("     va_copy(awrap.value.ap, %s);\n", fargs[3].varName);
          } else {
            assert false;
          }
        } else if (argPass.equals("A")) {
          w.printf("    awrap.type = BDA_JARRAY;\n");
          if (methodType.equals("")) {
            w.printf("    awrap.value.array = %s;\n", fargs[3].varName);
          } else if (methodType.equals("Nonvirtual")) {
            w.printf("    awrap.value.array = %s;\n", fargs[4].varName);
          } else if (methodType.equals("Static")) {
            w.printf("    awrap.value.array = %s;\n", fargs[3].varName);
          } else {
            assert false;
          }
        } else {
          assert false;
        }
      } else if ( (m = pGetField.matcher(jniFuncName)).matches()) {
                boolean getter = m.group(1).equals("Get");
        boolean isStatic = m.group(2).equals("Static");
        String fieldType = m.group(3);
        if (!isStatic) {
          if (!getter) {
            w.printf("         jvalue v;\n");
            w.printf("         v.%s = %s;\n", getJValueFieldFromType(fieldType), fargs[3].varName);
          }
        } else {
          if (!getter) {
            w.printf("         jvalue v;\n");
            w.printf("         v.%s = %s;\n", getJValueFieldFromType(fieldType), fargs[3].varName);
          }
        }
      }

      w.printf("\n");

      // Check JVM state
      w.printf("    success = 1 \n");
      w.printf("    && bda_check_env_match(s, %s, \"%s\")\n", jniEnvName, jniFuncName);
    
      if (exceptionCheck) {
        w.printf("    && bda_check_no_exeception(s, \"%s\")\n", jniFuncName);
      }

      if (wrapperJNIFunction == JNIFunction.PopLocalFrame) {
        w.printf("    && bda_check_local_frame_double_free(s)\n");
      }

      if (!jniFuncName.matches("(Get|Release)(String|PrimitiveArray)Critical")) {
        w.printf("    && bda_check_no_critical(s, \"%s\")\n", jniFuncName);
      }

      // Check parameters
      for(int i = 1; i < fargs.length;i++) {
        final FormalArgument f = fargs[i];
        final JNIAnnotatedType t = f.type;
        if (t.nonNull) {
          w.printf("    && bda_check_non_null(s, %s,  %d, \"%s\")\n", f.varName, i, jniFuncName);
        }
      }

      // JNI reference type.
      if (exceptionCheck) {
        for(int i = 1; i < fargs.length;i++) {
          final FormalArgument f = fargs[i];
          final JNIAnnotatedType t = f.type;
          
          if (t.jniType instanceof ReferenceType){
            w.printf("    && bda_check_ref_dangling(s, %s, %d, \"%s\")\n", f.varName, i, jniFuncName);
            if  (t.jniType != JOBJECT) {
              w.printf("    && bda_check_%s(s, %s, %d, \"%s\")\n", t.jniType.name, f.varName, i, jniFuncName);
            }
          }
        }
      } else {
        for(int i = 1; i < fargs.length;i++) {
          final FormalArgument f = fargs[i];
          final JNIAnnotatedType t = f.type;
          
          if (t.jniType instanceof ReferenceType){
            w.printf("    && (bda_orig_jni_funcs->ExceptionCheck(env) || bda_check_ref_dangling(s, %s, %d, \"%s\"))\n", 
                     f.varName, i, jniFuncName);
            if  (t.jniType != JOBJECT) {
              w.printf("    && (bda_orig_jni_funcs->ExceptionCheck(env) || bda_check_%s(s, %s, %d, \"%s\"))\n", 
                       t.jniType.name, f.varName, i, jniFuncName);
            }
          }
        }
      }

      if (jniFuncName.equals("DefineClass")) {
        w.printf("    && bda_check_assignable_jobject_jclass(s, %s, bda_clazz_classloader, %d, \"%s\")\n", 
                 fargs[2].varName, 2, jniFuncName);
      } else if (jniFuncName.equals("FromReflectedMethod")) {
        w.printf("    && bda_check_jobject_reflected_method(s, %s, %d, \"%s\")\n",
                 fargs[1].varName, 1, jniFuncName);
      } else if (jniFuncName.equals("FromReflectedField")) {
        w.printf("    && bda_check_instance_jobject_jclass(s, %s, bda_clazz_field, %d, \"%s\")\n",
                 fargs[1].varName, 1, jniFuncName);
      } else if (jniFuncName.equals("DeleteGlobalRef")) {
        w.printf("    && bda_check_jobject_ref_type(s, %s, JNIGlobalRefType, %d, \"%s\")\n",
                 fargs[1].varName, 1, jniFuncName);
      } else if (jniFuncName.equals("DeleteWeakGlobalRef")) {
        w.printf("    && bda_check_jobject_ref_type(s, %s, JNIWeakGlobalRefType , %d, \"%s\")\n",
                 fargs[1].varName, 1, jniFuncName);
      } else if (jniFuncName.equals("DeleteLocalRef")) {
        w.printf("    && bda_check_jobject_ref_type(s, %s, JNILocalRefType, %d, \"%s\")\n",
                 fargs[1].varName, 1, jniFuncName);
      } else if (jniFuncName.equals("NewObjectArray")) {
        w.printf("    && bda_check_assignable_jclass_jobject(s, %s, %s, %d, \"%s\")\n",
                 fargs[2].varName, fargs[3].varName, 2, jniFuncName);
      } else if (jniFuncName.equals("SetObjectArrayElement")) {
        w.printf("    && bda_check_assignable_jobjectArray_jobject(s, %s, %s, %d,  \"%s\")\n",
                 fargs[1].varName, fargs[3].varName, 3, jniFuncName);
      } else if (jniFuncName.equals("GetDirectBufferAddress")) {
        w.printf("    && bda_check_assignable_jobject_jclass(s, %s, bda_clazz_nio_buffer, %d, \"%s\")\n",
                 fargs[1].varName, 1, jniFuncName);
      } else if (jniFuncName.equals("GetDirectBufferCapacity")) {
        w.printf("    && bda_check_assignable_jobject_jclass(s, %s, bda_clazz_nio_buffer, %d, \"%s\")\n",
                 fargs[1].varName, 1, jniFuncName);
      } else if (jniFuncName.equals("ThrowNew")) {
        w.printf("    && bda_check_assignable_jclass_jclass(s, %s, bda_clazz_throwable, %d, \"%s\")\n", 
                 fargs[1].varName, 1, jniFuncName);
      } else if (jniFuncName.equals("AllocObject")) {
        w.printf("    && bda_check_jclass_scalar_allocatable(s, %s, %d, \"%s\")\n", 
                  fargs[1].varName, 1, jniFuncName);
      }

      for(int i = 1; i < fargs.length;i++) {
        final FormalArgument f = fargs[i];
        final JNIAnnotatedType t = f.type;        
        if (t.jniType instanceof JFieldIDType) {
          genJNICheckFieldID(w, f, i);
        } else if (t.jniType instanceof JMethodIDType) {
          genJNICheckMethodID(w, f, i);
        }
      }
      // access
      if (jniFuncName.matches("Set(Object|Boolean|Byte|Char|Short|Int|Long|Float|Double)Field")) {
        w.printf("    && bda_check_access_set_instance_field(s, %s, %s, %d, \"%s\")\n", fargs[1].varName, fargs[2].varName, 2, jniFuncName);
      } else if (jniFuncName.matches("SetStatic(Object|Boolean|Byte|Char|Short|Int|Long|Float|Double)Field")) {
        w.printf("    && bda_check_access_set_static_field(s, %s, %s, %d, \"%s\")\n", fargs[1].varName, fargs[2].varName, 2, jniFuncName);
      }

      // resource release
      if (jniFuncName.matches("ReleaseString(|UTF)Chars")) {
        w.printf ("    && bda_check_resource_free(s, %s, \"%s\")\n", fargs[2].varName, jniFuncName);
      } else if (jniFuncName.matches("Release(Boolean|Byte|Char|Short|Int|Long|Float|Double)ArrayElements")) {
        w.printf ("    && bda_check_resource_free(s, %s, \"%s\")\n", fargs[2].varName, jniFuncName);
      } else if (jniFuncName.matches("ReleaseStringCritical;\n")) {
        w.printf ("    && bda_check_resource_free(s, %s, \"%s\")\n", fargs[2].varName, jniFuncName);
      } else if (jniFuncName.matches("ReleasePrimitiveArrayCritical")) {
        w.printf ("    && bda_check_resource_free(s, %s, \"%s\")\n", fargs[2].varName, jniFuncName);
      }
      w.printf("    ;\n"); 

      // return if any pending exception
      if (!wrapperJNIFunction.isExceptionOblivious()) { 
        w.printf("    // Just return if an exception is pending here.\n");
        w.printf("    if ((agent_options.jinn )&& bda_orig_jni_funcs->ExceptionCheck(s->env) == JNI_TRUE){\n");
        w.printf("      s->mode = saved_mode;\n");
        if (wrapperJNIFunction.hasReturnType()) {
          w.printf("      return 0;\n");
        } else {
          w.printf("      return;\n");
        }
        w.printf("    }\n");
      } else {
        w.printf("    // Just return if an exception is pending here.\n");
        w.printf("    if ((agent_options.jinn)&& !success){\n");
        w.printf("      s->mode = saved_mode;\n");
        if (wrapperJNIFunction.hasReturnType()) {
          w.printf("      return 0;\n");
        } else {
          w.printf("      return;\n");
        }
        w.printf("    }\n");
      }

      // prologue action
      w.printf("  }\n");


      w.printf("\n");
    }

    void genC2JInfoBefore(PrintWriter w) {
      final String proxy_name = getProxyFuncName();
      w.printf("  /* Push the jni_function_frame structure. */\n");
      w.printf("  if (s != NULL) {\n");
      w.printf("#if defined(__GNUC__)\n");
      w.printf("    ret_addr_from_original = &&L_RETURN;\n");
      w.printf("#else\n");
      w.printf("    ret_addr_from_original = %s;\n", proxy_name);
      w.printf("#endif\n");
      w.printf("    c2j.return_addr = ret_addr_from_original;\n");
      w.printf("    c2j.caller_fp = fp;\n");  
      w.printf("    c2j.jdwp_context =  bda_is_in_jdwp_region(ret_addr);\n");
      w.printf("    c2j.call_type = %s;\n", wrapperJNIFunction.fclass.name());
      switch(wrapperJNIFunction.fclass) {
        case JNI_CALL_INSTANCE:
          ensureFormalTypes(JNI_ENV, JOBJECT, JMETHODID);
          w.printf("    c2j.object = %s;\n",fargs[1].varName);
          w.printf("    c2j.class = %s;\n",  "NULL");
          w.printf("    c2j.mid = %s;\n", fargs[2].varName); 
          break;
        case JNI_CALL_STATIC:
          ensureFormalTypes(JNI_ENV, JCLASS, JMETHODID);
          w.printf("    c2j.object = %s;\n", "NULL");
          w.printf("    c2j.class = %s;\n",  fargs[1].varName);
          w.printf("    c2j.mid = %s;\n", fargs[2].varName);
          break;
        case JNI_CALL_NONVIRTUAL:
          ensureFormalTypes(JNI_ENV, JOBJECT, JCLASS, JMETHODID);
          w.printf("    c2j.object = %s;\n", fargs[1].varName);
          w.printf("    c2j.class = %s;\n",  fargs[2].varName);
          w.printf("    c2j.mid = %s;\n", fargs[3].varName);
          break;
        case JNI_CALL_NOT_CLASSIFIED:
          w.printf("    c2j.object = %s;\n", "NULL");
          w.printf("    c2j.class = %s;\n",  "NULL");
          w.printf("    c2j.mid = %s;\n", "NULL");
          break;
      }

      w.printf("    bda_state_c2j_call(s, &c2j);\n");
      w.printf("  }\n");
      w.printf("\n");
    }
 
    abstract void genCallOriginal(PrintWriter w);

    void genC2JInfoAfter(PrintWriter w) {
      w.printf("  /* Pop the jni_function_frame structure. */\n");
      w.printf("  if (s != NULL) {\n");  
      w.printf("    bda_state_c2j_return(s, &c2j);\n");
      w.printf("    s->mode = saved_mode;\n");
      w.printf("  }\n");
      w.printf("\n");
    }
    
    void genJNICheckAfter(PrintWriter w) {
      final String jniFuncName = getJNIFuncName();
      w.printf("  /* Check the JNI function return. */\n");
      w.printf("  if ((s != NULL) && agent_options.jinn && (s->mode != JVM)) {\n");  

      // critical resources
      if (jniFuncName.matches("Get(String|PrimitiveArray)Critical")) {
        w.printf("    bda_enter_critical(s, (void*)%s);\n", "result");
      } else if (jniFuncName.matches("Release(String|PrimitiveArray)Critical")) {
        w.printf("    bda_leave_critical(s, (void*)%s);\n", fargs[2].varName);
      }

      // Entity-specific typing
      if (wrapperJNIFunction == JNIFunction.GetMethodID) {
        w.printf("   if (result != NULL) {\n");
        w.printf("       bda_jmethodid_append( result, 0, %s, %s, %s);\n", 
                 fargs[1].varName, fargs[2].varName, fargs[3].varName);
        w.printf("   }\n");
      } else if (wrapperJNIFunction == JNIFunction.GetStaticMethodID) {
        w.printf("   if (result != NULL) {\n");
        w.printf("       bda_jmethodid_append(result, 1, %s, %s, %s);\n", 
                 fargs[1].varName, fargs[2].varName, fargs[3].varName);
        w.printf("   }\n");
      } else if (wrapperJNIFunction == JNIFunction.GetFieldID) {
        w.printf("   if (result != NULL) {\n");
        w.printf("       bda_jfieldid_append(s, result, %s, 0, %s, %s);\n", 
                 fargs[1].varName, fargs[2].varName, fargs[3].varName);
        w.printf("   }\n");
      } else if (wrapperJNIFunction == JNIFunction.GetStaticFieldID) {
        w.printf("   if (result != NULL) {\n");
        w.printf("       bda_jfieldid_append(s, result, %s, 1, %s, %s);\n", 
                 fargs[1].varName, fargs[2].varName, fargs[3].varName);
        w.printf("   }\n");
      }

      // local references
      if (wrapperJNIFunction.returnLocalReference()) {
        if (wrapperJNIFunction == JNIFunction.PopLocalFrame) {
          w.printf("    bda_local_ref_leave(s);\n");
        }
        w.printf("   if (result != NULL) {\n");
        w.printf("      if (!bda_check_local_frame_overflow(s, \"%s\")) {\n", jniFuncName);
        w.printf("         bda_orig_jni_funcs->DeleteLocalRef(env, result);\n");
        w.printf("         result = NULL;\n");
        w.printf("      } else {\n");
        w.printf("         bda_local_ref_add(s, result);\n");
        w.printf("      }\n");
        w.printf("   }\n");
      }

      if (wrapperJNIFunction == JNIFunction.PushLocalFrame) {
        w.printf("   if (result == 0) {\n");
        w.printf("     bda_local_ref_enter(s, %s, 0);\n", fargs[1].varName);
        w.printf("   }\n");
      } else if (wrapperJNIFunction == JNIFunction.DeleteLocalRef) {
        assert !wrapperJNIFunction.hasReturnType();
        assert fargs[1].type.jniType == JNIConstants.JOBJECT;
        w.printf("   if (%s != NULL) {\n", fargs[1].varName);
        w.printf("     bda_local_ref_delete(s, %s);\n", fargs[1].varName);
        w.printf("   }\n");
      }


      // VM resources
      if (jniFuncName.matches("GetString(UTF|)Chars")
          || jniFuncName.matches("Get(Boolean|Byte|Char|Short|Int|Long|Float|Double)ArrayElements")
          || jniFuncName.matches("Get(String|PrimitiveArray)Critical")) {
        w.printf("    if (result != NULL) {bda_resource_acquire(s, result, \"%s\");}\n", jniFuncName);
      } else if (jniFuncName.matches("ReleaseString(UTF|)Chars")
                 || jniFuncName.matches("Release(String|PrimitiveArray)Critical")) {
        w.printf("    bda_resource_release(s, %s, \"%s\");\n", fargs[2].varName, jniFuncName);
      } else if (jniFuncName.matches("Release(Boolean|Byte|Char|Short|Int|Long|Float|Double)ArrayElements")) {
        w.printf("    if ( %s != JNI_COMMIT) {bda_resource_release(s, %s, \"%s\");}\n", fargs[3].varName, fargs[2].varName, jniFuncName);
      }

      // Monitor resources
      if (wrapperJNIFunction == JNIFunction.MonitorEnter) {
        w.printf("   if (result == 0) {\n");
        w.printf("     bda_monitor_enter(s, %s);\n", fargs[1].varName);
        w.printf("   }\n");
      } else if (wrapperJNIFunction == JNIFunction.MonitorExit) {
        w.printf("   if (result == 0) {\n");
        w.printf("     bda_monitor_exit(s, %s);\n", fargs[1].varName);
        w.printf("   }\n");
      }
      w.printf("  }\n\n");

      w.printf("  if ((s != NULL) && agent_options.jinn) {\n");  
      // global references
      if (wrapperJNIFunction == JNIFunction.NewGlobalRef) {
        w.printf("    if (result != NULL) {\n");
        w.printf("      bda_global_ref_add(result, 0);\n");
        w.printf("    }\n");
      } else if (wrapperJNIFunction == JNIFunction.DeleteGlobalRef) {
        assert fargs[1].type.jniType == JNIConstants.JOBJECT;
        w.printf("   bda_global_ref_delete(%s, 0);\n", fargs[1].varName);
      } else if (wrapperJNIFunction == JNIFunction.NewWeakGlobalRef) {
        w.printf("    if (result != NULL) {\n");
        w.printf("      bda_global_ref_add(result, 1);\n");
        w.printf("    }\n");
      } else if (wrapperJNIFunction == JNIFunction.DeleteWeakGlobalRef) {
        assert fargs[1].type.jniType == JNIConstants.JWEAK;
        w.printf("   bda_global_ref_delete(%s, 1);\n", fargs[1].varName);
      }
      w.printf("  }\n\n");

    }

    void genFuncEnd(PrintWriter w) {
      if (wrapperJNIFunction.hasReturnType()) {w.printf("  return result;\n");}
      w.printf("}\n\n");
    }
  }

  private static class FixedArgProxyGenerator extends ProxyGenerator {

    FixedArgProxyGenerator(JNIFunction jniFunction) {
      super(jniFunction, jniFunction);
    }

    void genCallOriginal(PrintWriter w) {
      w.printf("  /* Call the target JNI function. */\n");      
      w.printf("  %s bda_orig_jni_funcs->%s(", 
               wrapperJNIFunction.hasReturnType()? "result =":"",
               getJNIFuncName());
      for(int i = 0; i < fargs.length;i++) {
        FormalArgument f = fargs[i];
        w.printf("%s%s", i==0?"":", ", f.varName);
      }
      w.printf(");\n");
      w.printf("  L_RETURN:\n");
      w.printf("\n");
    }
  }

  private static class VariableArgProxyGenerator extends ProxyGenerator {

    VariableArgProxyGenerator(JNIFunction proxyFunction, JNIFunction targetFunction) {
      super(proxyFunction, targetFunction);
      assert proxyFunction.extraArgType == ExtraArgumentType.DOT_DOT_DOT && targetFunction.extraArgType == ExtraArgumentType.VA_LIST;
    }

    void genLocalVariableDeclarations(PrintWriter w) {
      super.genLocalVariableDeclarations(w);
      w.printf("  va_list args;\n");
    }

    void genCallOriginal(PrintWriter w) {
      JNIAnnotatedType[] arguments = wrapperJNIFunction.argumenTypes;
      String jni_target_fname = targetJNIFunction.name;
      w.printf("  /* Call the target JNI function. */\n");     
      w.printf("  va_start(args,p%d);\n", arguments.length-1);
      if (wrapperJNIFunction.hasReturnType()) {
        w.printf("  result = ");
      }
      w.printf("  bda_orig_jni_funcs->%s(", jni_target_fname);
      for(int i = 0; i < fargs.length;i++) {
        FormalArgument f = fargs[i];
        w.printf("%s%s", i==0?"":", ", f.varName);
      }
      w.printf(", args");
      w.printf(");\n");
      w.printf("  L_RETURN:\n");
      w.printf("\n");
    }
  }
}
