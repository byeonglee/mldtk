/*
 * Munin
 * Copyright (C) 2003 New York University, Department of Computer Science.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
package edu.nyu.cs.web;

import java.util.logging.Logger;
/**
 * Definition of common services used by a HTTP request handler.
 *
 * @see    RequestHandler
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.11 $
 */
public interface Runtime {

  /**
   * Return a class to parse and format dates.
   *
   * <p />Note that <code>InternetDate</code>'s methods are not
   * thread-safe. In a multi-threaded environment, callers of
   * <code>InternetDate</code>'s methods should synchronize on the
   * returned object.
   *
   * @return A class to parse and format dates.
   */
  public InternetDate date();

  /**
   * Return a class to log messages.
   *
   * <p />At a minimum, a request handler should log each request at
   * the {@link java.util.logging.Level#INFO} level, using the <a
   * href="http://www.bacuslabs.com/WsvlCLF.html">Common Log
   * Format</a>. Request and response headers may be logged at the
   * {@link java.util.logging.Level#FINER} level. Additional
   * implementation details should be logged at the {@link
   * java.util.logging.Level#FINEST} level. Note that there is no
   * agreed-on format for logging implementation details.
   *
   * @return A message logger.
   */
  public Logger log();

  /**
   * Return a class to store and retrieve resources from runtime memory, <i>Cache</i>.
   *
   * <p /> This class is an implementation of server's cache. It stores
   * commonly used resources (files) in memory for faster retrieval.
   *
   * @see Cache
   * @return Local cache.
   */
  public Cache cache();

  /**
   * Return a class to store and retrieve byte buffers used in this
   * <code>Runtime</code>.
   *
   * @see ByteBufferPool
   * @return Pool of byte buffers
   */
  public ByteBufferPool pool();
}
