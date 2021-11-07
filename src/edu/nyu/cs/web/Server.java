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

import java.io.FileInputStream;
import java.io.IOException;

import java.net.InetSocketAddress;
import java.net.ServerSocket;

import java.nio.ByteBuffer;

import java.nio.channels.Selector;
import java.nio.channels.SelectionKey;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.Properties;

import java.util.logging.Level;
import java.util.logging.Logger;
/**
 * Implementation of an event-driven HTTP server.
 *
 * <p /> This server accepts connections on a specified port, parses data
 * to a HTTP request, and uses one of the implementations of
 * request handler to generate HTTP response.
 *
 * <p /> The relationship between a server and a request handler is described
 * in an interface {@link edu.nyu.cs.web.RequestHandler}.
 *
 * <p /> To start running this server, method {@link #run()} should be invoked.
 *
 * <p /> This class also provides a main() method which starts this server.
 * The default port number for this server is 8080. To
 * change default HTTP port, modify property <i>HTTPPort</i> in a
 * <b>munin.config</b> file.
 *
 * <p /> Since it is used in an event-driven HTTP Server, it is not
 * synchronized.  It should be explicitly synchronized if it is used
 * in a multiple-threaded environment or in another HTTP Server.
 *
 * @see Runtime
 * @see RequestHandler
 *
 * @author Dmitriy Mindich.
 * @version $Revision: 1.38 $
 */
public class Server implements Runtime {

  /** Server port number. */
  private int httpPort = 8080;

  /** Server host name. */
  private String hostName = "0.0.0.0";

  /* Time to block for server's selector, while channel becomes ready. */
  private static int timeOut = 10 * 60 * 1000;

  /** Name of server configuration file. */
  public static final String configurationFile = "munin.config";

  /** The socket for accepting connections. */
  private ServerSocketChannel server;

  /** The selector for the server's socket. */
  private Selector selector;

  /** Name of this class. */
  private String className = this.getClass().toString();

  /** Default logger used by server. */
  private Logger logger  = Logger.getLogger(className);;

  /** Date formatter. */
  private InternetDate dateFormatter = new InternetDate();

  /** A pool of all request handlers available for this server. */
  private RequestHandlerPool handlerPool = new RequestHandlerPool(logger);

  /** A pool of byte buffers used to process a request. */
  private ByteBufferPool bufferPool = new ByteBufferPool();

  /** A collection of all current sessions. */
  private LinkedList sessions = new LinkedList();

  /** Local cache associated with this server. */
  private Cache cache =  new Cache(bufferPool);

  /** Main Constructor. */
  public Server() {}

  public InternetDate date() {
    return dateFormatter;
  }

  public Logger log() {
    return logger;
  }

  public Cache cache() {
    return cache;
  }

  public ByteBufferPool pool() {
    return bufferPool;
  }

  /**
   * Start this server.
   */
  public void run() {
    if (! initializeDefaultParameters()) {
      return;
    }

    try {
      initializeServer();
      //main block of a server. Infinite loop. Waiting for request....
      for (; ; ) {
        //wait until connections come in...
        selector.select(timeOut);
        //timeout inactive connections
        checkForTimeOut(timeOut);
        //iterate through all iterators
        Iterator keys = selector.selectedKeys().iterator();
        SelectionKey key = null;
        while (keys.hasNext()) {
          key = (SelectionKey) keys.next();
          keys.remove();
          if (key.isValid() && key.isAcceptable()) {
            acceptKey();
            continue;
          } else if (key.isValid() && key.isReadable()) {
            readFromSocket(key);
            continue;
          } else if (key.isValid() && key.isWritable()) {
            writeToSocket(key);
            continue;
          }
        }
      }
    } catch (IOException ioe) {
      logger.logp(Level.INFO, className, "run()", ioe.toString());
    }
  }

  /**
   * Check <b>all</b> sessions based on elapsed time and
   * invalidate those sessions, where last accessed time
   * exceeds elapsed time.
   *
   * @param timeOut Time to check for time out.
   * @throws IOException
   *        Signals time out sessions did not terminate successfully.
   */
  private void checkForTimeOut(long timeOut) throws IOException  {
    Iterator iter = sessions.iterator();
    while (iter.hasNext()) {
      Session session = (Session)iter.next();
      if (session.terminate(timeOut)) {
        iter.remove();
      } else {
        return;
      }
    }
  }

  /**
   * Accept and register connection from a client.
   */
  private void acceptKey() {
    try {
      SocketChannel client = server.accept();
      logger.logp(Level.FINER, className, "acceptKey()",
        "Accept Key from Client...");
      //configure to non-blocking mode
      client.configureBlocking(false);
      //register channel with Selector
      SelectionKey localKey = client.register(selector, SelectionKey.OP_READ);

      Session session = new Session(localKey);
      sessions.addLast(session);
      localKey.attach(session);
    } catch (IOException ioe) {
      logger.logp(Level.FINEST, className, "acceptKey()", ioe.toString());
    }
  }

  /**
   * Read from client.
   * <p /> This method reads data from a client and
   * parses it to a request. Upon completion, request handler is called
   * to generate appropriate response.
   *
   * @param key  Selection key associated with current connection.
   */
  protected void readFromSocket(SelectionKey key) {
    ByteBuffer    buffer    = bufferPool.getByteBuffer();
    SocketChannel client    = (SocketChannel) key.channel();
    Session       session   = (Session)key.attachment();

    int bodyLength = 0;
    try {
      // Read from socket channel.
      while (client.read(buffer) > 0) {
        buffer.flip();
        session.touch();
        if (session.request == null) {
          session.request = new Request();
        }
        //process request
        if (!session.request.isHeadersComplete()) {
          session.request.parse(buffer);
        }
        // if there is enough data to start processing current request.
        if (session.request.isHeadersComplete()) {
          // if request handler is null => instantiate it.
          if (session.handler == null) {
            session.handler =
              handlerPool.instantiateRequestHandler(session.request);
            //add current request handler to the queue of all request handlers.
            session.addHandler(session.handler);
            session.handler.setRuntime(this);
            session.handler.start(session.request,
              client.socket().getRemoteSocketAddress().toString()
            );
          }
          // calculate content length for body processing.
          bodyLength = session.handler.remainingBody();
          // calculate bytes to read from current buffer.
          int maxBytesToProcess = buffer.remaining();

          // if enough bytes were processed, schedule WRITE operation
          if (session.handler != null) {
            int status = session.handler.getEvent();
            if (status != RequestHandler.SCHEDULE_FOR_READ) {
              client.register(selector, SelectionKey.OP_WRITE, session);
            }
          }

          if (bodyLength == 0) {
            session.request = null;
            session.handler = null;
          } else if (bodyLength > maxBytesToProcess) {
              // if current request's body size is greater than
              // current number of bytes stored in a byte buffer,
              //
              // 1. read all current bytes and
              // 2. get more bytes from socket channel to finish
              //    processing current request.
              if (session.handler.body(buffer)) {
                buffer = bufferPool.getByteBuffer();
              } else {
                buffer.clear();
              }

              // if enough bytes were processed, schedule WRITE operation
              if (session.handler != null) {
                int status = session.handler.getEvent();
                if (status != RequestHandler.SCHEDULE_FOR_READ) {
                  client.register(selector, SelectionKey.OP_WRITE, session);
                }
              }
          } else {
            // else if request's body size is less than
            // current number of bytes stored in a byte buffer,
            //
            // 1. append body of a current request.
            // 2. start processing response.
            // 3. start processing next request.
            ByteBuffer temporary = bufferPool.getByteBuffer();

            initializeRequestBuffers(buffer, temporary, bodyLength);
            if (!session.handler.body(buffer)) {
              bufferPool.returnByteBuffer(buffer);
            }

            // if enough bytes were processed, schedule WRITE operation
            if (session.handler != null) {
              int status = session.handler.getEvent();
              if (status != RequestHandler.SCHEDULE_FOR_READ) {
                client.register(selector, SelectionKey.OP_WRITE, session);
              }
            }

            session.request = null;
            session.handler = null;
            buffer = temporary;
          }
        }
      }
    }catch (IOException ioe) {
      logger.logp(Level.FINEST, className, "readFromSocket()", ioe.toString());
      try {
        session.terminate();
      } catch (IOException ee) {
        // Ignore nested exception.
      }
      sessions.remove(session);
    } finally {
      bufferPool.returnByteBuffer(buffer);
    }
  }

  /**
   * Write response back to the client.
   * <p /> If not all data has been written to the client, schedule
   * another write operation, until <b>all</b> information is written.
   *
   * @param key Selection key associated with current connection.
   */
  protected void writeToSocket(SelectionKey key) {
    SocketChannel channel           = (SocketChannel)key.channel();
    Session       session           = (Session)key.attachment();
    HandlerList   current           = session.firstHandler;

    ByteBuffer response = null;
    RequestHandler handler = null;
    int bytesWritten = 0;
    int status       = -1;
    try {
      session.touch();
      while (null != current) {
        //for each handler
        handler = current.handler;
        while ((status = handler.getEvent()) == RequestHandler.BODY) {
          // get current response body part.
          response = handler.getResponsePart();
          // perform write operation on current byte buffer
          bytesWritten = channel.write(response);
          // if, for some reason, current write operation could not be
          // scheduled, break out of write operation loop.
          if (bytesWritten <= 0) break;
          // otherwise, continue write operation loop.
          handler.scheduled(bytesWritten);
        }
        switch (status) {
          case RequestHandler.DONE:
            session.removeHandler(current);
            handlerPool.returnRequestHandler(handler);
            channel.register(selector, SelectionKey.OP_READ, session);
            break;
          case RequestHandler.CLOSE_CONNECTION:
            session.removeHandler(current);
            handlerPool.returnRequestHandler(handler);
            session.terminate();
            sessions.remove(session);
            break;
          case RequestHandler.SCHEDULE_FOR_WRITE:
            if (handler.remainingBody() == 0) {
              // if current request was fully parsed  (with entire body)..
              // then schedule for next available write operation
              // to check for completeness of this write operation.
              channel.register(selector, SelectionKey.OP_WRITE, session);
            } else {
              // otherwise, schedule for read operation and
              // parse remaining data.
              channel.register(selector, SelectionKey.OP_READ, session);
            }
            break;
          case RequestHandler.SCHEDULE_FOR_READ:
            channel.register(selector, SelectionKey.OP_READ, session);
            break;
          default:
            // if, for some reason, current write operation could not be
            // completed, schedule next write operation.
            channel.register(selector, SelectionKey.OP_WRITE, session);
        }
        current = current.next;
      }
    } catch (IOException ioe) {
      logger.logp(Level.FINEST, className, "writeToSocket()", ioe.toString());
      try {
        session.terminate();
      } catch (IOException ee) {
        // Ignore nested exception.
      }
      sessions.remove(session);
    }
  }

  /**
   * Transfer an array of next request's bytes to another byte buffer, while
   * leaving current byte buffer with bytes associated only with current
   * request.
   *
   * @param currentBody               Current byte buffer.
   * @param nextRequest               Byte buffer associated with next request.
   * @param currentRequestBodyLength  Lenght of a current request in current
   *                                                               byte buffer.
   */
  private void initializeRequestBuffers(ByteBuffer currentBody,
                        ByteBuffer nextRequest, int currentRequestBodyLength) {
    // bytes for this request's body.
    int currentRequestBody = currentBody.position() + currentRequestBodyLength;
    // bytes for next request.
    int nextRequestBytes        = currentBody.limit()    - currentRequestBody;
    if (nextRequestBytes == 0) return;

    //create array for next request.
    byte[] processed = new byte[nextRequestBytes];

    int initialPos = currentBody.position();
    currentBody.position(currentRequestBody-1);
    //copy data.
    currentBody.get(processed, 0, nextRequestBytes);
    //initialize new buffer with data.
    nextRequest.put(processed);
    //set the limit of the current Body to the end of its body ONLY.
    currentBody.position(initialPos);
    currentBody.limit(currentRequestBody);
  }

  /**
   * Initialize class variables and bind server to a specified host.
   *
   * @throws IOException Signals that this server was not initialized.
   */
  private void initializeServer() throws IOException {
    //create new server socket channel
    server = ServerSocketChannel.open();

    //set it to non-blocking mode
    server.configureBlocking(false);

    //initialize new Selector
    selector = Selector.open();

    //create new Server Socket
    ServerSocket serverSocket = server.socket();

    //bind it to specified port number
    serverSocket.bind(new InetSocketAddress(hostName, httpPort));

    //register ServerSocketChannel with current Selector
    server.register(selector, SelectionKey.OP_ACCEPT);

    logger.logp(Level.INFO, className, "initializeServer()",
      "Initialized " + Constants.SERVER_NAME + " " + Constants.VERSION);
    logger.logp(Level.INFO, className, "initializeServer()",
      "Listening on port " + httpPort);
  }

  /**
   * Load parameters from <i>munin.config</i> configuration file
   * and initialize server parameters.
   *
   * @return <code>true</code> if the default parameters could be
   * initialized.
   */
  private boolean initializeDefaultParameters() {
    logger.logp(Level.INFO, className, "initializeDefaultParameters()",
      "Initializing default parameters..." );

    // Touch MimeTypes to make sure it can be properly initialized.
    try {
      MimeTypes.getMimeType("html");
    } catch (ExceptionInInitializerError e) {
      logger.logp(Level.INFO, className, "initializeDefaultParameters()",
                  "Unable to initialize MIME type mapping");
      Throwable t = e;
      while (null != t.getCause()) {
        t = t.getCause();
      }

      if (null != t.getMessage()) {
        logger.logp(Level.INFO, className, "initializeDefaultParameters()",
                    "   " + t.getMessage());
      }
      return false;
    }

    Properties props = new Properties();
    Properties handlers = new Properties();
    try {
      props.load(new FileInputStream(configurationFile));
    } catch (IOException e) {
      httpPort = 8080;
      ByteBufferPool.BUFFER_SIZE = 1024;
      bufferPool.setPoolSize(10);
      handlerPool.setPoolSize(10);
      DefaultRequestHandler.INIT_PATH = "htroot";
      AbstractRequestHandler.SERVER_HTTP_1_0 = false;
      handlers.put("/*", "edu.nyu.cs.web.DefaultRequestHandler");
      handlerPool.setHandlerMapping(handlers);
      logger.logp(Level.INFO, className, "initializeDefaultParameters()",
                  "Unable to open configuration file \"" + configurationFile +
                  "\"");
      return true;
    }

    Iterator iter = props.keySet().iterator();
    while (iter.hasNext()) {
      String name = (String) iter.next();
      String value = props.getProperty(name);
      if (name.equalsIgnoreCase("HttpPort")) {
        httpPort = Constants.parseInt(value);
      } else if (name.equalsIgnoreCase("BufferSize")) {
        ByteBufferPool.BUFFER_SIZE = Constants.parseInt(value);
      } else if (name.equalsIgnoreCase("PoolSize")) {
        bufferPool.setPoolSize(Constants.parseInt(value));
        handlerPool.setPoolSize(Constants.parseInt(value));
      } else if (name.equalsIgnoreCase("InitPath")) {
        DefaultRequestHandler.INIT_PATH = value;
      } else if (name.equalsIgnoreCase(Constants.STRING_HTTP_1_0)) {
        AbstractRequestHandler.SERVER_HTTP_1_0 = Constants.parseBoolean(value);
      } else if (name.startsWith("/")) {
        handlers.put(name, value);
      }
    }
    handlerPool.setHandlerMapping(handlers);
    return true;
  }

  /**
   * Main method. Starts this server.
   *
   * @param args Nothing should be specified.
   */
  public static void main(String[] args) {
    Server engine = new Server();
    engine.run();
  }

  /**
   * A handler list keeps handlers in a singly linked list.
   */
  static class HandlerList {

    /** The previous element. */
    public HandlerList previous;

    /** The next element. */
    public HandlerList next;

    /** The request handler. */
    public RequestHandler handler;

    /**
     * Create a new handler list with the specified request handler.
     *
     * @param handler New request handler.
     */
    public HandlerList(RequestHandler handler) {
      this.handler = handler;
    }

  }

  /**
   * A session keeps server-internal state associated with a client
   * connection.
   */
  private static class Session {

    /** Key associated with current connection. */
    public SelectionKey key;

    /** Time, in milliseconds, this connection was established. */
    public long openedAt;

    /** Last time, in milliseconds, this connection was used. */
    public long lastUsed;

    /** Current request being processed. */
    public Request request;

    /** Current request handler associated with current request. */
    public RequestHandler handler;

    /**
     * The first element in the queue of request handlers associated
     * with this connection.
     */
    public HandlerList firstHandler = null;

    /**
     * The last element in the queue of request handlers associated
     * with this connection.
     */
    public HandlerList lastHandler = null;

    /**
     * Instantiate new session. Sets initial time this session was established.
     *
     * @param key Key associated with current session.
     */
    public Session(SelectionKey key) {
      this.key = key;
      openedAt = System.currentTimeMillis();
      lastUsed = openedAt;
    }

    /**
     * Add the specified request handler as the last element in
     * the queue of request handlers.
     *
     * @param rh Request handler to be added.
     */
    public void addHandler(RequestHandler rh) {
      HandlerList hl = new HandlerList(rh);

      if (null == firstHandler) {
        // The list is boringly empty.
        firstHandler = hl;
        lastHandler  = hl;
      } else {
        // Somebody is already here.
        lastHandler.next = hl;
        hl.previous      = lastHandler;
        lastHandler      = hl;
      }
    }

    /**
     * Remove the specified request handler from
     * the queue of request handlers.
     *
     * @param hl Request handler to be removed.
     */
    public void removeHandler(HandlerList hl) {
      if (null != hl.previous) {
        hl.previous.next = hl.next;
      } else {
        firstHandler = hl.next;
      }
      if (null != hl.next) {
        hl.next.previous = hl.previous;
      } else {
        lastHandler = hl.previous;
      }
    }

    /**
     * Modify last time this connection was used by the server.
     * <p /> This data is used to <i>time out</i> current connection.
     */
    public void touch() {
      lastUsed = System.currentTimeMillis();
    }

    /**
     * Forcibly terminate this session.
     *
     * @throws IOException
     *        Signals this session was unable to terminate successfully.
     */
    public void terminate() throws IOException {
      ((SocketChannel)key.channel()).close();
      key.cancel();
    }

    /**
     * Invalidate this session, if last time it was accessed
     * exceeds elapsed time.
     *
     * @param elapsedTime Elapsed time to check this session.
     *
     * @return <code>True</code>, if this session had been invalidate
     *         and <code>False</code> otherwise.
     * @throws IOException
     *        Signals this session was unable to terminate successfully.
     */
    public boolean terminate(long elapsedTime) throws IOException {
      if ((System.currentTimeMillis()-lastUsed) >= elapsedTime) {
        terminate();
        return true;
      }
      return false;
    }
  }
}
