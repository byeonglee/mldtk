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

import java.util.Date;
import java.util.TimeZone;
import java.util.Locale;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
/**
 * InternetDate parses and formats date and time
 * specifications. Specifically, it parses date and time specifications
 * in three formats: <a href="http://www.ietf.org/rfc/rfc0822.txt">RFC
 * 822</a> updated by <a
 * href="http://www.ietf.org/rfc/rfc1123.txt">RFC 1123</a>, <a
 * href="http://www.ietf.org/rfc/rfc0850.txt">RFC 850</a> obsoleted by
 * <a href="http://www.ietf.org/rfc/rfc1036.txt">RFC 1036</a>, and
 * ANSI C's asctime() format. It only converts into the RFC 822 / 1123
 * format, as this format is the preferred format for Internet usage.
 *
 * @version $Revision: 1.9 $
 * @author  Robert Grimm
 */
public class InternetDate {
  /** RFC 822 / 1123 format, but unspecified time zone. */
  protected static final String FORM_822 = "EEE, dd MMM yyyy HH:mm:ss zzz";
  /** RFC 850 / 1036 format, but unspecified time zone. */
  protected static final String FORM_850 = "EEEE, dd-MMM-yy HH:mm:ss zzz";
  /** asctime format, two spaces and one date digit. */
  protected static final String FORM_C_1 = "EEE MMM  d HH:mm:ss yyyy";
  /** asctime format, one space and two date digits. */
  protected static final String FORM_C_2 = "EEE MMM dd HH:mm:ss yyyy";
  /** RFC 822 / 1123 format. */
  protected static final String FORM_OUT = "EEE, dd MMM yyyy HH:mm:ss 'GMT'";

  /** The time zone object for GMT. */
  protected static final TimeZone gmt = TimeZone.getTimeZone("GMT");

  /** Date formatter for RFC 822 / 1123 with unspecified time zone. */
  protected DateFormat form822;
  /** Date formatter for RFC 850 / 1036 with unspecified time zone. */
  protected DateFormat form850;
  /** Date formatter for asctime format with one date digit. */
  protected DateFormat formC1;
  /** Date formatter for asctime format with two date digits. */
  protected DateFormat formC2;
  /** Date formatter for RFC 822 / 1123 (in GMT). */
  protected DateFormat formOut;

  /**
   * Create a new InternetDate.
   */
  public InternetDate() {
    // Create new formatters.
    form822 = new SimpleDateFormat(FORM_822, Locale.US);
    form850 = new SimpleDateFormat(FORM_850, Locale.US);
    formC1  = new SimpleDateFormat(FORM_C_1, Locale.US);
    formC2  = new SimpleDateFormat(FORM_C_2, Locale.US);
    formOut = new SimpleDateFormat(FORM_OUT, Locale.US);

    // Set their time zone to GMT.
    formC1.setTimeZone(gmt);
    formC2.setTimeZone(gmt);
    formOut.setTimeZone(gmt);
  }

  /**
   * Parse a date and time. Attempts to parse a string according to
   * RFC 822 / 1123, RFC 850 / 1036, and ANSI C's asctime() formats in
   * this order. Note that this method is not thread-safe.
   *
   * @param   s                  The string describing the date
   *                             and time.
   * @return                     The parsed date and time.
   * @throws  IllegalArgumentException
   *                             Signals that the date and time
   *                             specification is in an unrecognized
   *                             format.
   */
  public Date parse(String s) throws IllegalArgumentException {
    Date date;

    try {
      date = form822.parse(s);
    } catch (ParseException x) {
      try {
        date = form850.parse(s);
      } catch (ParseException xx) {
        try {
          date = formC1.parse(s);
        } catch (ParseException xxx) {
          try {
            date = formC2.parse(s);
          } catch (ParseException xxxx) {
            throw new IllegalArgumentException("Invalid date and time");
          }
        }
      }
    }

    return date;
  }

  /**
   * Format a date and time. Note that this method is not thread-safe.
   *
   * @param   date  The date and time to format in RFC 822 / 1123
   *                format.
   * @return        A string representing the date and time in
   *                RFC 822 / 1123 format.
   */
  public String format(Date date) {
    return formOut.format(date);
  }
}
