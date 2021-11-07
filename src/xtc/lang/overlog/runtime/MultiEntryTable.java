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
import java.util.LinkedList;
import java.util.Iterator;

/**
 * a hash table of linked list so that each entry can map to multiple values
 * 
 * @author Nalini Belaramani
 * @version
 */
public class MultiEntryTable<X, Y> {
  @SuppressWarnings("unchecked")
  Hashtable<X, LinkedList> table = new Hashtable<X, LinkedList>();

  /**
   * constructor
   */
  public MultiEntryTable() {
  }

  /**
   * put
   */
  @SuppressWarnings("unchecked")
  public void put(X key, Y value) {
    LinkedList list = table.get(key);
    if (list == null) {
      list = new LinkedList<Y>();
      table.put(key, list);
    }
    list.add(value);
  }

  /**
   * getIterator
   */
  @SuppressWarnings("unchecked")
  public Iterator<Y> getIterator(X key) {
    LinkedList list = table.get(key);
    if (list != null) {
      return list.iterator();
    }
    return null;
  }
}
