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
 * This visitor finds the partitioning of locks over variables.
 * 
 * @author Robert Soule
 * @version $Revision: 1.9 $
 */

public class EquivalenceClassFinder extends Visitor {
  
  /* A simple class for returning the results */
  public class Result {
    private final Map<String, String> varToClassName;
    private final Map<String, Set<String>> classNameToClass;    
    public Result(final Map<String, String> varToClassName, final Map<String, Set<String>> classNameToClass) {
      this.varToClassName = varToClassName;
      this.classNameToClass = classNameToClass;
    }
    public final Map<String, String> getVarToClassName() {
      return varToClassName;
    }
    public final Map<String, Set<String>> getClassNameToClass() {
      return classNameToClass;
    }
  }

  /* A mapping from variables to equivalence class name. */
  private Map<String, String> varToClassName = null ;

  /* A mapping from equivalence class name to the equivalence classes themselves,
     each represented as a set of variables */
  private Map<String, Set<String>> classNameToClass = null ;
  
  /* The set of all operators */
  private Set<Node> allOperators = null;

  /* The initial equivalence class that contais all variables */
  private String firstClassName = null;

  /* A counter to name new equivalent classes */
  private int setId = 0;

  /**
   * Construct a new EquivalenceClassFinder.
   */
  public EquivalenceClassFinder() {
    /* do nothing */
  }

  public Result analyze(Node unit) {
    allOperators = new HashSet<Node>();
    firstClassName = getNewSetName();
    varToClassName = new HashMap<String, String>();
    classNameToClass = new HashMap<String, Set<String>>();   
    classNameToClass.put(firstClassName, new TreeSet<String>());
    dispatch(unit);    
    for (Node op : allOperators) {
      Set<String> usedByO = getVariablesUsedBy(op);
      for (String v : usedByO) {
        Set<String> equivV = classNameToClass.get(varToClassName.get(v));
        if (!usedByO.containsAll(equivV)) {
          equivV = classNameToClass.remove(varToClassName.get(v));
          Set<String> newEquivV = new TreeSet<String>(equivV);
          newEquivV.retainAll(usedByO);
          String newEquivVName = getNewSetName();
          classNameToClass.put(newEquivVName, newEquivV);
          for (String u : newEquivV) {
            varToClassName.put(u, newEquivVName);
          }
          Set<String> newRest = new TreeSet<String>(equivV);
          newRest.removeAll(newEquivV);
          String newRestName = getNewSetName();
          classNameToClass.put(newRestName, newRest);
          for (String u : newRest) {
            varToClassName.put(u, newRestName);
          }
        } 
      }       
    }
    
    // for (String className : classNameToClass.keySet()) {
    //   System.out.println("Set " + className + ":");
    //   for (String var : classNameToClass.get(className)) {
    //     System.out.println("\t" + var);
    //   }
    // }
    
    return new Result(varToClassName, classNameToClass);
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
  
  public void visitOpInvoke(GNode n) {
    Set<String> usedByO = getVariablesUsedBy(n);
    for (String str : usedByO) {
      varToClassName.put(str, firstClassName);
    }
    classNameToClass.get(firstClassName).addAll(usedByO);
    allOperators.add(n);
  }


  private Set<String> getVariablesUsedBy(Node op) {
    Set<String> usedByO = new TreeSet<String>();
    addListToSet(getVarList(getOpInputs(op)), usedByO);   
    addListToSet(getVarList(getOpOutputs(op)), usedByO);   
    return usedByO;
  }

  private void addListToSet(Node varList, Set<String> usedByO) {
    if (varList == null) {
      return;
    }
    for (int i = 0; i < varList.size(); i++) {
      usedByO.add(getVarName(varList.getNode(i)));
    }
  }

  private String getNewSetName() {
    setId++;
    return "s" + setId;
  }

  private String getVarName(Node var) {
    return var.getString(0);
  }

  private String getOpName(Node op) {
    return op.getNode(2).getString(0);
  }

  private Node getOpInputs(Node op) {
    return op.getNode(3);
  }

  private Node getOpOutputs(Node op) {
    return op.getNode(1);
  }

  private Node getVarList(Node streamsAndVars) {
    if (streamsAndVars == null) {
      return null;
    }
    Node varList = null;
    if (streamsAndVars.size() == 2) {
      varList = streamsAndVars.getNode(1);
    } else {
      varList = streamsAndVars.getNode(0);
    }
    return varList;
  }
  
}
