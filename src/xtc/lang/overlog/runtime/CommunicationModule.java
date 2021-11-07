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
import java.io.*;

/**
 * 
 * @author Nalini Belaramani
 * @version
 */
public class CommunicationModule {
  private String epochFile;
  private EventReceiver eReceiver;
  private EventSender eSender;
  private int currEpoch = -1;
  public static boolean dbg = OLG.dbg;

  /**
   * Constructor without an epoch file
   */
  @SuppressWarnings("unchecked")
  public CommunicationModule(NetAddr myAddr, EventQueue eQueue,
      Hashtable<ID, Marshaller> marshallers) {
    this(myAddr, eQueue, marshallers, null);
  }

  /**
   * Constructor
   */
  @SuppressWarnings("unchecked")
  public CommunicationModule(NetAddr myAddr, EventQueue eQueue,
      Hashtable<ID, Marshaller> marshallers, String epochFile) {
    this.epochFile = epochFile;
    readAndUpdateEpoch();
    if (dbg) {
      System.out.println("Communication Module:: currEpoch=" + currEpoch);
    }
    eSender = new EventSender(myAddr, marshallers, currEpoch);
    eReceiver = new EventReceiver(myAddr, eQueue, marshallers);
  }

  private void readAndUpdateEpoch() {
    if (epochFile == null) {
      return;
    }
    int lastEpoch = -1;
    DataInputStream dis = null;
    try {
      // read last epoch fromfile
      dis = new DataInputStream(new BufferedInputStream(new FileInputStream(
          epochFile)));
      lastEpoch = dis.readInt();
      dis.close();
    } catch (FileNotFoundException e) {
      // ignore, we can write it out
    } catch (IOException ioe) {
      System.out.println("Problem reading epoch file");
      ioe.printStackTrace();
    }
    try {
      // update epoch number
      currEpoch = lastEpoch + 1;
      // write current epoch number to file
      DataOutputStream dos = new DataOutputStream(new BufferedOutputStream(
          new FileOutputStream(epochFile)));
      dos.writeInt(currEpoch);
      // dos.flush();
      dos.close();
    } catch (Exception e) {
      System.out.println("Problem writing epoch file");
      e.printStackTrace();
    }
  }

  /**
   * Start
   */
  public void start() {
    eReceiver.start();
  }

  /**
   * Shutdown
   */
  public void shutdown() {
    eReceiver.shutdown();
    eSender.shutdown();
    if (dbg)
      System.out.println("Communication Module shutdown");
  }

  /**
   * send tuple
   */
  public void send(Tuple t) {
    eSender.send(t);
  }
}
