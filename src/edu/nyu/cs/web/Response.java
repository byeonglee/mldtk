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

import java.nio.CharBuffer;
/**
 * <p /> HTTP Response. This class manages HTTP version, status code and
 * headers of a HTTP response.
 *
 * <p /> Since it is used in event-driven HTTP Server, it is not synchronized.
 * It should be explicitly synchronized if it is used in a multiple-threaded
 * environment or in another HTTP Server.
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.22 $
 */
public class Response extends Message {

  /** Status code. */
  private int statusCode;

  /** Human-readable description. */
  private String status;

  /** Flag, signaling response is of type HEAD. */
  private boolean onlyHeader = false;

  /** Create a new instance of a <code>Response</code>. */
  public Response() {}

  /**
   * Set status code. Note that the human-readable description is
   * automatically filled in.
   *
   * @param code  The new status code.
   * @throws IllegalArgumentException Signals an invalid status code.
   */
  public void setStatusCode(int code) {
    statusCode = code;
    status     = Constants.mapStatusCode(code);
  }

  /**
   * Get status code.
   *
   * @return Status code.
   */
  public int getStatusCode() {
    return statusCode;
  }

  /**
   * Set response to return only HTTP headers (Request of type HEAD).
   *
   * @param only Signals whether request's method name was of type HEAD.
   */
  public void setOnlyHeader(boolean only) {
   onlyHeader = only;
  }

  /**
   * Indicate whether response is of type <code>HEAD</code>.
   *
   * @return indicator.
   */
  public boolean isOnlyHeader() {
    return onlyHeader;
  }

  /**
   * Serialize first line of a HTTP message in <code>CharBuffer</code> format.
   *
   * @see java.nio.CharBuffer
   * @return First line of a HTTP message.
   */
  protected CharBuffer serializeFirstLine() {
   // Calculate: 2 spaces(4) + 1 CRLF(2) + HTTP version (HTTP/X.X) (8) +
   // status code (3) + code description.
   int responseLengthCount = 4 + 2 + 8 + 3 + status.length();

   CharBuffer responseBuffer = CharBuffer.allocate(responseLengthCount);
   // Create first line of a response.
   responseBuffer.put(Message.formatHttpVersion(version));
   responseBuffer.put(Constants.STRING_WHITESPACE);
   responseBuffer.put(Integer.toString(statusCode));
   responseBuffer.put(Constants.STRING_WHITESPACE);
   responseBuffer.put(status);
   responseBuffer.put(Constants.CRLF);

   responseBuffer.flip();
   return responseBuffer;
 }
}
