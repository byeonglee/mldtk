/*
 * OverlogRuntime - A Java Runtime for Overlog
 * Copyright (C) 2008 The University of Texas at Austin
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
package xtc.lang.overlog.runtime;

import java.util.Hashtable;

/**
 * Main Java class for an overlog file - initializes tables, events, eventqueue,
 * communication - starts/shutsdown the runtime
 * 
 * @author Nalini Belaramani
 * @version
 */
public abstract class OLG {
  protected NetAddr myAddr;
  protected EventQueue eQueue;
  protected String epochFile;
  protected PeriodicEventGenerator peg;
  protected CommunicationModule cMod;
  protected EventWorker eWorker;
  protected Hashtable<ID, Table> tables = new Hashtable<ID, Table>();
  @SuppressWarnings("unchecked")
  protected Hashtable<ID, Marshaller> marshallers = new Hashtable<ID, Marshaller>();
  protected MultiEntryTable<ID, EventHandler> handlers = new MultiEntryTable<ID, EventHandler>();
  public boolean shutdown = false;
  public boolean cleanShutdown = false;
  public static boolean dbg = false;

  /**
   * constructor
   */
  public OLG(String host, int port) {
    this(host, port, null);
  }

  /**
   * constructor
   */
  public OLG(String host, int port, String epochFile) {
    this(new NetAddr(host, port), epochFile);
  }

  /**
   * constructor
   */
  public OLG(NetAddr netAddr, String epochFile) {
    myAddr = netAddr;
    this.epochFile = epochFile;
    eQueue = new EventQueue(myAddr, tables);
    peg = new PeriodicEventGenerator(eQueue);
    cMod = new CommunicationModule(myAddr, eQueue, marshallers, epochFile);
    eQueue.setCommunicationModule(cMod);
    eWorker = new EventWorker(eQueue, tables, handlers);
    // basic initalization
    marshallers.put(IDMap.getId("msgDropped"), new MsgDroppedTuple());
    // cutomized initialization
    initialize();
  }

  /**
   * constructor
   */
  public OLG(NetAddr netAddr, String epochFile, boolean dbg) {
    this(netAddr, epochFile);
    OLG.dbg = dbg;
  }

  /**
   * Basically sets up the runtime to run the overlog logic initializes the
   * tables, eventhandlers, marshallers, etc
   */
  public abstract void initialize();

  /**
   * starts the overlog over the runtime
   */
  public void start() {
    if (dbg)
      System.out.println("Starting OLG");
    eQueue.start();
    cMod.start();
    peg.start();
    eWorker.start();
  }

  /**
   * shuts down the runtime
   */
  public void shutdown() {
    shutdown = true;
    cMod.shutdown();
    peg.shutdown();
    eWorker.shutdown();
    eQueue.shutdown();
  }

  /**
   * clean shutdown - waits for the Queue to be empty before - calling shutdown
   */
  public void cleanShutdown() {
    if (cleanShutdown == true) {
      if (dbg)
        System.out.println("clean shutdown has already been called");
      return;
    }
    cleanShutdown = true;
    System.out.println("*** Shutdown Called *****");
    eQueue.waitTillEmpty();
    shutdown();
  }

  /**
   * insert a tuple in the queue called by practi
   */
  public void insert(Tuple t) {
    eQueue.add(t);
  }

  /**
   * subscribe for an tuple - called by practi
   */
  public void subscribe(ID id, Subscriber s) {
    eQueue.subscribe(id, s);
  }
}
