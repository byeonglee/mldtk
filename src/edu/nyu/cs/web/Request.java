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
import java.nio.ByteBuffer;
/**
 * <p /> HTTP Request. This class manages HTTP version, method name, resource
 * name and HTTP headers of a HTTP Request. It is used for parsing and managing
 * HTTP requests.
 *
 * <p /> Since it is used in an event-driven HTTP Server, it is not synchronized.
 * It should be explicitly synchronized if it is used in a multiple-threaded
 * environment or in another HTTP Server.
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.23 $
 */
public class Request extends Message {

  /** Method name of current HTTP request. */
  private String methodName;

  /** Resource name of current HTTP request. */
  private String resourceName;

  /** Signals all headers were processed. */
  private boolean isHeadersComplete;

  /** Current header name. */
  private String headerName;

  /** Current header value. */
  private String headerValue;

  /** Last processed header name. */
  private String oldHeaderName;

  /** Temporary buffer to parse request. */
  private StringBuffer requestBuffer = new StringBuffer();

  /**
   * Create a new instance of a request.
   */
  public Request() {}

  /**
   * Reinitialize all parameters of a current request.
   *
   * <p />This method is used to recycle current instance of a request.
   */
  public void clear() {
    super.clear();
    methodName = null;
    resourceName = null;
    isHeadersComplete = false;
    requestBuffer.setLength(0);
  }

  /**
   * Get first line of current HTTP request.
   *
   * @return First line of current HTTP request.
   */
  public String getRequestLine() {
    return serializeFirstLine().toString();
  }

  /**
   * Get method name.
   *
   * @return Method name.
   */
  public String getMethodName() {
    return methodName;
  }

  /**
   * Set method name.
   *
   * @param methodName  New method name.
   */
  public void setMethodName(String methodName) {
    this.methodName = methodName;
  }

  /**
   * Get resource name.
   *
   * @return Resource name.
   */
  public String getResourceName() {
    return resourceName;
  }

  /**
   * Set resource name.
   *
   * @param resourceName  New resource name.
   */
  public void setResourceName(String resourceName) {
    this.resourceName = resourceName;
  }

  /**
   * Signals whether the first line of a HTTP request was processed.
   *
   * @return State of first line processing.
   */
  public boolean isHeaderLine() {
    return (version != -1 && resourceName != null && methodName != null);
  }

  /**
   * Signals whether all HTTP headers were processed.
   *
   * @return State of HTTP headers/' processing.
   */
  public boolean isHeadersComplete() {
    return isHeadersComplete;
  }

  /**
   * Set current state of headers parsing.
   *
   * @param isComplete New state of headers processing.
   */
  public void setHeadersComplete (boolean isComplete) {
    isHeadersComplete = isComplete;
  }

  /**
   * Parse incoming byte array into a request.
   *
   * @param byteBuffer Incoming byte array.
   */
  public void parse(ByteBuffer byteBuffer) {
    processAll(byteBuffer);
    //trim the unneeded.
    if (!isHeadersComplete()) {
        String remaining = requestBuffer.toString().trim();
        requestBuffer = new StringBuffer();
        requestBuffer.append(remaining);
    }
  }

  /**
   * Parse headers.
   *
   * @param byteBuffer Current request.
   */
  private void processAll(ByteBuffer byteBuffer) {
    char current;
    char next;

    while (byteBuffer.position() < byteBuffer.limit()) {
      //read line into a buffer
      current = (char) byteBuffer.get();
      requestBuffer.append(current);
      //if  current char is New_Line of Return, check previous one for new_line
      //and if its true, you got a new line
      if (current == Constants.CHAR_NEW_LINE ||
          current == Constants.CHAR_RETURN) {
        requestBuffer = requestBuffer.deleteCharAt(requestBuffer.length()-1);
        if ((byteBuffer.position () > 0) &&
            (byteBuffer.position() < byteBuffer.limit())) {
          next = (char)byteBuffer.get(byteBuffer.position());
          if (next == current) {
            // we have encountered either \r\r or \n\n.
            // move position to the end and return.
            isHeadersComplete = true;
            byteBuffer.get();
            return;
          } else if (next == Constants.CHAR_NEW_LINE ||
                     next == Constants.CHAR_RETURN) {
            // we have encountered either \r\n or \n\r
            // move position to the end of the line.
            byteBuffer.get();
          }
          if (requestBuffer.length() == 0) {
            isHeadersComplete = true;
            return;
          }
          //now process lines
          if (!this.isHeaderLine()) {
            processFirstLine();
          } else {
             //else process Headers
             processNewLine();
          }
        }
      }
    }
  }

  /**
   * Parse first line of the current request.
   */
  private void processFirstLine() {
    int startIndex = 0;
    int endIndex   = 0;
    String temporaryValue;
    // parse first value.
    endIndex = requestBuffer.indexOf(Constants.STRING_WHITESPACE , startIndex);
    if (endIndex == -1)  return;
    temporaryValue = requestBuffer.substring(startIndex, endIndex).trim();
    if (methodName == null) {
      methodName   = temporaryValue.toUpperCase();
    } else if (resourceName == null) {
      resourceName = temporaryValue;
    } else {
      parseHttpVersion(temporaryValue);
    }
    //parse second value.
    startIndex = endIndex + 1;
    endIndex = requestBuffer.indexOf(Constants.STRING_WHITESPACE, startIndex);
    if (endIndex == -1) return;
    temporaryValue = requestBuffer.substring(startIndex, endIndex).trim();
    if (resourceName == null) {
      resourceName = temporaryValue;
    } else {
      parseHttpVersion(temporaryValue);
    }
    //parse http version
    if (version != -1) {
      startIndex = endIndex + 1;
      temporaryValue = requestBuffer.
          substring(startIndex, requestBuffer.length()).trim();
      parseHttpVersion(temporaryValue);
    }
    requestBuffer = new StringBuffer();
  }

  /**
   * Parse HTTP version.
   *
   * @param passedValue String to be parsed into HTTP version.
   */
  private void parseHttpVersion(String passedValue) {
    if (passedValue.equalsIgnoreCase(Constants.STRING_HTTP_1_1)) {
      this.setHttpVersion(Constants.INT_HTTP_1_1);
    } else if (passedValue.equalsIgnoreCase(Constants.STRING_HTTP_0_9)) {
      this.setHttpVersion(Constants.INT_HTTP_0_9);
    } else {
      this.setHttpVersion(Constants.INT_HTTP_1_0);
    }
  }

  /**
   * Parse exactly one line of headers' part of a request.
   */
  private void processNewLine() {
    int separator = requestBuffer.indexOf(Constants.COLON);
    if (requestBuffer.charAt(0) == Constants.CHAR_WHITESPACE) {
      String oldValue = this.getHeader(oldHeaderName);
      addHeader(oldHeaderName, oldValue + requestBuffer.toString().trim());
    } else  if (separator > 0 ) {
      headerName = requestBuffer.substring(0, separator).trim();
      headerValue = requestBuffer.substring(separator + 1,
                                            requestBuffer.length()).trim();
      oldHeaderName = headerName;
      addHeader(headerName, headerValue);
    }
    requestBuffer = new StringBuffer();
  }

  protected CharBuffer serializeFirstLine() {
    // Calculate: 2 spaces(4) + 1 CRLF(2) + HTTP version (HTTP/X.X) (8) +
    // method name + resource name.
    int requestLengthCount =  0;
    if (methodName != null && resourceName != null) {
      requestLengthCount = 4 + 2 + 8 +
          methodName.length() + resourceName.length();
    }
    CharBuffer buffer = CharBuffer.allocate(requestLengthCount);
    //create first line of a response.
    buffer.put(methodName);
    buffer.put(Constants.STRING_WHITESPACE);
    buffer.put(resourceName);
    buffer.put( Constants.STRING_WHITESPACE);
    buffer.put(Constants.formatHttpVersion(getHttpVersion()));
    buffer.put(Constants.CRLF);

    buffer.flip();
    return buffer;
  }
}
