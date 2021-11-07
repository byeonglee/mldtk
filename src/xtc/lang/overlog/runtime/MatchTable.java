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

import java.util.Iterator;
import java.util.HashSet;
import java.util.TreeSet;
import java.util.ArrayList;
import java.util.Collection;

/**
 * Match table - implementation of a simple table without IDs, expiry time.
 * 
 * @author Nalini Belaramani
 * @version
 */
public class MatchTable implements Table {
  // The entries in the table
  private HashSet<Tuple> entries = new HashSet<Tuple>();

  /**
   * inserts a tuple into the table
   */
  public synchronized void insert(Tuple t) {
    entries.add(t);
  }

  /**
   * Deletes a tuple from the table
   */
  public synchronized void delete(Tuple t) {
    entries.remove(t);
  }

  /**
   * Returns the iterator for tuples stored in the table
   */
  public Iterator<Tuple> iterator() {
    return entries.iterator();
  }

  /**
   * Returns all the elements in the table
   */
  public Collection<Tuple> elements() {
    return entries;
  }

  /**
   * Returns a matchTable for the tuples that match the constraint
   */
  public synchronized Table match(Constraint[] cArray) {
    Table resTable = new MatchTable();
    // TODO: Need to fill in implementation this method is needed
    return resTable;
  }

  /**
   * returns the number of tuples in the table
   */
  public synchronized int size() {
    return entries.size();
  }

  /**
   * Gets a single aggregate (MIN, MAX or AVG)
   */
  public synchronized Object[] getAggregate(AggregateType aType, int termNum) {
    return getAggregate(aType, termNum, 1);
  }

  /**
   * Gets multiple aggregates Note: for average: it only returns a single value
   */
  public synchronized Object[] getAggregate(AggregateType aType, int termNum,
      int numAgg) {
    switch (aType) {
    case MIN:
      return findMin(termNum, numAgg);
    case MAX:
      return findMax(termNum, numAgg);
    case AVG:
      return findAvg(termNum);
    }
    return null;
  }

  /**
   * finds "numAgg" minimum values of the "termNum"th term in the tuple
   */
  @SuppressWarnings("unchecked")
  private Object[] findMin(int termNum, int numAgg) {
    TreeSet resSet = new TreeSet();
    Object currMax = null;
    Object tTerm = null;
    Iterator<Tuple> i = this.iterator();
    while (i.hasNext()) {
      tTerm = i.next().getTerm(termNum);
      if (resSet.size() < numAgg) {
        resSet.add(tTerm);
        currMax = resSet.last();
      } else if (((Comparable) tTerm).compareTo(currMax) < 0) {
        resSet.remove(currMax);
        resSet.add(tTerm);
        currMax = resSet.last();
      }
    }
    if (resSet.size() > 0) {
      return resSet.toArray();
    } else {
      return null;
    }
  }

  /**
   * finds "numAgg" max values of the "termNum"th term in the tuple
   */
  @SuppressWarnings("unchecked")
  private Object[] findMax(int termNum, int numAgg) {
    TreeSet resSet = new TreeSet();
    Object currMin = null;
    Object tTerm = null;
    Iterator<Tuple> i = this.iterator();
    while (i.hasNext()) {
      tTerm = i.next().getTerm(termNum);
      if (resSet.size() < numAgg) {
        resSet.add(tTerm);
        currMin = resSet.first();
      } else if (((Comparable) tTerm).compareTo(currMin) > 0) {
        resSet.remove(currMin);
        resSet.add(tTerm);
        currMin = resSet.first();
      }
    }
    if (resSet.size() > 0) {
      Object[] resArray = new Object[resSet.size()];
      int ii = resSet.size() - 1;
      for (Object obj : resSet) {
        resArray[ii--] = obj;
      }
      return resArray;
    } else {
      return null;
    }
  }

  /**
   * Returns the average for Integer for float terms All other types return null
   */
  private Object[] findAvg(int termNum) {
    int intTotal = 0;
    float floatTotal = 0;
    boolean isFloat = false;
    Object tTerm = null;
    Iterator<Tuple> i = this.iterator();
    while (i.hasNext()) {
      tTerm = i.next().getTerm(termNum);
      if (tTerm instanceof Integer) {
        intTotal += ((Integer) tTerm).intValue();
      } else if (tTerm instanceof Float) {
        floatTotal += ((Float) tTerm).floatValue();
        isFloat = true;
      } else {
        return null;
      }
    }
    Object[] res = new Object[1];
    if (isFloat) {
      res[0] = new Float(floatTotal / entries.size());
    } else {
      res[0] = new Integer(intTotal / entries.size());
    }
    return res;
  }

  /**
   * Pics <num> entries from the table and returns them as a table.
   */
  public synchronized Table pickRandom(int num) {
    Table res = new MatchTable();
    // pick num random intetgers
    TreeSet<Integer> numSet = new TreeSet<Integer>();
    while (numSet.size() < num) {
      int r = (int) (Math.random() * entries.size());
      numSet.add(new Integer(r));
    }
    ArrayList<Tuple> aList = new ArrayList<Tuple>(entries);
    Iterator<Integer> i = numSet.iterator();
    while (i.hasNext()) {
      res.insert(aList.get(i.next()));
    }
    return res;
  }
}
