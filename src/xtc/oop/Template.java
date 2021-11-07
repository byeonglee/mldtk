/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2006 Robert Grimm
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
package xtc.oop;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import xtc.tree.GNode;

/**
 * Skeleton of a template processor to illustrate reflection.
 *
 * @author Robert Grimm
 */
public class Template {

  /**
   * Process the specified string with the specified context.
   *
   * @param in The string.
   * @param context The context.
   */
  public static String process(String in, GNode context) {

    {
      String name1 = null;
      String name2 = null;

      Object container = context.getProperty(name1);

      Method m;
      try {
        // Desugared: getMethod("cpp" + name2, new Class[] {});
        m = container.getClass().getMethod("cpp" + name2);
        m.setAccessible(true);
      } catch (NoSuchMethodException x) {
        throw new IllegalArgumentException(x);
      }

      Object result;
      try {
        result = m.invoke(container);
      } catch (InvocationTargetException x) {
        throw new IllegalStateException(x.getCause());
      } catch (IllegalAccessException x) {
        // We set accessible to true above, this exception should
        // never happen.
        throw new AssertionError();
      }
    }

    return null;
  }

}