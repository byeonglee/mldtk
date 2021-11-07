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

/**
 * Encapuslation of the seqNum
 * 
 * @author Nalini Belaramani
 * @version
 */
public class SeqNum implements Marshaller<SeqNum> {
  private int epochNum;
  private int seq;

  /**
   * Constructor
   */
  public SeqNum(int epochNum) {
    this.epochNum = epochNum;
    this.seq = 0;
  }

  /**
   * Constructor - called when reading the object from the stream
   */
  public SeqNum() {
    this.epochNum = 0;
    this.seq = 0;
  }

  /**
   * Constructor - called when reading the object from the stream
   */
  private SeqNum(int epochNum, int seq) {
    this.epochNum = epochNum;
    this.seq = seq;
  }

  /**
   * increment
   */
  public void increment() {
    seq++;
  }

  /**
   * getEpoch
   */
  public int getEpoch() {
    return epochNum;
  }

  /**
   * getSeq
   */
  public int getValue() {
    return seq;
  }

  /**
   * compareTo
   */
  public int compareTo(Object o) {
    SeqNum otherSeq = (SeqNum) o;
    int res = this.epochNum - otherSeq.epochNum;
    if (res != 0)
      return res;
    res = this.seq = otherSeq.seq;
    return res;
  }

  /**
   * write object to a stream
   */
  public void writeToStream(SeqNum s, DataOutputStream dos) throws IOException {
    dos.writeInt(s.epochNum);
    dos.writeInt(s.seq);
  }

  /**
   * read object from a stream
   */
  public SeqNum readFromStream(DataInputStream dis) throws IOException {
    int r_epochNum = dis.readInt();
    int r_seq = dis.readInt();
    return new SeqNum(r_epochNum, r_seq);
  }

  @Override
  public String toString() {
    return "" + epochNum + ":" + seq;
  }
}
