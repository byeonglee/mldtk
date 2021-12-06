package xtc.lang.marco.analysis.oracle;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;

import xtc.lang.marco.analysis.oracle.cpp.CppOracleFactory;
import xtc.lang.marco.analysis.oracle.sql.SQLOracleFactory;
import xtc.lang.marco.ast.Blank;
import xtc.lang.marco.ast.Fragment;
import xtc.lang.marco.ast.StrongAst;
import xtc.lang.marco.run.McCode;
import xtc.lang.marco.type.CodeType;

public abstract class OracleFactory {
  static final HashMap<String, String> oracleFactories = new HashMap<String, String>();

  static {
    oracleFactories.put("cpp", CppOracleFactory.class.getName());
    oracleFactories.put("sql", SQLOracleFactory.class.getName());
    tryLoadingFactoryNamesFromFile();
  }

  static void tryLoadingFactoryNamesFromFile() {
    try {
      if (new File("marco.properties").isFile()) {
        Properties p = new Properties();
        p.load(new FileInputStream(new File("marco.properties")));
        for (Object _key : p.keySet()) {
          String key = (String) _key;
          String value = p.getProperty(key);
          oracleFactories.put(key, value);
        }
      }
    } catch (IOException e) {
    }
  }

  static OracleFactory getOracleFactory(String lang) throws Exception {
    String factoryClassName = oracleFactories.get(lang);
    Class<?> factoryClass = Class.forName(factoryClassName);
    OracleFactory factory = (OracleFactory) (factoryClass.newInstance());
    return factory;
  }

  public abstract IFreeNameOracle createFreeNameOracle(Fragment m);

  public abstract IFreeNameOracle createFreeNameOracle(StrongAst origin, CodeType ct, McCode c);

  public abstract ICapturedNameOracle createCapturedNameOracle(Fragment f, Blank b, String freeName);

  public abstract ISyntaxOracle createSyntaxOracle(Fragment f);

  public abstract ICodeTypeOracle createCodeTypeOracle();
}
