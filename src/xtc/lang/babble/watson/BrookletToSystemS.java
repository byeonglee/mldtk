/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2009 New York University
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
package xtc.lang.babble.watson;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.List;
import java.util.HashMap;
import java.util.HashSet;
import java.util.TreeSet;
import java.util.Map;
import java.util.Set;
import java.util.Collections;
import java.util.ArrayList;

import xtc.lang.babble.jdl.JDLPrinter;
import xtc.lang.babble.texttemplate.TextTemplate;
import xtc.lang.babble.texttemplate.TextTemplateSubstituter;
import xtc.parser.ParseException;
import xtc.tree.GNode;
import xtc.tree.Node;
import xtc.tree.Printer;
import xtc.tree.Visitor;
import xtc.util.Pair;
import xtc.util.Runtime;

/**
 * A pretty printer for the generalized stream semantics.
 * 
 * @author Robert Soule
 * @version $Revision: 1.68 $
 */
public class BrookletToSystemS extends Visitor {
  // =========================================================================
  public class QueueNamer extends Visitor {
    private int peCounter = 0;
    private int streamCounter = 0;

    public QueueNamer() {
      // do nothing
    }

    /**
     * Process the specified translation unit.
     * 
     * @param unit
     *          The translation unit.
     */
    public void translate(Node unit) {
      dispatch(unit);
    }

    /**
     * Visit all nodes in the AST.
     */
    public void visit(final GNode n) {
      for (Object o : n) {
        if (o instanceof Node) {
          dispatch((Node) o);
        } else if (Node.isList(o)) {
          iterate(Node.toList(o));
        }
      }
    }

    public void visitInputs(GNode n) {
      if (null != n.getNode(0)) {
        Node streamList = n.getNode(0);
        for (int i = 0; i < streamList.size(); i++) {
          String peName = "PE_BIOP_" + streamList.getNode(i).getString(1)
            + "Source";
          String streamName = peName + "." + peCounter + "S." + streamCounter;
          queueToStreamName.put(streamList.getNode(i).getString(1), streamName);
          peCounter++;
          streamCounter++;
        }
      }
    }

    public void visitOutputs(GNode n) {
      if (null != n.getNode(0)) {
        Node streamList = n.getNode(0);
        for (int i = 0; i < streamList.size(); i++) {
          String inputName = "MyApp." + peCounter + ".ip0";
          queueToStream.put(streamList.getNode(i).getString(1), inputName);
          peCounter++;
        }
      }
    }

    /** Visit the specified opInvoke node. */
    public void visitOpInvoke(GNode n) {
      String peName = "PE_UDOP_" + n.getNode(2).getString(0);
      if (n.getNode(1) != null) {
        Node streamOrVarList = n.getNode(1).getNode(0);
        if ("StreamList".equals(streamOrVarList.getName())) {
          for (int i = 0; i < streamOrVarList.size(); i++) {
            String streamName = peName + "." + peCounter + "S." + streamCounter;
            queueToStreamName.put(streamOrVarList.getNode(i).getString(0),
                                  streamName);
            streamCounter++;
          }
        }
      }
      if (n.getNode(3) != null) {
        Node streamOrVarList = n.getNode(3).getNode(0);
        if ("StreamList".equals(streamOrVarList.getName())) {
          for (int i = 0; i < streamOrVarList.size(); i++) {
            String inputName = "MyApp." + peCounter + ".ip" + i;
            queueToStream.put(streamOrVarList.getNode(i).getString(0),
                              inputName);
          }
        }
      }
      peCounter++;
    }
  }

  /** The printer. */
  protected final Printer printer;
  /** This Visitor's runtime. */
  private final Runtime runtime;
  /** The base directory for the translation output. */
  private final String basedir;
  /** The location of the app dir */
  private File appDir;
  /** The location of the app/cofig dir */
  private File configDir;
  /** The location of the app/src dir */
  private File srcDir;
  /** The location of the app/bin dir */
  private File binDir;
  /** The location of the app/data dir */
  private File dataDir;
  /** The location of the template dir */
  private File templateDir;
  /** The name of the tuple */
  private final String tupleName = "Tuple";
  /** The id number for each PE */
  private int peNumber;
  /** A unique identifier for every stream */
  private int streamNumber;
  /** A mapping from queue names to stream names */
  private Map<String, String> queueToStream;
  private Map<String, String> queueToStreamName;
  /** the list of PEs for this application */
  private Pair<Node> jdlPes;
  /** */
  private Node makefileUdops;
  /** */
  private Node makefilePes;
  /** */
  private List<String> hosts;
  /** */
  private String appName;

  /* Map a node to a flag if it used shared variables */
  private Map<Node, Boolean> sharedVariableMap;

  /* Map a variable to list of nodes that use it */
  private Map<String, Set<Node>> variablToUsageMap;

  /* The set of equivalence classes for assigning locks */
  EquivalenceClassFinder.Result equivalenceClasses;

  /** The types of operators that can be produced */
  private enum OperatorType {
    SOURCE, SINK, UDOP
      }

  private String logLevel;

  /**
   * Create a new printer for the simply typed lambda calculus.
   * 
   * @param printer
   *          The printer.
   */
  public BrookletToSystemS(Runtime runtime, Printer printer, String basedir,
                           List<String> hosts, String username, String templatePath, String appName,
                           String logLevel, EquivalenceClassFinder.Result equivalenceClasses) {
    this.runtime = runtime;
    this.printer = printer;
    printer.register(this);
    this.basedir = basedir;
    this.hosts = hosts;
    this.appName = appName;
    this.logLevel = logLevel;
    this.equivalenceClasses = equivalenceClasses;
    queueToStream = new HashMap<String, String>();
    queueToStreamName = new HashMap<String, String>();
    peNumber = 1;
    streamNumber = 0;
    templateDir = new File(templatePath);
  }

  /**
   * Process the specified translation unit.
   * 
   * @param unit
   *          The translation unit.
   */
  public void translate(Node unit) {
    new QueueNamer().translate(unit);
    sharedVariableMap = new HashMap<Node, Boolean>();
    variablToUsageMap = new HashMap<String, Set<Node>>();
    new SharedVariableFinder().analyze(unit);
    dispatch(unit);
  }

  /**
   * Generic catch-all visit method
   */
  public void visit(final GNode n) {
    for (Object o : n) {
      if (o instanceof Node) {
        dispatch((Node) o);
      } else if (Node.isList(o)) {
        iterate(Node.toList(o));
      }
    }
  }

  /** Visit the specified program node. */
  public void visitProgram(GNode n) {
    this.createDirectoryStructure(appName);
    this.copyStaticFiles(appName);
    this.writeHostsFile();
    jdlPes = Pair.empty();
    makefileUdops = GNode.create("UDOPS");
    makefilePes = GNode.create("PES");
    Node makeFile = GNode.create("File", makefileUdops, makefilePes);
    for (int i = 0; i < n.size(); i++) {
      dispatch(n.getNode(i));
    }
    Node jdlJob = GNode.create("Job", jdlPes);
    Node jdlFile = GNode.create("File", jdlJob);
    // Print from the AST
    this.jdlPrint(jdlFile);
    this.makePrint(makeFile);
  }

  /** Visit the specified outputs node. */
  public void visitOutputs(GNode n) {
    if (null != n.getNode(0)) {
      Node streamList = n.getNode(0);
      for (int i = 0; i < streamList.size(); i++) {
        String name = streamList.getNode(i).getString(1);
        String operatorName = "BIOP_" + name + "Sink";
        String peName = "PE_" + operatorName;
        String main = binDir.getAbsolutePath() + File.separator + peName
          + ".dpe";
        String filename = name + ".data";
        String args = appDir.getAbsolutePath() + " " + peName + " 0 "
          + tupleName + " " + tupleName
          + "_Sink 1 -1 -1 -1 . 0 1,0,1 &quot;-f file:////tmp/" + filename
          + "&quot;";
        this.createBIOP(name, OperatorType.SINK, 1);
        this.createBIOP_PESink(operatorName, peName);
        makefilePes.add(GNode.create("PEBIOP", peName, operatorName));
        Node cmd = GNode.create("Main", main);
        Node arg = GNode.create("Arguments", args);
        Node executable = GNode.create("Executable", cmd, arg);
        Node pe = GNode.create("PE");
        String peid = "MyApp." + operatorName + peNumber + "." + peNumber;
        String host = getInputOrOutputHost(streamList.getNode(i));
        pe.add(peid);
        pe.add(operatorName);
        pe.add(host);
        pe.add(logLevel);
        pe.add(executable);
        if (jdlPes.isEmpty()) {
          jdlPes = new Pair<Node>(pe);
        } else {
          jdlPes.add(pe);
        }
        Node input = GNode.create("Input");
        String portName = queueToStream.get(streamList.getNode(i).getString(1));
        String sName = queueToStreamName
          .get(streamList.getNode(i).getString(1));
        GNode stream = GNode.create("Stream", sName);
        GNode inputEndpoint = GNode.create("InputEndpoint", portName, stream);
        if (sName == null)
          return;
        Node inputPort = GNode.create("InputPort", portName, inputEndpoint,
                                      sName);
        input.add(inputPort);
        pe.add(input);
        peNumber++;
      }
    }
  }

  /** Visit the specified inputs node. */
  public void visitInputs(GNode n) {
    if (null != n.getNode(0)) {
      Node streamList = n.getNode(0);
      for (int i = 0; i < streamList.size(); i++) {
        dispatch(streamList.getNode(i));
        String name = streamList.getNode(i).getString(1);
        String operatorName = "BIOP_" + name + "Source";
        String peName = "PE_" + operatorName;
        String main = binDir.getAbsolutePath() + File.separator + peName
          + ".dpe";
        String args = appDir.getAbsolutePath() + " " + peName + " 1,0:0:0 "
          + tupleName + " " + tupleName
          + "_Source 1 -1 -1 -1 . 0 0,1,1 &quot;-f file:///Source.dat&quot;";
        String portName = queueToStream.get(streamList.getNode(i).getString(1));
        String streamName = queueToStreamName.get(streamList.getNode(i)
                                                  .getString(1));
        this.createBIOP(name, OperatorType.SOURCE, i);
        this.createBIOP_PESource(operatorName, peName);
        makefilePes.add(GNode.create("PEBIOP", peName, operatorName));
        Node cmd = GNode.create("Main", main);
        Node arg = GNode.create("Arguments", args);
        Node executable = GNode.create("Executable", cmd, arg);
        Node pe = GNode.create("PE");
        String peid = "MyApp." + operatorName + peNumber + "." + peNumber;
        String host = getInputOrOutputHost(streamList.getNode(i));
        pe.add(peid);
        pe.add(operatorName);
        pe.add(host);
        pe.add(logLevel);
        pe.add(executable);
        if (jdlPes.isEmpty()) {
          jdlPes = new Pair<Node>(pe);
        } else {
          jdlPes.add(pe);
        }
        if (portName == null) {
          System.out.println("visitInputs::portName is null");
        }
        Node outputStream = GNode.create("OutputStream", streamName);
        Node output = GNode.create("Output");
        Node endpoint = GNode.create("OutputEndpoint", portName);
        Node endpoints = GNode.create("OutputEndpoints", endpoint);
        Node outputPort = GNode.create("OutputPort", portName, endpoints,
                                       outputStream);
        output.add(outputPort);
        pe.add(output);
        streamNumber++;
        peNumber++;
      }
    }
  }

  private String getInputOrOutputHost(Node n) {
    // If there is no annotation list
    if (n.getNode(0) == null) {
      return hosts.get(0);
    }
    Node annotations = n.getNode(0);
    int index = 0;
    for (int i = 0; i < annotations.size(); i++) {
      if ("Group".equals(annotations.getNode(i).getString(0))) {
        Node group = annotations.getNode(i);        
        index = Integer.parseInt(group.getNode(1).getNode(0).getString(0));
        break;
      }
    }
    if (index >= hosts.size()) {
      return hosts.get(index % hosts.size());
    }
    return hosts.get(index);
  }

  private String getOpInvokeHost(Node n) {
    // If there is no annotation list
    if (n.getNode(0) == null) {
      return hosts.get(0);
    }
    Node annotations = n.getNode(0);
    int index = 0;
    for (int i = 0; i < annotations.size(); i++) {
      if ("Group".equals(annotations.getNode(i).getString(0))) {
        Node group = annotations.getNode(i);
        index = Integer.parseInt(group.getNode(1).getNode(0).getString(0));
        break;
      }
    }
    if (index >= hosts.size()) {
      return hosts.get(index % hosts.size());
    }
    return hosts.get(index);
  }

  private void createUDOP(String name, String functionName, String udopName,
                          String shutdownName, int numInputs, int numOutputs, Set<String> variables, boolean lock) {
    createUDOPBIOPSource(name, functionName, udopName, shutdownName, numInputs,
                         numOutputs, name, variables, "UDOP-perf.cpp", lock, 1);
    makefileUdops.add(GNode.create("UDOP", udopName));
  }

  private void createUDOPBIOPSource(String name, String functionName,
                                    String udopName, String shutdownName, int numInputs, int numOutputs,
                                    String filename, Set<String> variables, String cppTemplateFileName, 
                                    boolean lock, int master) {
    lock = false;
    Printer udopPrinter = null;
    Printer udopHPrinter = null;
    File udopFile = new File(srcDir, udopName + ".cpp");
    File udopHFile = new File(srcDir, udopName + ".h");
    try {
      udopPrinter = new Printer(new PrintWriter(udopFile));
      udopHPrinter = new Printer(new PrintWriter(udopHFile));
    } catch (IOException x) {
      if (null == x.getMessage()) {
        runtime.error(": I/O error");
      } else {
        runtime.error(x.getMessage());
      }
      return;
    }

    Map<String, String> varToClassName = equivalenceClasses.getVarToClassName();
    Set<String> locks = new TreeSet<String>();
    for (String str : variables) {
      locks.add(varToClassName.get(str));
    }
    Set<String> allEquivClasses = equivalenceClasses.getClassNameToClass().keySet();
    List<String> allEquivClassList = new ArrayList<String>(allEquivClasses);
    Collections.sort(allEquivClassList);

    String lockStr = "";
    String lockEndStr = "";
    String lockAssign = "";
    int numLocks = locks.size();
    int totalLocks = allEquivClassList.size();
    if (lock) {
      for (String str : locks) {
        lockStr    += "  pthread_mutex_lock(" + str + ");\n";      
        lockAssign += "  " + str + " = mutexes + " + allEquivClassList.indexOf(str) + ";\n";
        lockEndStr = "  pthread_mutex_unlock(" + str + ");\n" + lockEndStr;
      }
    }

    File srcFile = new File(templateDir, cppTemplateFileName);
    Map<String, String> subs = new HashMap<String, String>();
    subs.put("$udopname", udopName);
    subs.put("$name", name);
    subs.put("$functionname", functionName);
    subs.put("$shutdown", shutdownName);
    subs.put("$classname", udopName);
    subs.put("$tuplename", tupleName);
    subs.put("$numinputs", Integer.toString(numInputs));
    subs.put("$numoutputs", Integer.toString(numOutputs));
    subs.put("$lock", lockStr);
    subs.put("$lockend", lockEndStr);
    subs.put("$assignlocks", lockAssign);
    subs.put("$numlocks", Integer.toString(numLocks));
    subs.put("$totallocks", Integer.toString(totalLocks));
    subs.put("$master", Integer.toString(master));
    this.copyTemplate(srcFile, udopPrinter, subs);
    udopPrinter.flush();
    udopPrinter.close();
    srcFile = new File(templateDir, "UDOP_Begin-perf.h");
    this.copyTemplate(srcFile, udopHPrinter, subs);

    for (String str : locks) {
      subs.put("$varname", str);
      srcFile = new File(templateDir, "UDOP_Variable.h");
      this.copyTemplate(srcFile, udopHPrinter, subs);
    }
    if (lock) {
      srcFile = new File(templateDir, "UDOP_End_lock.h");
    } else {
      srcFile = new File(templateDir, "UDOP_End.h");
    }
    this.copyTemplate(srcFile, udopHPrinter, subs);
    udopHPrinter.flush();
    udopHPrinter.close();
  }

  private void createUDOP_PE(String operatorName, String peName) {
    File srcFile = new File(templateDir, "PE_Babble.cpp");
    File destFile = new File(srcDir, peName + ".cpp");
    Map<String, String> subs = new HashMap<String, String>();
    subs.put("$classname", peName);
    subs.put("$tuplename", tupleName);
    subs.put("$opname", operatorName);
    this.copyTemplate(srcFile, destFile, subs);
  }

  /** Visit the specified opInvoke node. */
  public void visitOpInvoke(GNode n) {
    String name = n.getNode(2).getString(0);
    String udopName = "UDOP_" + name;
    String peName = "PE_" + udopName;
    int numInputs = 0;
    Set<String> variables = new HashSet<String>();
    if (n.getNode(3) != null) {
      Node varList = null;
      Node streamList = null;
      // Fist, check to see if there are two children
      if (n.getNode(3).size() == 2) {
        streamList = n.getNode(3).getNode(0);
        varList = n.getNode(3).getNode(1);
      } else if (n.getNode(3).size() == 1) {
        // Only 1 child, which is either a varList or a streamList
        if ("StreamList".equals(n.getNode(3).getNode(0).getName())) {
          streamList = n.getNode(3).getNode(0);
        } else if ("VarList".equals(n.getNode(3).getNode(0).getName())) {
          varList = n.getNode(3).getNode(0);
        }
      }
      numInputs = (streamList == null) ? 0 : streamList.size();
      if (varList != null) {
        for (int i = 0; i < varList.size(); i++) {
          variables.add(varList.getNode(i).getString(0));
        }
      }
    }
    int numOutputs = 0;
    if (n.getNode(1) != null) {
      Node varList = null;
      Node streamList = null;
      // Fist, check to see if there are two children
      if (n.getNode(1).size() == 2) {
        streamList = n.getNode(1).getNode(0);
        varList = n.getNode(1).getNode(1);
      } else if (n.getNode(1).size() == 1) {
        // Only 1 child, which is either a varList or a streamList
        if ("StreamList".equals(n.getNode(1).getName())) {
          streamList = n.getNode(1).getNode(0);
        } else if ("VarList".equals(n.getNode(1).getName())) {
          varList = n.getNode(1).getNode(0);
        }
      }
      numOutputs = (streamList == null) ? 0 : streamList.size();
      if (varList != null) {
        for (int i = 0; i < varList.size(); i++) {
          variables.add(varList.getNode(i).getString(0));
        }
      }
    }
    String funcName = "ocaml_wrap_" + name.toLowerCase();
    String shutdownName = name.toLowerCase() + "_shutdown";
    boolean lock = false;
    // Note: The version of System S that I am targeting 
    // only has one thread per input port. Therefore, we do not
    // need to lock for the case of more than one input variable.
    // For this reason, I have commented o0ut the following line, and
    // replaced it with the line that only checks for shared variables
    // if ((numInputs > 1) || (sharedVariableMap.get(n) == true)) {
    if (sharedVariableMap.get(n) == true) {
      lock = true;
    }
    this.createUDOP(name, funcName, udopName, shutdownName, numInputs,
                    numOutputs, variables, lock);
    this.createUDOP_PE(udopName, peName);
    makefilePes.add(GNode.create("PEUDOP", peName, udopName));
    String main = binDir.getAbsolutePath() + File.separator + peName + ".dpe";
    String arg1;
    String arg2;
    Node outputs = n.getNode(1);
    if (outputs != null && outputs.getNode(0).getName().equals("StreamList")) {
      arg1 = " 1,0:0:0 ";
      arg2 = " 1 -1 -1 -1 . 0 1,1,1,1 ";
    } else {
      arg1 = " 0 ";
      arg2 = " 1 -1 -1 -1 . 0 1,0,1 ";
    }
    String args = appDir.getAbsolutePath() + " " + peName + arg1 + udopName
      + " " + tupleName + arg2 + "&quot;&quot;";
    String peid = "MyApp." + peName + peNumber + "." + peNumber;
    Node cmd = GNode.create("Main", main);
    Node arg = GNode.create("Arguments", args);
    Node executable = GNode.create("Executable", cmd, arg);
    Node pe = GNode.create("PE");
    String host = getOpInvokeHost(n);
    pe.add(peid);
    pe.add(peName);
    pe.add(host);
    pe.add(logLevel);
    pe.add(executable);
    if (jdlPes.isEmpty()) {
      jdlPes = new Pair<Node>(pe);
    } else {
      jdlPes.add(pe);
    }
    Node inputQs = n.getNode(3);
    Node input = null;
    if (inputQs != null) {
      input = GNode.create("Input");
      int portNumber = 0;
      Node streamOrVarList = inputQs.getNode(0);
      if (streamOrVarList.getName().equals("StreamList")) {
        for (int i = 0; i < streamOrVarList.size(); i++) {
          String portname = queueToStream.get(streamOrVarList.getNode(i)
                                              .getString(0));
          portNumber++;
          String sName = queueToStreamName.get(streamOrVarList.getNode(i)
                                               .getString(0));
          GNode stream = GNode.create("Stream", sName);
          GNode inputEndpoint = GNode.create("InputEndpoint", portname, stream);
          if (sName == null) {
            return;
          }
          Node inputPort = GNode.create("InputPort", portname, inputEndpoint,
                                        sName);
          input.add(inputPort);
        }
      }
    }
    if (null != input) {
      pe.add(input);
    }
    Node outputQs = n.getNode(1);
    Node output = null;
    if (outputQs != null) {
      int portNum = 0;
      Node streamOrVarList = outputQs.getNode(0);
      if (streamOrVarList.getName().equals("StreamList")) {
        output = GNode.create("Output");
        for (int i = 0; i < streamOrVarList.size(); i++) {
          String sName = queueToStreamName.get(streamOrVarList.getNode(i)
                                               .getString(0));
          String outputPortName = queueToStream.get(streamOrVarList.getNode(i)
                                                    .getString(0));
          Node outputStream = GNode.create("OutputStream", sName);
          Node endpoint = GNode.create("OutputEndpoint", outputPortName);
          Node endpoints = GNode.create("OutputEndpoints", endpoint);
          Node outputPort = GNode.create("OutputPort", outputPortName,
                                         endpoints, outputStream);
          output.add(outputPort);
          portNum++;
          streamNumber++;
        }
      }
    }
    if (null != output) {
      pe.add(output);
    }
    peNumber++;
  }

  /*
   * Create the JDL printer, and write to the jdl file.
   * 
   * @param node the root of the AST of the JDL file.
   */
  private void jdlPrint(Node node) {
    File jdlFile = new File(configDir, "app.jdl");
    Printer out;
    try {
      out = new Printer(new PrintWriter(jdlFile));
    } catch (IOException x) {
      if (null == x.getMessage()) {
        runtime.error(jdlFile.toString() + ": I/O error");
      } else {
        runtime.error(jdlFile.toString() + ": " + x.getMessage());
      }
      return;
    }
    new JDLPrinter(out).dispatch(node);
    out.flush();
    out.close();
  }

  /*
   * Create the Makefile printer, and write to the makefile.
   * 
   * @param node the root of the AST of the Makefile file.
   */
  private void makePrint(Node node) {
    File makeFile = new File(srcDir, "Makefile");
    Printer out;
    try {
      out = new Printer(new PrintWriter(makeFile));
    } catch (IOException x) {
      if (null == x.getMessage()) {
        runtime.error(makeFile.toString() + ": I/O error");
      } else {
        runtime.error(makeFile.toString() + ": " + x.getMessage());
      }
      return;
    }
    new MakefilePrinter(out).dispatch(node);
    out.flush();
    out.close();
  }

  /*
   * Creates the C++ files for a BIOP.
   * 
   * @param name the name of the operator.
   */
  private void createBIOP(String name, OperatorType type, int master) {
    String operatorName = null;
    String cppFileName = null;
    String funcName = null;
    String shutdownName = null;
    int numInputs = 0;
    int numOutputs = 0;
    Set<String> variables = new HashSet<String>();
    switch (type) {
    case SOURCE:
      operatorName = "BIOP_" + name + "Source";
      numInputs = 0;
      numOutputs = 1;
      cppFileName = "Source.cpp";
      funcName = "ocaml_wrap_" + name;
      shutdownName = name + "_shutdown";
      break;
    case SINK:
      operatorName = "BIOP_" + name + "Sink";
      numInputs = 1;
      numOutputs = 0;
      cppFileName = "Sink-perf.cpp";
      funcName = "ocaml_wrap_" + name;
      shutdownName = name + "_shutdown";
      break;
    }
    createUDOPBIOPSource(name, funcName, operatorName, shutdownName, numInputs,
                         numOutputs, "Endpoints", variables, cppFileName, false, master);
    makefileUdops.add(GNode.create("BIOP", operatorName));
  }

  /*
   * Creates the C++ files for a BIOP PE.
   * 
   * @param operatorName the name of the operator in this PE.
   * 
   * @param peName the name of this PE.
   */
  private void createBIOP_PESource(String operatorName, String peName) {
    Map<String, String> subs = new HashMap<String, String>();
    subs.put("$classname", peName);
    subs.put("$tuplename", tupleName);
    subs.put("$opname", operatorName);
    File srcFile = new File(templateDir, "PE_Babble.cpp");
    File destFile = new File(srcDir, peName + ".cpp");
    this.copyTemplate(srcFile, destFile, subs);
  }

  /*
   * Creates the C++ files for a BIOP PE.
   * 
   * @param operatorName the name of the operator in this PE.
   * 
   * @param peName the name of this PE.
   */
  private void createBIOP_PESink(String operatorName, String peName) {
    Map<String, String> subs = new HashMap<String, String>();
    subs.put("$classname", peName);
    subs.put("$tuplename", tupleName);
    subs.put("$opname", operatorName);
    File srcFile = new File(templateDir, "PE_Babble.cpp");
    File destFile = new File(srcDir, peName + ".cpp");
    this.copyTemplate(srcFile, destFile, subs);
  }

  /**
   * Copies a file from src to dst
   * 
   * @param src
   *          the file to be copied
   * @param dst
   *          the copy of the file
   * @param executable
   *          sets the copy's permission
   * @param returns
   *          true of the copy succeeded, false otherwise
   */
  private boolean copyFile(File src, File dst, boolean executable) {
    try {
      FileReader in = new FileReader(src);
      FileWriter out = new FileWriter(dst);
      dst.setExecutable(executable);
      int c;
      while ((c = in.read()) != -1)
        out.write(c);
      in.close();
      out.close();
    } catch (java.io.IOException e) {
      if (null == e.getMessage()) {
        runtime.error(src.toString() + ": I/O error");
      } else {
        runtime.error(src.toString() + ": " + e.getMessage());
      }
      return false;
    }
    return true;
  }

  /**
   * Creates the standard directory hierarchy
   * 
   * @return true if the creation succeeded, false otherwise
   */
  private boolean createDirectoryStructure(String appName) {
    appDir = new File(basedir, appName);
    configDir = new File(appDir, "config");
    srcDir = new File(appDir, "src");
    binDir = new File(appDir, "bin");
    dataDir = new File(appDir, "data");
    if (!appDir.mkdir()) {
      System.out.println("Unable to create directory: " + appDir);
      System.exit(0);
    }
    if (!configDir.mkdir()) {
      System.out.println("Unable to create directory: " + configDir);
      System.exit(0);
    }
    if (!srcDir.mkdir()) {
      System.out.println("Unable to create directory: " + srcDir);
      System.exit(0);
    }
    if (!binDir.mkdir()) {
      System.out.println("Unable to create directory: " + binDir);
      System.exit(0);
    }
    if (!dataDir.mkdir()) {
      System.out.println("Unable to create directory: " + dataDir);
      System.exit(0);
    }
    return true;
  }

  /**
   * Copies the static files to the proper locations.
   * 
   * @return true if the copy succeeded, false otherwise
   */
  private boolean copyStaticFiles(String appName) {
    if (!(this.copyFile(new File(templateDir, "start.sh"), new File(appDir,
                                                                    "start.sh"), true)
          && this.copyFile(new File(templateDir, "stop.sh"), new File(appDir,
                                                                      "stop.sh"), true)
          && this.copyFile(new File(templateDir, "Submit.h"), new File(srcDir,
                                                                       "Submit.h"), false)
          && this.copyFile(new File(templateDir, "Submit.cpp"), new File(srcDir,
                                                                         "Submit.cpp"), false)
          && this.copyFile(new File(templateDir, "PE_Babble.h"), new File(srcDir,
                                                                          "PE_Babble.h"), false) && this.copyFile(new File(templateDir,
                                                                                                                           "OP_Babble.h"), new File(srcDir, "OP_Babble.h"), false))) {
      return false;
    }
    return true;
  }

  private boolean writeHostsFile() {
    try {
      FileWriter w = new FileWriter(new File(configDir, "hosts.spcrun"));
      for (String host : hosts) {
        w.write(host + "\n");
      }
      w.flush();
      w.close();
    } catch (java.io.IOException e) {
      if (null == e.getMessage()) {
        runtime.error("I/O error");
      } else {
        runtime.error(e.getMessage());
      }
      return false;
    }
    return true;
  }

  /*
   *
   */
  private void copyTemplate(File src, Printer pePrinter,
                            Map<String, String> subs) {
    Reader in;
    try {
      in = new FileReader(src);
    } catch (FileNotFoundException x) {
      if (null == x.getMessage()) {
        runtime.error(src.toString() + ": I/O error");
      } else {
        runtime.error(src.toString() + ": " + x.getMessage());
      }
      return;
    }
    Node node;
    try {
      node = new TextTemplate().parse(in, src);
    } catch (IOException x) {
      if (null == x.getMessage()) {
        runtime.error(src.toString() + ": I/O error");
      } else {
        runtime.error(src.toString() + ": " + x.getMessage());
      }
      return;
    } catch (ParseException x) {
      runtime.error(src.toString() + ": " + x.getMessage());
      return;
    }
    new TextTemplateSubstituter(subs, pePrinter).dispatch(node);
  }

  /*
   *
   */
  private void copyTemplate(File src, File dst, Map<String, String> subs) {
    Printer pePrinter = null;
    try {
      pePrinter = new Printer(new PrintWriter(dst));
    } catch (IOException x) {
      if (null == x.getMessage()) {
        runtime.error(dst.toString() + ": I/O error");
      } else {
        runtime.error(dst.toString() + ": " + x.getMessage());
      }
      return;
    }
    this.copyTemplate(src, pePrinter, subs);
    pePrinter.flush();
    pePrinter.close();
  }

  private class SharedVariableFinder extends Visitor {
    
    public SharedVariableFinder() { /* do nothing */}
    
    public void analyze(final Node n) {
      this.dispatch(n);
    }

    public void visit(final GNode n) {
      for (Object o : n) {
        if (o instanceof Node) {
          dispatch((Node) o);
        } else if (Node.isList(o)) {
          iterate(Node.toList(o));
        }
      }
    }

    public void visitOpInvoke(final GNode n) {
      sharedVariableMap.put(n, false);
      Node inputStreamsAndVars = n.getNode(3);
      Node outputStreamsAndVars = n.getNode(1);
      if (inputStreamsAndVars != null) {
        Node varList = null;
        if (inputStreamsAndVars.size() == 2) {
          varList = inputStreamsAndVars.getNode(1);
        } else {
          varList = inputStreamsAndVars.getNode(0);
        }
        if (varList != null) {
          for (int i = 0; i < varList.size(); i++) {
            String varName = varList.getNode(i).getString(0);
            Set<Node> nodesThatUseVar = null;
            if (variablToUsageMap.containsKey(varName)) {
              nodesThatUseVar = variablToUsageMap.get(varName);
            } else {
              nodesThatUseVar = new HashSet<Node>();
            }
            nodesThatUseVar.add(n);
            variablToUsageMap.put(varName, nodesThatUseVar);
            if (nodesThatUseVar.size() > 1) {
              for (Node sharedNode : nodesThatUseVar) {
                sharedVariableMap.put(sharedNode, true);
              }
            }
          }          
        }
      }
      if (outputStreamsAndVars != null) {
        Node varList = null;
        if (outputStreamsAndVars.size() == 2) {
          varList = outputStreamsAndVars.getNode(1);
        } else {
          varList = outputStreamsAndVars.getNode(0);
        }
        if (varList != null) {
          for (int i = 0; i < varList.size(); i++) {
            String varName = varList.getNode(i).getString(0);
            Set<Node> nodesThatUseVar = null;
            if (variablToUsageMap.containsKey(varName)) {
              nodesThatUseVar = variablToUsageMap.get(varName);
            } else {
              nodesThatUseVar = new HashSet<Node>();
            }
            nodesThatUseVar.add(n);
            variablToUsageMap.put(varName, nodesThatUseVar);
            if (nodesThatUseVar.size() > 1) {
              for (Node sharedNode : nodesThatUseVar) {
                sharedVariableMap.put(sharedNode, true);
              }
            }
          }
        }      
      }
    }        
   
  }
}
