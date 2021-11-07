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

import java.net.Socket;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

import java.util.logging.Logger;
import java.util.logging.Level;
/**
 * Large request generator tests performance and overall capability of a
 * mirroring request handler. In order to test
 * <code>MirroringRequestHandler</code>, this class generates a HTTP request
 * with a large body and sends it to a HTTP server. At the same time,
 * <code>MirroringRequestHandler</code> listens for a data to come in on the
 * same socket, receiving back the same data as was sent.
 *
 * <p /> Instantiation of <code>LargeRequestGenerator</code> is fully described
 * in main method of this class {@link #main(String[] args)}.
 *
 * @see MirroringRequestHandler
 *
 * @author Dmitriy Mindich
 * $Revision: 1.11 $
 */
public class LargeRequestGenerator {

  /**
   * Main parameter of <code>LargeRequestGenerator</code>
   * specifying server name.
   */
  protected static final String SERVER    = "--server";

  /**
  * Main parameter of <code>LargeRequestGenerator</code>
  * specifying port number.
  */
  protected static final String PORT      = "--port";

  /**
  * Main parameter of <code>LargeRequestGenerator</code>
  * specifying URI of a HTTP request being generated.
  */
  protected static final String URI       = "--uri";

  /**
  * Main parameter of <code>LargeRequestGenerator</code>
  * specifying size of a HTTP request being generated.
  */
  protected static final String BODY_SIZE = "--bodySize";

  /**
   * Main parameter of <code>LargeRequestGenerator</code>
   * specifying rate at which body parts should be sent to the server.
   */
  protected static final String RATE      = "--rate";

  /** Name of this class. */
  protected static final String className =
      "edu.nyu.cs.web.LargeRequestGenerator";

  /** Default logger used by <code>LargeRequestGenerator</code> . */
  protected static Logger logger = Logger.getLogger(className);

  /**
   * Main method to start <code>LargeRequestGenerator</coode>.
   *
   * @param args String array shoud include the following parameters and
   *                                             their respective values:
   *   <ul>
   * 	   <li> {@link #SERVER}
   *            Parameter name should be specified as <b>--server</b>.
   *            And following parameter name should be its value.
   *	   <li> {@link #PORT}
   *            Parameter name should be specified as <b>--port</b>.
   *            And following parameter name should be its value.
   * 	   <li> {@link #URI}
   *            Parameter name should be specified as <b>--uri</b>.
   *            And following parameter name should be its value.
   *       <li> {@link #BODY_SIZE}
   *            Parameter name should be specified as <b>--bodySize</b>.
   *            And following parameter name should be its value.
   *       <li> {@link #RATE}
   *            Parameter name should be specified as <b>--rate</b>.
   *            And following parameter name should be its value.
   *    </ul>
   */
  public static void main(String[] args)  {

    // if there are no pairs of arguments..
    if ((args.length%2) != 0) {
      logger.logp(Level.INFO, className, "main()",
        "Invalid arguments passed to Large request generator.");
      throw new IllegalArgumentException("Invalid arguments passed to " +
        "Large request generator");
    }

    int port, bodySize, speed;
    String serverName, resourceName;

    port = bodySize = speed = 0;
    serverName = resourceName = null;

    for (int i=0; i<args.length; i+=2) {
      if (args[i].equals(SERVER)) {
        serverName   = args[i+1];
      } else if (args[i].equals(URI)) {
        resourceName = args[i+1];
      } else if (args[i].equals(PORT)) {
        port         = parseInt(args[i+1]);
      } else if (args[i].equals(BODY_SIZE)) {
        bodySize     = parseInt(args[i+1]);
      } else if (args[i].equals(RATE)) {
        speed        = parseInt(args[i+1]);
      } else {
        logger.logp(Level.INFO, className, "main()",
          "Invalid parameter name was specified: " + args[i]);
      }
    }

    // check if ALL parameters were specified.
    if (port == 0 || bodySize == 0 ||
        speed == 0 || serverName == null ||
        resourceName == null) {
     logger.logp(Level.INFO, className, "main()",
       "Invalid arguments passed to Large request generator.");
     throw new IllegalArgumentException("Invalid arguments passed to " +
        "Large request generator");
   }


    Socket socket     = null;
    try {
      socket = new Socket(serverName, port);
    } catch (IOException e) {
      logger.logp(Level.INFO, className, "main()",
        "Unable to open connection to server: " + serverName +
        " with port number: " + port);
    }

    Reader reader = new Reader(socket);
    Writer writer = new Writer(socket, resourceName,
                               bodySize, speed);

    logger.logp(Level.FINER, className, "main()", "Start testing...");
    reader.startReading();
    writer.startWriting();
  }

  /**
   * Parse a string to a number.
   * Return 0, if string does not represent a java integer.
   *
   * @param  number String to be parsed.
   * @return Return parsed integer.
   */
  protected static int parseInt(String number) {
    try {
      return Integer.parseInt(number);
    } catch (NumberFormatException nfe) {
      logger.logp(Level.INFO, className, "parseInt()",
        "Unable to parse one of the integer parameters of Large " +
        "request generator");
      return 0;
    }
  }


  /**
   * Socket Writer. This class is responsible for writing a request with
   * a big body. Henceworth, testing capabilities of a HTTP server by creating
   * and sending HTTP request.
   *
   * @author Dmitriy Mindich
   */
  static class Writer implements Runnable {

    /** Body size of HTTP request being generated. */
    private int bodySize;

    /** Speed at which HTTP request should be sent to the server. */
    private int speed;

    /** Resource name to be queried by HTTP request. */
    private String resourceName;

    /**  HTTP request being sent to the server. */
    private byte[] request;

    /**
     * Start index of specific part of HTTP request being
     * sent to the client.
     */
    private int startIndex;

    /**
     * Length of specific part of HTTP request body being
     * sent to the client.
     */
    private int length = 2000;

    /**
     * Connection to the server.
     */
    private Socket socket;

    /**
     * Output stream to the server.
     */
    private DataOutputStream out;

    /** Name of this class. */
    private String className = this.getClass().toString();

    /**
     * Constructor that initializes main parameters of a HTTP request.
     *
     * @param socket    Reference to a HTTP server.
     * @param resource  Resource to query in a HTTP request.
     * @param bodySize  Total amount of bytes to send in a HTTP request.
     * @param speed     Amount of bytes to send on each iteration.
     */
    public Writer (Socket socket, String resource,
                   int bodySize, int speed) {

      this.socket   = socket;
      resourceName  = resource;
      this.speed    = speed;
      this.bodySize = bodySize;
    }

    /**
     * Start writing HTTP request to HTTP server.
     */
    public synchronized void startWriting() {

      StringBuffer buffer = new StringBuffer(300);
      buffer.append("GET ");
      buffer.append(resourceName);
      buffer.append(" HTTP/1.0");
      buffer.append("\r\n");
      buffer.append("Host: Mindich");
      buffer.append("\r\n");
      buffer.append("Content-Length: ");
      buffer.append(Integer.toString(bodySize));
      buffer.append("\r\n");
      buffer.append("\r\n");

      byte[] headers = buffer.toString().getBytes();
      request = new byte[headers.length + 1 + bodySize];

      System.arraycopy(headers, 0, request, 0, headers.length);
      //put some data in body.
      for (int i=headers.length; i<request.length; i++) {
        request[i] = (byte)(35);
      }

      try {
        out = new DataOutputStream(socket.getOutputStream());
        new Thread(this).start();
      } catch (IOException io) {
        logger.logp(Level.INFO, className, "startWriting()",
          "Exception is thrown while opening data output stream to the server");
      }
    }

    /**
     * Start this thread.
     */
    public synchronized void run() {
      try {
        while (length > 0) {
          length = speed;
          if (startIndex + length >= request.length) {
            length = request.length - 1 - startIndex;
          }
          out.write(request, startIndex, length);
          startIndex += length;
          logger.logp(Level.FINER, className, "run()",
            "Writing from: " + startIndex + " with length: " + length);
          Thread.sleep(2000);
        }
        logger.logp(Level.FINER, className, "run()",
          "Finished writing data to the server.");
      } catch (IOException io) {
        logger.logp(Level.INFO, className, "run()",
          "IOException is thrown while writing data to the server");
      }	catch (InterruptedException i) {
        logger.logp(Level.INFO, className, "run()",
          "Interrupted Exception is thrown while writing data to the server");
      }
    }
  }

  /**
   * Socket Reader. This class waits on the socket for a data to come in
   * from a HTTP server. It is responsible for displaying the contents of a
   * HTTP Response received from a HTTP server.
   * @author Dmitriy Mindich
   */
  static class Reader implements Runnable {

    /** Connection to the server. */
    private Socket socket;

    /** Input stream to the server. */
    private DataInputStream in;

    /** Total number of bytes received from the server. */
    private int total = 0;

    /** Name of this class. */
    private String className = this.getClass().toString();

    /**
     * Constructor that initializes main parameters of a HTTP response.
     *
     * @param socket    Reference to a HTTP server.
     */
    public Reader(Socket socket) {
      this.socket = socket;
    }

    /**
    * Start reading HTTP response to HTTP server.
    */
    public synchronized void startReading() {
      try {
        in = new DataInputStream(socket.getInputStream());
        new Thread(this).start();
      } catch (IOException io) {
        logger.logp(Level.INFO, className, "startReading()",
          "Exception is thrown while opening data input stream to the server");
      }
    }

    /**
     * Start this thread.
     */
    public synchronized void run() {
      try {
        byte[] buffer = new byte[4096];
        while (true) {
          int r = in.read(buffer);
          if (r > 0) {
            total += r;
            logger.logp(Level.FINER, className, "run()",
               "Number of bytes read:  " + r);
            logger.logp(Level.FINER, className, "run()",
              "Total number of bytes read: " + total);
//            logger.logp(Level.FINER, className, "run()",
//              new String(buffer, 0, r));
          }
          Thread.sleep(2000);
        }
      }catch (IOException io) {
        logger.logp(Level.INFO, className, "run()",
          "IOException is thrown while reading data from the server");
      }catch (InterruptedException i) {
        logger.logp(Level.INFO, className, "run()",
          "Interrupted Exception is thrown while reading data from the server");
      }
    }
  }
}
