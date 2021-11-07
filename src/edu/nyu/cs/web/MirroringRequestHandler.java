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
 * <p /> A mirroring request handler <i>mirrors</i> request and returns it
 * in the body of a corresponding response.
 *
 * @see RequestHandler
 * @see AbstractRequestHandler
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.19 $
 */
public class MirroringRequestHandler extends AbstractRequestHandler {

  /** Default constructor. */
  public MirroringRequestHandler() {}

  public boolean body(ByteBuffer buffer) {
    if (buffer.remaining() == 0) return false;
    buffersToWrite.addLast(buffer);
    //how many bytes are left to be processed.
    bodyLength -= buffer.remaining();
    return true;
  }

  protected void process() throws ProcessingException {
    prepareResponse();

    response.setStatusCode(200);

    //append request headers' length to the total response body length.
    //and add it to the list of body parts.
    ByteBuffer requestByteBuffer = request.toByteBuffer();
    buffersToWrite.addLast(requestByteBuffer);

    //set content-length: request headers plus, if exists, body.
    response.addHeader(Constants.CONTENT_LENGTH,
      Integer.toString(requestByteBuffer.remaining() +
                       request.getContentLength()));

    response.addHeader(Constants.CONTENT_TYPE,
      Constants.CONTENT_TYPE_DEFAULT);
  }
}
