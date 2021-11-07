/*
 * iServe
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

import java.nio.ByteBuffer;

import java.util.Iterator;
import java.util.LinkedList;

import java.util.logging.Logger;
import java.util.logging.Level;
/**
 * Partial implementation of a <code>RequestHandler</code>.  This class
 * provides implementation of common methods that are used both
 * in <code>DefaultRequestHandler</code> and
 * in <code>MirroringRequestHandler</code>, as well as some
 * common helper methods also used by these 2 variations of a
 * <code>RequestHandler</code>.
 *
 * @see RequestHandler
 * @see DefaultRequestHandler
 * @see MirroringRequestHandler
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.13 $
 */
public abstract class AbstractRequestHandler implements RequestHandler {

  /**
   * Indicates whether current server will only process
   * requests according to <code>HTTP 1.0</code> specification.
   *
   * Note, this means whether this server will allow persistent connections.
   */
  public static boolean SERVER_HTTP_1_0 = false;

  /**
   * Remaining number of bytes needed to be processed by current
   * request handler.
   */
  protected int bodyLength;

  /** Logger. */
  protected Logger logger;

  /** Date formatter. */
  protected InternetDate dateFormatter;

  /** Cache used by a request handler. */
  protected Cache cache;

  /** Current request. */
  protected Request request;

  /** Current response.  */
  protected Response response = new Response();

  /** A pool of byte buffers used to process a request. */
  protected ByteBufferPool buffersPool;

  /**
   * The list of buffers representing the response, which still need
   * to be written.
   */
  protected LinkedList buffersToWrite = new LinkedList();

  /**
   * The list of buffers representing the response, which have been
   * scheduled for writing but may not have been actually written.
   */
  protected LinkedList buffersToCheck = new LinkedList();

  /** Currently processing response byte buffer. */
  protected ByteBuffer current;

  /**
   * Number of bytes of current byte buffer that are left to be scheduled
   * for write operation.
   */
  protected int scheduled;

  /** Name of the current class. */
  protected String className = this.getClass().toString();

  public void start(Request request, String clientAddress) {
    this.request = request;
    bodyLength = request.getContentLength();
    try {
      process();
    } catch (Exception e) {
      if (! (e instanceof ProcessingException)) {
        logger.logp(Level.FINEST, className, "start()", e.toString());
        e = new ProcessingException(500);
      }

      ProcessingException pe = (ProcessingException)e;
      response.setStatusCode(pe.getStatusCode());
      ByteBuffer responseBody = Constants.mapMessageBody(pe.getStatusCode());
      // if no appropriate message body is available
      // then send only empty headers.
      if (responseBody == null) {
        response.addHeader(Constants.CONTENT_LENGTH, "0");
      } else {
        // otherwise, include a small description
        // of a problem encountered by the server.
        response.addHeader(Constants.CONTENT_LENGTH,
                           Integer.toString(responseBody.capacity()));
        buffersToWrite.addLast(responseBody);
      }
    }

    //      logger.logp(Level.INFO, className, "log",
    //                  clientAddress + " - " +
    //                  " - " + dateFormatter.format(new java.util.Date()) +
    //                  " " + request.getRequestLine() + " " +
    //                  response.getStatusCode() + " " +
    //                  request.toByteBuffer().capacity());

    buffersToWrite.addFirst(response.toByteBuffer());
  }

  public void setRuntime(Runtime runtime) {
    logger         = runtime.log();
    dateFormatter  = runtime.date();
    cache          = runtime.cache();
    buffersPool    = runtime.pool();
  }

  public ByteBuffer getResponsePart() {
    return current;
  }

  public void scheduled(int size) {
    if (current != null) {
      scheduled -= size;
    } else {
      // if current is null, and scheduled event has been called,
      // the entire event-processing model has been disrupted. Since
      // server must stop its execution.
      throw new RuntimeException ("Illegal use of event-processing model in " +
                                  Constants.SERVER_NAME);
    }
  }

  public int getEvent() {
    checkWaitingBuffers();

    if (scheduled > 0) {
      // if, at this moment, not all bytes scheduled were written => wait...
      if (scheduled != current.remaining()) {
        return SCHEDULE_FOR_WRITE;
      }
      // otherwise, return current byte buffer for additional write operation.
      return BODY;
    }

    if (scheduled == 0) {
      if (current != null) {
        buffersToCheck.addLast(current);
      }
      while (!buffersToWrite.isEmpty()) {
        current = (ByteBuffer)buffersToWrite.removeFirst();
        scheduled = current.remaining();
        return BODY;
      }
      current = null;
      return getConnectionStatus();
    }
    else return SCHEDULE_FOR_WRITE;
  }

  private void checkWaitingBuffers() {
    Iterator iter = buffersToCheck.iterator();
    ByteBuffer buffer = null;
    while (iter.hasNext()) {
      buffer = (ByteBuffer)iter.next();
      if (buffer.remaining() == 0) {
        buffer.rewind();
        buffersPool.returnByteBuffer(buffer);
        iter.remove();
      }
    }
  }

  public int remainingBody() {
    return bodyLength;
  }

  public void done(){
    if (response != null) response.clear();
    if (request  != null) request.clear();
    buffersToWrite.clear();
  }

  /**
   * Process request, generate response's headers.
   *
   * @throws ProcessingException
   *                Signals HTTP error occurred while processing request.
   **/
  protected abstract void process() throws ProcessingException;

  /**
   * Validate method name of a request. This request handler only processes
   * request with method names of types: GET and HEAD.
   *
   * @param methodName Request's method name to be processed.
   * @throws ProcessingException
   *           Signals that request's method name was not of type:GET or HEAD.
   *
   */
  protected void validateRequestMethodName(String methodName)
      throws ProcessingException {
    //This request handler only supports GET and HEAD methods.
    if (!(methodName.equals(Constants.HTTP_METHOD_GET)
          || methodName.equals(Constants.HTTP_METHOD_HEAD))) {
      logger.logp(Level.INFO, className, "processRequest()",
        "Current implementation of RequestHandler does not support " +
        "specified HTTP Method: " + methodName);
      throw new ProcessingException(501);
    }
  }


  /**
   * Return mime type of a file being retrieved.
   *
   * @param pathName Path to a file.
   * @return String <i>mime type</i> of a current file.
   */
  protected String getMimeType(String pathName) {
    int index = pathName.lastIndexOf(".");
    String extension = pathName.substring(index+1, pathName.length());
    return MimeTypes.getMimeType(extension);
  }

  /**
   * Set common HTTP headers that are independent of
   * request handler implementation.
   *
   * @throws ProcessingException
   *  Signals HTTP error occurred while generating response.
   */
  protected void prepareResponse() throws ProcessingException {
    //if request is not initialized.
    if (request == null)
      throw new RuntimeException("Request of corresponding RequestHandler " +
      "was not initialized");

    validateRequestMethodName(request.getMethodName());

    // set response HTTP version to 1.0 if this server
    // was only set to process HTTP 1.0 requests.
    if (SERVER_HTTP_1_0) {
      response.setHttpVersion(Constants.INT_HTTP_1_0);
    } else {
      //otherwise, process request, as usually.
      response.setHttpVersion(request.getHttpVersion());
    }

    response.addHeader(Constants.DATE,
                       dateFormatter.format(new java.util.Date()));

    response.addHeader(Constants.SERVER, Constants.SERVER_NAME);
    if(request.getMethodName().equals(Constants.HTTP_METHOD_HEAD)) {
      response.setOnlyHeader(true);
    }
  }

  /**
   * Get connection status ending current <i>request-response</i> interaction.
   *
   * @return Current connection status.
   */
  protected int getConnectionStatus() {
    if (remainingBody() > 0 || !buffersToCheck.isEmpty()) {
      return SCHEDULE_FOR_WRITE;
    }
    // if server is only allowed to process HTTP 1.0 requests
    // or client is only allowed to process HTTP 1.0 requests,
    // then don't allow persistent connection and close
    // client connection instantly.
    if (SERVER_HTTP_1_0 ||
        response.getHttpVersion() == Constants.INT_HTTP_1_0)
      return CLOSE_CONNECTION;

    String headerValue = request.getHeader(Constants.CONNECTION);
    if (headerValue == null) return RequestHandler.DONE;
    if (headerValue.equalsIgnoreCase("Close"))
      return RequestHandler.CLOSE_CONNECTION;
    return RequestHandler.DONE;
  }
}
