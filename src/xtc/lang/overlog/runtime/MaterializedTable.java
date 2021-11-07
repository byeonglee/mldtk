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

import java.util.TreeMap;
import java.util.Iterator;
import java.util.Hashtable;
import java.util.TreeSet;
import java.util.ArrayList;
import java.util.Collection;
import java.lang.ArrayIndexOutOfBoundsException;

/**
 * Materialized table - implementation of a materialized table
 * 
 * Note: currently we assume single thread handling events in the system. so
 * there is no need to use lock. if we change it to multithread, we will need to
 * incorporate locking for readers and writers in the system.
 * 
 * @author Nalini Belaramani
 * @version
 */
public class MaterializedTable implements Table {
  private ID tableID;
  private long lifeTime = Long.MAX_VALUE;
  private long maxSize = Long.MAX_VALUE;
  private int[] keys;
  // the tuples accesible by key
  // i.e. TableKey -> tuple
  private Hashtable<TableKey, Tuple> entries = new Hashtable<TableKey, Tuple>();
  // the insertion times of various keys
  // i.e. tableKey -> insertionTime
  private Hashtable<TableKey, Long> entryInsertion = new Hashtable<TableKey, Long>();
  // sortedInsertTimes
  // i.e insertTime -> key
  private TreeMap<Long, TableKey> keysByTime = new TreeMap<Long, TableKey>();
  private static boolean dbg = OLG.dbg;

  /**
   * constructor
   */
  public MaterializedTable(ID tableID_, long lifeTimeInSec_, long maxSize_,
      int[] keys_) {
    tableID = tableID_;
    if (lifeTimeInSec_ != Long.MAX_VALUE)
      lifeTime = lifeTimeInSec_ * 1000;
    maxSize = maxSize_;
    keys = keys_;
  }

  /**
   * returns the key for the tuples
   */
  public TableKey getKey(Tuple t) {
    try {
      Object[] tKeys = new Object[keys.length];
      for (int i = 0; i < keys.length; i++) {
        // decrement value of the key by one, since
        // Overlog starts initial value at 1 not 0.
        tKeys[i] = t.getTerm(keys[i] - 1);
      }
      return new TableKey(tKeys);
    } catch (ArrayIndexOutOfBoundsException e) {
      System.out.println("Error: accessing out of bound term for tuple " + t);
    }
    return null;
  }

  /**
   * inserts a tuple into the table
   */
  public synchronized void insert(Tuple t) {
    // check if the id of the inserted tuple
    if (!t.getId().equals(tableID)) {
      if (dbg)
        System.out.println("MaterializedTable: tuple id "
            + IDMap.getString(t.getId()) + "does not match table id "
            + IDMap.getString(tableID));
      return;
    }
    long currTime = System.currentTimeMillis();
    // remove any expired entries
    cleanExpired();
    // make space for this entry if the table has reached max capacity
    if (entries.size() >= maxSize) {
      makeSpace();
    }
    // insert it in entries
    TableKey tupleKey = getKey(t);
    entries.put(tupleKey, t);
    if (dbg) {
      System.out.println("MaterializedTable:: inserted " + t);
    }
    // check for previous insert time and remove it from keysByTime queue
    Long oldInsertTime = entryInsertion.get(tupleKey);
    if (oldInsertTime != null) {
      keysByTime.remove(oldInsertTime);
    }
    entryInsertion.put(tupleKey, currTime);
    keysByTime.put(currTime, tupleKey);
    // System.out.println("keysByTime" +keysByTime);
    // System.out.println("entryInsertion" +entryInsertion);
  }

  /**
   * Cleans expired tuples
   */
  private synchronized void cleanExpired() {
    // if max value then we don't need to clean anything
    if (lifeTime == Long.MAX_VALUE)
      return;
    long cutoffTime = System.currentTimeMillis() - lifeTime;
    // System.out.println("cutoffTime: " + cutoffTime);
    Long smallestInsertLong;
    try {
      smallestInsertLong = keysByTime.firstKey();
      while (smallestInsertLong.longValue() < cutoffTime) {
        TableKey key = keysByTime.remove(smallestInsertLong);
        entries.remove(key);
        entryInsertion.remove(key);
        smallestInsertLong = keysByTime.firstKey();
      }
    } catch (java.util.NoSuchElementException e) {
      // e.printStackTrace();
      return;
    }
  }

  /**
   * Removes old entries so that we can make space for one more -- removes the
   * oldest entries
   */
  private void makeSpace() {
    while (entries.size() >= maxSize) {
      Long smallestInsertLong = keysByTime.firstKey();
      TableKey key = keysByTime.remove(smallestInsertLong);
      entries.remove(key);
      entryInsertion.remove(key);
    }
  }

  /**
   * Deletes a tuple from the table
   */
  public synchronized void delete(Tuple t) {
    // check tableId
    if (!t.getId().equals(tableID))
      return;
    // remove from table
    TableKey tupleKey = getKey(t);
    if (tupleKey != null) {
      entries.remove(tupleKey);
      Long insertTime = entryInsertion.remove(tupleKey);
      if (insertTime != null) {
        keysByTime.remove(insertTime);
      }
    }
  }

  /**
   * Returns the iterator for tuples stored in the table
   */
  public Iterator<Tuple> iterator() {
    // first clean all expired tuples
    cleanExpired();
    return entries.values().iterator();
  }

  /**
   * Returns the collection view of the tuples
   */
  public Collection<Tuple> elements() {
    // first clean all expired tuples
    cleanExpired();
    return entries.values();
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
    cleanExpired();
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
    if (numAgg < 1) {
      System.out.println("ERROR:: numAgg for getAggregate smaller than 1");
      return null;
    }
    cleanExpired();
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
    ArrayList<TableKey> aList = new ArrayList<TableKey>(entries.keySet());
    Iterator<Integer> i = numSet.iterator();
    while (i.hasNext()) {
      res.insert(entries.get(aList.get(i.next())));
    }
    return res;
  }
}
