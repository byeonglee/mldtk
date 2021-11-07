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

import java.util.ArrayList;
import java.util.List;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

import xtc.Constants;
import xtc.lang.babble.brooklet.Brooklet;
import xtc.tree.Node;

/**
 * The driver for processesing Watson programs.
 * 
 * @author Robert Soule
 * @version $Revision: 1.17 $
 */
public class Watson extends Brooklet {
  /** Create a new driver for Watson. */
  public Watson() {
    // Nothing to do.
  }

  @Override
  public String getName() {
    return "xtc Watson Driver";
  }

  @Override
  public String getCopy() {
    return Constants.FULL_COPY;
  }

  @Override
  public void init() {
    super.init();
    runtime.word("templatePath", "templatePath", false,
        "The path to the template directory.").word("appName", "appName",
        false, "The name or the application directory.").word("outputPath",
        "outputPath", false, "The path to the output directory.").word(
        "logLevel", "logLevel", false, "Specify the log level for System S.")
        .word("host", "host", false, "Specify the host machine for execution.")
        .word("hostFile", "hostFile", false,
            "Specify the file with the host machine names for execution.")
        .word("user", "user", false,
            "Specify the user who will submit the System S job.").bool(
            "toSystemS", "toSystemS", false,
            "Translate to the System S runtime.");
  }

  @Override
  public void process(Node node) {
    super.process(node);
    // Translate to System S runtime
    if (runtime.test("toSystemS")) {
      String basedir = (String) runtime.getValue("outputPath");
      if (null == basedir) {
        basedir = "./";
      }
      List<String> hosts;
      String hostFileName = (String) runtime.getValue("hostFile");
      if (null != hostFileName) {
        hosts = readHostFile(hostFileName);
        if (hosts == null) {
          System.exit(1);
        }
      } else {
        hosts = new ArrayList<String>();
        String hostname = (String) runtime.getValue("host");
        if (null == hostname) {
          hosts.add("a0217b08e1.hny.distillery.ibm.com");
        } else {
          hosts.add(hostname);
        }
      }
      String username = (String) runtime.getValue("user");
      if (null == username) {
        username = "souler";
      }
      String templatePath = (String) runtime.getValue("templatePath");
      if (null == templatePath) {
        templatePath = "./templates";
      }
      String appName = (String) runtime.getValue("appName");
      if (null == appName) {
        appName = "MyApp";
      }
      String logLevel = (String) runtime.getValue("logLevel");
      if (null == logLevel) {
        logLevel = "debug";
      }

      EquivalenceClassFinder.Result equivalenceClasses = new EquivalenceClassFinder().analyze(node);
      new BrookletToSystemS(runtime, runtime.console(), basedir, hosts,
                            username, templatePath, appName, logLevel, equivalenceClasses).translate(node);
      runtime.console().pln().flush();

    }
  }

  List<String> readHostFile(String hostFileName) {
    File file = new File(hostFileName);
    FileInputStream fis = null;
    BufferedInputStream bis = null;
    BufferedReader br = null;
    List<String> hosts = new ArrayList<String>();
    try {
      fis = new FileInputStream(file);
      bis = new BufferedInputStream(fis);
      br = new BufferedReader(new InputStreamReader(bis)); 
      String thisLine = null;
      while ((thisLine = br.readLine()) != null) {
        hosts.add(thisLine);
      }
      fis.close();
      bis.close();
      br.close();
    } catch (FileNotFoundException e) {
      System.err.println("Cannot read host file: " + hostFileName);
      return null;
    } catch (IOException e) {
      System.err.println("Cannot read host file" + hostFileName);
      return null;
    }
    return hosts;
  }

  /**
   * Run the driver with the specified command line arguments.
   * 
   * @param args
   *          The command line arguments.
   */
  public static void main(String[] args) {
    new Watson().run(args);
  }
}
