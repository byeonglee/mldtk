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
import java.nio.CharBuffer;

import java.nio.charset.Charset;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CharsetEncoder;

import java.util.HashMap;
import java.util.Iterator;
/**
 * HTTP Message. This class is the superclass for both HTTP requests
 * and HTTP responses. It contains the HTTP headers, the HTTP version,
 * and common methods for serializing HTTP messages (e.g., {@link
 * #serializeMessage()}, {@link #toByteBuffer()}, {@link #toString()}.
 *
 * <p /> Both HTTP request and HTTP response should extend from this
 * abstract class.  Note, every class extending this class must
 * implement method {@link #serializeFirstLine()}. This method
 * serializes the first line of a HTTP message.  For HTTP requests,
 * the first line contains the HTTP method name, HTTP resource name,
 * and HTTP version. For HTTP responses, the first line contains the
 * status code, a human-readable description, and the HTTP version.
 *
 * <p /> Since this class is used in event-driven HTTP server, it is
 * not synchronized.  It should be explicitly synchronized if it is
 * used in a multiple-threaded environment or in another HTTP server.
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.10 $
 */
public abstract class Message {

  /** The character encoder for ASCII. */
  protected static final CharsetEncoder ENCODER =
    Charset.forName("ASCII").newEncoder();

  /** The content-length of this message. */
  protected int contentLength = 0;

  /** The HTTP version. */
  protected int version = Constants.INT_HTTP_1_0;

  /** The HTTP headers. */
  protected HashMap httpHeaders = new HashMap();

  /** Number of bytes used to serialize this HTTP message. */
  private int messageLengthCount;

  /**
   * Set HTTP version.
   *
   * @param version New HTTP version.
   */
  public void setHttpVersion(int version) {
    this.version = version;
  }

  /**
   * Get HTTP version.
   *
   * @return HTTP version.
   */
  public int getHttpVersion() {
    return version;
  }

  /**
   * Add a new HTTP header (name, value).
   *
   * @param name   Name  of a new header.
   * @param value  Value of a new header.
   */
  public void addHeader(String name, String value) {
    String headerName = canonicalize(name);
    if (headerName.equals(Constants.CONTENT_LENGTH)) {
      contentLength = parseInt(value);
    }
    messageLengthCount += headerName.length() + value.length() + 4;
    httpHeaders.put(headerName, value);
  }

  /**
   * Get the content length.
   *
   * @return The content length.
   */
  public int getContentLength() {
    return contentLength;
  }

  /**
   * Parse a string to a number.
   * Return 0, if string does not represent a java integer.
   *
   * @param  number String to be parsed.
   * @return Return parsed integer.
   */
  protected int parseInt(String number) {
    try {
      return Integer.parseInt(number);
    } catch (NumberFormatException nfe) {
      return 0;
    }
  }

  /**
   * Canonicalize header name.
   *
   * @param name Header name.
   * @return Canonicalized header name.
   */
  private String canonicalize(String name) {
    return name.toLowerCase();
  }

  /**
   * Get the value of a HTTP header.
   *
   * @param name Name of a header.
   *
   * @return Value of a header.
   */
  public String getHeader(String name) {
    return (String)httpHeaders.get(canonicalize(name));
  }

  /**
   * Reinitialize all parameters of a current HTTP message.
   *
   * <p />This method is used to recycle current instance of a HTTP message.
   */
  public void clear() {
    httpHeaders.clear();
    messageLengthCount = 0;
    version = 0;
  }

  protected abstract CharBuffer serializeFirstLine();

  /**
   * Serialize HTTP message to a char buffer.
   *
   * @return HTTP message in a char buffer.
   */
  protected CharBuffer serializeMessage() {
    CharBuffer firstLine = serializeFirstLine();

    CharBuffer buffer = CharBuffer.
        allocate(firstLine.capacity() + messageLengthCount);

    buffer.put(firstLine);
    //append HTTP headers.
    Iterator keys = httpHeaders.keySet().iterator();
    while (keys.hasNext()) {
      String name  = (String) keys.next();
      String value = (String) httpHeaders.get(name);

      buffer.put(name);
      buffer.put(Constants.COLON);
      buffer.put(Constants.STRING_WHITESPACE);
      buffer.put(value);
      buffer.put(Constants.CRLF);
    }
    buffer.put(Constants.CRLF);
    buffer.flip();
    return buffer;
  }

  /**
   * Convert response to its string representation.
   *
   * @return String representation of response.
   */
  public String toString() {
    return serializeMessage().toString();
  }

  public ByteBuffer toByteBuffer() {
    try {
      // Convert a string to ASCII bytes in a ByteBuffer
      // The new ByteBuffer is ready to be read.
      return ENCODER.encode(serializeMessage());
    } catch (CharacterCodingException e) {}
    return null;
  }

  /**
   * Convert HTTP version number to HTTP version string.
   *
   * @param httpVersion HTTP version number.
   * @return  <code>null</code> if version number is not valid.
   */
  public static String formatHttpVersion(int httpVersion) {
    switch (httpVersion) {
      case Constants.INT_HTTP_1_0:
        return Constants.STRING_HTTP_1_0;
      case Constants.INT_HTTP_1_1:
        return Constants.STRING_HTTP_1_1;
      case Constants.INT_HTTP_0_9:
        return Constants.STRING_HTTP_0_9;
      default:
        return null;
    }
  }
}
