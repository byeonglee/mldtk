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

import java.util.Iterator;
import java.util.List;
import java.util.LinkedList;
import java.util.Properties;
import java.util.Map;
import java.util.HashMap;

import java.util.logging.Logger;
import java.util.logging.Level;
/**
 * <p /> A request handler pool is responsible for instantiating
 * request handlers. This pool contains a list of request handlers
 * based on properties of a request.
 *
 * <p /> To start a request handler pool, a server must initialize 2
 * parameters:
 * <ul>
 *           <li> <i>PoolSize</i>, using method
 *           {@link #setPoolSize(int poolSize)}.
 *           This method sets initial size for each type of a
 *           request handler's pool.</li>
 *
 *           <li> <i>Mapping</i>,
 *           using method {@link #setHandlerMapping(Properties mapping)}.
 *           This method sets mapping between type of a resource name
 *           that must be processed and corresponding implementation of
 *           a request handler that will process
 *           this request.</li>
 * </ul>
 *
 * <p />Once, both parameters have been set, a server is able to start
 * using this request handler pool.  2 main methods of a request
 * handler pool are:
 *
 * <ul>
 *              <li>{@link #instantiateRequestHandler(Request request)}.
 *              This method analyzes resource name of a request and
 *              returns appropriate request handler to process it.</li>
 *
 *              <li>{@link #returnRequestHandler(RequestHandler handler)}.
 *              This method returns current request handler back to the pool,
 *              if this pool has not been totally filled.</li>
 * </ul>
 *
 * <p /> Since it is used in an event-driven HTTP Server, it is not
 * synchronized.  It should be explicitly synchronized if it is used
 * in a multiple-threaded environment or in another HTTP Server.
 *
 * @see RequestHandler
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.6 $
 */
public class RequestHandlerPool {

  /** Default handler that is used to process uncategorized request. */
  private Handler defaultHandler;

  /** Mapping between resource type and appropriate handler data structure. */
  private Map resourceMap = new HashMap();

  /** Mapping between handler class and appropriate handler data structure. */
  private Map classMap  = new HashMap();

  /** Name of this class. */
  private String className = this.getClass().toString();

  /** Default logger used by the server. */
  private Logger logger;

  /** Size of each request handler's pool. */
  private int poolSize;

  /**
   * Instantiate request handler pool.
   *
   * @param logger Default logger used by the server.
   */
  public RequestHandlerPool(Logger logger) {
    this.logger = logger;
  }

  /**
   * Set pool size for each type of a request handler pool.
   *
   * @param poolSize New pool size for each request handler pool.
   */
  public void setPoolSize(int poolSize) {
    this.poolSize = poolSize;
  }

  /**
   * Set initial mapping between type of a request's resource name and
   * corresponding request handler.
   *
   * @param mapping Mapping between type of a resource name and corresponding
   *                request handler.
   */
  public void setHandlerMapping(Properties mapping) {
    Iterator keys = mapping.keySet().iterator();
    while (keys.hasNext()) {
      Handler handler = new Handler();
      handler.name = (String)keys.next();
      try {
        handler.k         = Class.forName(mapping.getProperty(handler.name));
        handler.instances = new LinkedList();
        for (int i=0; i<poolSize; i++) {
          handler.instances.add(handler.k.newInstance());
        }
      } catch (ClassNotFoundException ce) {
        logger.logp(Level.FINEST, className, "setHandlerMapping()",
          "ClassNotFoundException is thrown while instantiating one of the " +
          " request handlers used by this server.");
      } catch (InstantiationException ie) {
        logger.logp(Level.FINEST, className, "setHandlerMapping()",
          "InstantiationException is thrown while instantiating one of the " +
          " request handlers used by this server.");
      } catch (IllegalAccessException ie) {
        logger.logp(Level.FINEST, className, "setHandlerMapping()",
          "IllegalAccessException is thrown while instantiating one of the " +
          " request handlers used by this server.");
      }

      if ("/*".equals(handler.name)) {
        defaultHandler = handler;
      } else {
        resourceMap.put(handler.name, handler);
        classMap.put(handler.k, handler);
      }
    }
  }

  /**
   * Instantiate a request handler based on type its request's resource name.
   *
   * @param request Current request.
   * @return Returns instantiated request handler.
   */
  public RequestHandler instantiateRequestHandler(Request request) {
    String name = request.getResourceName();

    Handler h = (Handler)resourceMap.get(name);
    if (null == h) {
      h = defaultHandler;
    }

    if (h.instances.isEmpty()) {
      try {
        return (RequestHandler)h.k.newInstance();
      } catch (Exception x) {
        logger.logp(Level.FINEST, className, "setHandlerMapping()",
          "Unable to instantiate additional request handler " +
          " of type "  + h.k.toString());
        return null;
      }
    } else {
      return (RequestHandler)h.instances.remove(0);
    }
  }

  /**
   * Return request handler back to a request handlers pool.
   *
   * @param handler Returning request handler.
   */
  public void returnRequestHandler(RequestHandler handler) {
    Handler h = (Handler)classMap.get(handler.getClass());
    if (null == h) {
      h = defaultHandler;
    }

    if (h.instances.size() < poolSize) {
      h.instances.add(handler);
    }
  }

  /**
   * Handler data structure is used in request handler pool to match resource
   * type to corresponding request handler class and corresponding list of
   * request handler instances.
   */
  private static class Handler {

    /** The resource type. */
    public String name;

    /** The corresponding request handler class. */
    public Class  k;

    /** The list of request handler instances. */
    public List   instances;
  }
}
