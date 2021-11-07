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

import java.nio.ByteBuffer;
/**
 * <p /> Definition of a request handler.
 * A request handler processes requests and generates appropriate responses.
 *
 * <p /> Processing is implemented through an event-driven architecture. Upon
 * instantiation, method {@link #setRuntime(Runtime runtime)} is called. This
 * method sets common services used by a request handler. At this point,
 * request handler is ready for a <i>request - response</i> interaction.
 *
 * <p /> To start each <i>request-response</i> interaction method
 * {@link #start(Request request, String clientAddress)} is called.
 * This method sets request of current request handler and starts response
 * generation.
 *
 * Note, each request handler is only able to process <b>one</b> request at a
 * time. Afterwards, method {@link #body(ByteBuffer body)} may be called. This
 * method sets or appends body of a current request.
 *
 * <p /> Note, since request's body may be too long, it may be broken
 * down by a client into a number of small chunks of data, which are
 * received by a server at different points in time. Consequently,
 * method {@link #body(ByteBuffer body)} may be invoked zero or more
 * times, depending on the size and even the existence of a request
 * body.
 *
 * <p />The request handler indicates to the server which actions to perform
 * by returning events through the {@link #getEvent()} method. This method
 * guides server through a response generation.
 *
 * <p /> It may return the following event actions:
 *    <ul>
 * 	   <li> {@link #BODY}
 *	   <li> {@link #SCHEDULE_FOR_WRITE}
 *	   <li> {@link #SCHEDULE_FOR_READ}
 * 	   <li> {@link #DONE}
 *       <li> {@link #CLOSE_CONNECTION}
 *    </ul>
 * <p />
 *
 * <p /> Action {@link #BODY} suggests invoking {@link #getResponsePart()} and
 * writing body back to the client. Afterwards,
 * method {@link #scheduled(int size)} must be called to notify request handler
 * of how many bytes of current response part (byte buffer) have been scheduled
 * for write operation.
 *
 * <p /> Action {@link #SCHEDULE_FOR_READ} suggests that request
 * received is incomplete and more information is needed to finish
 * response-processing.  Consequently, the server must schedule
 * another read operation to received additional information.
 *
 * <p /> Action {@link #SCHEDULE_FOR_WRITE} suggests that the
 * information received from the client as part of the request is
 * sufficient for writing a part or the entire response back to the
 * client.
 *
 * <p /> Action {@link #DONE} suggests that response-processing is
 * complete, however connection must be kept active.
 *
 * <p /> Action {@link #CLOSE_CONNECTION} suggests that response-processing is
 * complete and connection <b>must</b> be closed.
 *
 * @see DefaultRequestHandler
 * @see MirroringRequestHandler
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.26 $
 */
public interface RequestHandler {

  /**
   * Action stating that next event of a server must be retrieving next
   * byte buffer's response via method {@link #getResponsePart()}.
   */
  public static final int BODY = 0x01;

  /**
   * Action stating that <i>request-response</i> interaction is not
   * fully complete write operation is in progress.
   */
  public static final int SCHEDULE_FOR_WRITE = 0x02;

  /**
   * Action stating that  <i>request-response</i> interation is complete,
   * however associated connection must be kept active.
   */
  public static final int DONE     = 0x04;

  /**
   * Action stating that  <i>request-response</i> interation is complete and
   * associated connection must be closed.
   */
  public static final int CLOSE_CONNECTION = 0x08;

  /**
   * Action stating that <i>request-response</i> interaction is not
   * fully complete, more information from client is needed and server must
   * be scheduled for another werite operation.
   */
  public static final int SCHEDULE_FOR_READ    = 0x10;

  /**
   * Set the runtime for this request handler.
   * This method is guaranteed to be called exactly once before starting
   * first <i>request-response</i> interaction.
   *
   * @param runtime The runtime.
   */
  public void setRuntime(Runtime runtime);

  /**
   * Start processing request.
   * This method must be called exactly once for each <i>request-response</i>
   * interaction.
   *
   * @param request       Current request.
   * @param clientAddress IP address associated with current client.
   */
  public void start(Request request, String clientAddress);

  /**
   * Store and process part or full body of a request.
   * Note that this method may be called zero or more times
   * for each given request.
   *
   * @param body            Body of request.
   * @return
   *   Signals whether parameter byte buffer will be used by a request handler.
   */
  public boolean body(ByteBuffer body);

  /**
   * Get remaining length of request's body that was still unprocessed by a
   * request handler.
   *
   * Note, information from this method is based on <code>Content-type</code>
   * header of a HTTP request.
   *
   * @return Remaining body length to be processed.
   */
  public int remainingBody();

  /**
   * Get next action to be performed in the server. This method is called
   * to receive next event that the server must process.
   * <p /> For each write operation, this method will be called until actions:
   *    <ul>
   *	     <li> {@link #SCHEDULE_FOR_READ}
   *	     <li> {@link #SCHEDULE_FOR_WRITE}
   * 	     <li> {@link #DONE}
   *       <li> {@link #CLOSE_CONNECTION}
   *    </ul>
   * are received.
   *
   * <p /> Note, this method may only return
   * {@link #DONE} | {@link #CLOSE_CONNECTION} iff all response buffers
   * have been written fully written to the client. For complete description
   * of possible request handler events, see description of this interface.
   *
   * @return Action to be executed by the server.
   */
  public int getEvent();

  /**
   * Get part of the response. This method must return the same byte
   * buffer until {@link #scheduled(int size)} has been invoked with a parameter
   * equaling the number of bytes <i>remaining</i> in current byte buffer.
   * This method may be called several times without advancing to the
   * next response part, if the server could only write part of the
   * buffer.
   *
   * Get part of the response. Note that the response header must be
   * serialized by the request handler internally and returned as the
   * first byte buffer through this method.
   *
   * @return Part of the response as a byte buffer.
   */
  public ByteBuffer getResponsePart();

  /**
   * Notify request handler of how many bytes of current response part
   * were scheduled for write operation by the server.
   *
   * @param size Number of bytes scheduled for a write operation.
   */
  public void scheduled(int size);

  /**
   * Notify request handler that current <i>request-response</i>
   * interaction is now complete.
   */
  public void done();
}
