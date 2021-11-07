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

import java.io.*;
import java.util.*;

/**
 * 
 * @author Nalini Belaramani
 * @version
 */
public class NetAddr implements Marshaller<NetAddr> {
  private String dns;
  private int port;

  /**
   * Constructor
   */
  public NetAddr(String dns, int port) {
    this.port = port;
    this.dns = dns;
  }

  /**
   * Constructor: assumes in the format "dns:port"
   */
  public NetAddr(String addr) {
    StringTokenizer stk = new StringTokenizer(addr, ":");
    assert (stk.countTokens() >= 2);
    this.dns = stk.nextToken();
    this.port = (new Integer(stk.nextToken())).intValue();
  }

  /**
   * Constructor - called when reading from a stream
   */
  public NetAddr() {
    this.port = 0;
    this.dns = null;
  }

  /**
   * Equals: compares another object to this
   */
  @Override
  public boolean equals(Object addr) {
    if ((addr instanceof NetAddr) && port == ((NetAddr) addr).getPort()
        && dns.equalsIgnoreCase(((NetAddr) addr).getHost())) {
      return true;
    }
    return false;
  }

  /**
   * Returns the hashcode for NetAddr
   */
  @Override
  public int hashCode() {
    Integer p = new Integer(port);
    return (p.hashCode() + 100 * dns.hashCode());
  }

  /**
   * toString: generates a string representation of the addr
   */
  @Override
  public String toString() {
    return (dns + ":" + port);
  }

  /**
   * getPort: returns the port
   */
  public int getPort() {
    return port;
  }

  /**
   * getHost: returns the hostname address
   */
  public String getHost() {
    return dns;
  }

  /**
   * write object to a stream
   */
  public void writeToStream(NetAddr addr, DataOutputStream dos)
      throws IOException {
    // write dns as UTFbytes
    dos.writeUTF(addr.dns);
    // write port
    dos.writeInt(addr.port);
  }

  /**
   * read object from a stream
   */
  public NetAddr readFromStream(DataInputStream dis) throws IOException {
    // read dns
    String r_dns = dis.readUTF();
    int r_port = dis.readInt();
    return new NetAddr(r_dns, r_port);
  }
}
