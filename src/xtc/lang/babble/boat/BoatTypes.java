/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2010 New York University
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
package xtc.lang.babble.boat;

import xtc.typical.Tuple;
import xtc.typical.Variant;

public class BoatTypes {
  /** Implementation of constructor 'BoolT' in variant 'raw_type'. */
  public static class BoolT extends raw_type<Tuple.T0> {
    public BoolT() {
      tuple = new Tuple.T0();
    }

    @Override
    public final Tag tag() {
      return Tag.BoolT;
    }

    public boolean isBoolT() {
      return true;
    }

    @Override
    public String getName() {
      return "BoolT";
    }

    @Override
    public String toString() {
      return "BoolT";
    }
  }

  /** Implementation of constructor 'IntT' in variant 'raw_type'. */
  public static class IntT extends raw_type<Tuple.T0> {
    public IntT() {
      tuple = new Tuple.T0();
    }

    @Override
    public final Tag tag() {
      return Tag.IntT;
    }

    public boolean isIntT() {
      return true;
    }

    @Override
    public String getName() {
      return "IntT";
    }

    @Override
    public String toString() {
      return "IntT";
    }
  }

  /** Implementation of constructor 'FloatT' in variant 'raw_type'. */
  public static class FloatT extends raw_type<Tuple.T0> {
    public FloatT() {
      tuple = new Tuple.T0();
    }

    @Override
    public final Tag tag() {
      return Tag.FloatT;
    }

    public boolean isFloatT() {
      return true;
    }

    @Override
    public String getName() {
      return "FloatT";
    }

    @Override
    public String toString() {
      return "FloatT";
    }
  }

  /** Implementation of constructor 'StringT' in variant 'raw_type'. */
  public static class StringT extends raw_type<Tuple.T0> {
    public StringT() {
      tuple = new Tuple.T0();
    }

    @Override
    public final Tag tag() {
      return Tag.StringT;
    }

    public boolean isStringT() {
      return true;
    }

    @Override
    public String getName() {
      return "StringT";
    }

    @Override
    public String toString() {
      return "StringT";
    }
  }

  /** Implementation of constructor 'WildcardT' in variant 'raw_type'. */
  public static class WildcardT extends raw_type<Tuple.T0> {
    public WildcardT() {
      tuple = new Tuple.T0();
    }

    @Override
    public final Tag tag() {
      return Tag.WildcardT;
    }

    public boolean isWildcardT() {
      return true;
    }

    @Override
    public String getName() {
      return "WildcardT";
    }

    @Override
    public String toString() {
      return "WildcardT";
    }
  }

  public class UnitT extends raw_type<Tuple.T0> {
    public UnitT() {
      tuple = new Tuple.T0();
    }

    @Override
    public final Tag tag() {
      return Tag.UnitT;
    }

    @Override
    public boolean isUnitT() {
      return true;
    }

    @Override
    public String getName() {
      return "UnitT";
    }

    @Override
    public String toString() {
      return "UnitT";
    }
  }

  /** Superclass of all constructors in variant 'raw_type'. */
  public static abstract class raw_type<T extends Tuple> extends Variant<T> {
    public static enum Tag {
      UnitT, BoolT, IntT, FloatT, StringT, WildcardT
    }

    protected raw_type() {
    }

    public abstract Tag tag();

    public boolean isUnitT() {
      return false;
    }
  }

  private BoatTypes() {
  }
}
