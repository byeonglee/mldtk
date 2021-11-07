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
import java.util.Collection;

/**
 * 
 * @author Nalini Belaramani
 * @version
 */
public interface Table {
  public void insert(Tuple t);

  public void delete(Tuple t);

  public int size();

  public Object[] getAggregate(AggregateType aType, int term);

  public Object[] getAggregate(AggregateType aType, int term, int numAgg);

  public Table pickRandom(int numb);

  public Table match(Constraint[] cArray);

  public Iterator<Tuple> iterator();

  public Collection<Tuple> elements();
}
