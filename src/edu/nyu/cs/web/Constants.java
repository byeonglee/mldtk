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
 * <p /> Definition of some common constants used in this project.
 * This class defines HTTP method names (GET, POST, and HEAD),
 * common header names used by <i>Munin</i> server, protocol versions and
 * their string representations.
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.23 $
 */
public class Constants {

  /** The major version. */
  public static final int VERSION_MAJOR = 1;

  /** The minor version. */
  public static final int VERSION_MINOR = 1;

  /** The release version. */
  public static final int VERSION_RELEASE = 0;

  /** The version as a string. */
  public static final String VERSION = VERSION_MAJOR + "." + VERSION_MINOR
    + "." + VERSION_RELEASE;

  /** New line character */
  public static final char CHAR_NEW_LINE   = '\n';

  /** Return character */
  public static final char CHAR_RETURN     = '\r';

  /** Whitespace character */
  public static final char CHAR_WHITESPACE =  ' ';


  /** String identifier for colon */
  public static final String COLON          = ":";

  /** String identifier for CRLF */
  public static final String CRLF           = "\r\n";

  /** String identifier for whitespace */
  public static final String STRING_WHITESPACE =  " ";


  /** Http Version 0.9 */
  public static final int INT_HTTP_0_9 = 9;

  /** Http Version 1.0 */
  public static final int INT_HTTP_1_0 = 10;

  /** Http Version 1.1 */
  public static final int INT_HTTP_1_1 = 11;


  /** "<code>HTTP/0.9</code>". */
  public static final String STRING_HTTP_0_9 = "HTTP/0.9";

  /** "<code>HTTP/1.0</code>". */
  public static final String STRING_HTTP_1_0 = "HTTP/1.0";

  /** "<code>HTTP/1.1</code>". */
  public static final String STRING_HTTP_1_1 = "HTTP/1.1";


  /** The "<code>GET</code>" method name. */
  public static final String HTTP_METHOD_GET  = "GET";

  /** The "<code>HEAD</code>" method name. */
  public static final String HTTP_METHOD_HEAD = "HEAD";

  /** The "<code>POST</code>" method name. */
  public static final String HTTP_METHOD_POST = "POST";


  /** The "<code>Date</code>" header field name. */
  public static final String DATE           = "date";

  /** The "<code>Content-Length</code>" header field name. */
  public static final String CONTENT_LENGTH = "content-length";

  /** The "<code>Content-Type</code>" header field name. */
  public static final String CONTENT_TYPE   = "content-type";

  /** The "<code>Host</code>" header field name. */
  public static final String HOST           = "host";

  /** The "<code>Language</code>" header field name. */
  public static final String LANGUAGE       = "language";

  /** The "<code>Connection</code>" header field name. */
  public static final String CONNECTION     = "connection";

  /** The Default "<code>Content-Type</code>" */
  public static final String CONTENT_TYPE_DEFAULT = "text/plain";

  /** The "<code>Server</code>" header field name. */
  public static final String SERVER         = "server";

  /** The "<code>Server</code>" header field value. */
  public static final String SERVER_NAME    = "Munin";

  /** Body of a response attached to <code>Bad Request</code> response.*/
  public static final ByteBuffer MESSAGE_400  =
      ByteBuffer.wrap(("The server has detected a syntax error in the " +
                       "client's request.").getBytes());

  /** Body of a response attached to <code>Unauthorized</code> response.*/
  public static final ByteBuffer MESSAGE_401  =
      ByteBuffer.wrap(("The following request lacked proper authorization. "
                       + "Client should supply proper authorization when  " +
                       "requesting this URI again.").getBytes());

  /** Body of a response attached to <code>Forbidden</code> response.*/
  public static final ByteBuffer MESSAGE_403  =
      ByteBuffer.wrap("The request was denied for a server specific reason.".
                      getBytes());

  /** Body of a response attached to <code>File Not Found</code> response.*/
  public static final ByteBuffer MESSAGE_404  =
      ByteBuffer.wrap("The document at the specified URI does not exist.".
                      getBytes());

  /**
   * Body of a response attached to
   * <code>Internal Server error</code> response.
   */
  public static final ByteBuffer MESSAGE_500  =
      ByteBuffer.wrap(("The server has crashed or encountered a configuration "
                       + "error.").getBytes());

  /**
   * Body of a response attached to
   * <code>Not implemented</code> response.
   */
  public static final ByteBuffer MESSAGE_501  =
      ByteBuffer.wrap(("The client requested action cannot be performed by "
                       + "this server.").getBytes());

  /**
   * Body of a response attached to
   * <code>HTTP version not supported</code> response.
   */
  public static final ByteBuffer MESSAGE_505  =
      ByteBuffer.wrap(("The server does not support HTTP version used in the"
                       + " request.").getBytes());

  /**
  * Map a HTTP status code to corresponding body of a response.
  *
  * @param status The status code.
  * @return Body of a response.
  */
  public static ByteBuffer mapMessageBody(int status) {
    switch (status) {
      case 400:
        return MESSAGE_400;
      case 401:
        return MESSAGE_401;
      case 403:
        return MESSAGE_403;
      case 404:
        return MESSAGE_404;
      case 500:
        return MESSAGE_500;
      case 501:
        return MESSAGE_501;
      case 505:
        return MESSAGE_505;
      default:
        return null;
    }
  }

  /**
   * Map a HTTP status code to its human-readable description.
   *
   * @param status The status code.
   * @return The human-readable description.
   * @throws IllegalArgumentException Signals an invalid status code.
   */
  public static String mapStatusCode(int status) {
    switch (status) {
    case 100:
      return "Continue";
    case 101:
      return "Switching Protocols";
    case 200:
      return "OK";
    case 201:
      return "Created";
    case 202:
      return "Accepted";
    case 203:
      return "Non-Authoritative Information";
    case 204:
      return "No Content";
    case 205:
      return "Reset Content";
    case 206:
      return "Partial Content";
    case 300:
      return "Multiple Choices";
    case 301:
      return "Moved Permanently";
    case 302:
      return "Found";
    case 303:
      return "See Other";
    case 304:
      return "Not Modified";
    case 305:
      return "Use Proxy";
    case 307:
      return "Temporary Redirect";
    case 400:
      return "Bad Request";
    case 401:
      return "Unauthorized";
    case 402:
      return "Payment Required";
    case 403:
      return "Forbidden";
    case 404:
      return "Not Found";
    case 405:
      return "Method Not Allowed";
    case 406:
      return "Not Acceptable";
    case 407:
      return "Proxy Authentication Required";
    case 408:
      return "Request Timeout";
    case 409:
      return "Conflict";
    case 410:
      return "Gone";
    case 411:
      return "Length Required";
    case 412:
      return "Precondition Failed";
    case 413:
      return "Request Entity Too Large";
    case 414:
      return "Request URI Too Long";
    case 415:
      return "Unsupported Media Type";
    case 416:
      return "Expectation Failed";
    case 500:
      return "Internal Server Error";
    case 501:
      return "Not implemented";
    case 502:
      return "Bad Gateway";
    case 503:
      return "Service Unavailable";
    case 504:
      return "Gateway Timeout";
    case 505:
      return "HTTP Version Not Supported";
    default:
      throw new
        IllegalArgumentException("Invalid HTTP status code (" + status + ")");
    }
  }

  /**
   * Parse a string to a number.
   * Return 0, if string does not represent a java integer.
   *
   * @param  number String to be parsed.
   * @return Return parsed integer.
   */
  public static int parseInt(String number) {
    try {
      return Integer.parseInt(number);
    } catch (NumberFormatException nfe) {
      return 0;
    }
  }

  /**
   * Parse a string to a boolean.
   * Return false, if string does not represent a java boolean.
   *
   * @param  bool String to be parsed.
   * @return Return parsed boolean.
   */
  protected static boolean parseBoolean(String bool) {
    try {
      return Boolean.valueOf(bool).booleanValue();
    } catch (NumberFormatException nfe) {
      return false;
    }
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
