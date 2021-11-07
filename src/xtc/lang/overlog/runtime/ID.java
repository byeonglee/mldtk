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

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

/**
 * 
 * @author Nalini Belaramani
 * @version
 */
public class ID implements Comparable<Object>, Marshaller<ID> {
  short id_;

  /**
   * Constructor
   */
  public ID(short id_) {
    this.id_ = id_;
  }

  /**
   * Called before when reading from stream
   */
  public ID() {
    this.id_ = 0;
  }

  public ID(String str) {
    this.id_ = (new Integer(str.hashCode())).shortValue();
  }

  /**
   *compare to
   */
  public int compareTo(Object o) {
    ID other = (ID) o;
    return (this.id_ - other.id_);
  }

  /**
   * equals
   */
  @Override
  public boolean equals(Object o) {
    if (compareTo(o) == 0) {
      return true;
    } else
      return false;
  }

  /**
   * hashCode
   */
  @Override
  public int hashCode() {
    return id_;
  }

  /**
   * Reads the object from an input stream
   */
  public ID readFromStream(DataInputStream is) throws IOException {
    short s = is.readShort();
    return new ID(s);
  }

  /**
   * Writes the current object to the stream
   */
  public void writeToStream(ID id, DataOutputStream os) throws IOException {
    os.writeShort(id.id_);
  }

  /**
   * to string
   */
  @Override
  public String toString() {
    String str = "" + id_;
    return str;
  }
}
