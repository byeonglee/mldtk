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
/**
 * Thrown to indicate an HTTP status code other than 2xx.
 *
 * <p /> Note that a processing exception's message contains the
 * human-readable description of its status code.
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.11 $
 */
public class ProcessingException extends Exception {

  /** The status code. */
  private int status;

  /**
   * Create a new processing exception with the specified status code.
   *
   * @param status The status code.
   * @throws IllegalArgumentException Signals an invalid status code.
   */
  public ProcessingException(int status) {
    super(Constants.mapStatusCode(status));
    this.status = status;
  }

  /**
   * Return the HTTP status code.
   *
   * @return The status code.
   */
  public int getStatusCode() {
    return status;
  }

}
