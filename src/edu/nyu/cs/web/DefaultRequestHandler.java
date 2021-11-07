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

import java.io.FileInputStream;

import java.nio.MappedByteBuffer;
import java.nio.ByteBuffer;

import java.nio.channels.FileChannel;

import java.util.logging.Level;
/**
 * <p /> A default request handler retrieves files from a local storage.
 * This implementation of request handler parses <b>only</b>
 * GET and HEAD methods of HTTP 1.0. It is responsible for processing request
 * and generating appropriate response.
 *
 * <p /> Note, all files are retrieved from a local folder <i>htroot</i>. To
 * change a path to a local folder, modify property <i>InitPath</i> in a
 * <b>munin.config</b> file.
 *
 * @see RequestHandler
 * @see AbstractRequestHandler
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.29 $
 */
public class DefaultRequestHandler extends AbstractRequestHandler {

  /** Initial path to files. */
  protected static String INIT_PATH  = "htroot";

  /** Default constructor. */
  public DefaultRequestHandler() {}

  public boolean body(ByteBuffer buffer) {
    //how many bytes are left to be processed.
    bodyLength -= buffer.remaining();
    return false;
  }

  protected void process() throws ProcessingException {
    prepareResponse();
    //try to upload specified file.
    try {
      retrieveResource(response, request.getResourceName());
      response.setStatusCode(200);
    } catch (java.io.FileNotFoundException fnf) {
      logger.logp(Level.INFO, className, "process()", fnf.toString());
      throw new ProcessingException(404);
    } catch (java.io.IOException io) {
      logger.logp(Level.INFO, className, "process()", io.toString());
      throw new ProcessingException(500);
    }
  }

  /**
   * Retrieve file from a local storage.
   *
   * @param response  Current response.
   * @param pathName  Path to a file.
   * @throws java.io.IOException
   *              Signals an exception was thrown while retrieving a file.
   * @throws edu.nyu.cs.web.ProcessingException
   *              Signals that specified resource was not found.
   */
  private void retrieveResource(Response response, String pathName)
     throws java.io.IOException, ProcessingException {

    Cache.Key key = new Cache.Key(
      request.getMethodName(), request.getResourceName(),
      request.getHeader(Constants.LANGUAGE), request.getHeader(Constants.HOST));

    Cache.Value value = null;
    ByteBuffer buffer = null;

    //try to upload from cache.
    if (cache.containsResource(key)) {
      value = (Cache.Value)cache.getResource(key);
      buffer = value.getResource();
    } else {
      // Open the file and then get a channel from the stream
      FileInputStream fis = new FileInputStream(INIT_PATH + pathName);
      FileChannel fc = fis.getChannel();
      long fileSize = fc.size();
      buffer = (ByteBuffer)fc.map(FileChannel.MapMode.READ_ONLY, 0, fileSize);

      value = new Cache.Value(buffer,
        Long.toString(fileSize), getMimeType(pathName));
      cache.addResource(key, value);
    }
    //set Content-Length Header
    response.addHeader(Constants.CONTENT_LENGTH, value.getSize());
    response.addHeader(Constants.CONTENT_TYPE, value.getMimeType());
    logger.logp(Level.FINER, className, "retrieveResource()",
                "File was successfully retrieved.");
    buffersToWrite.addLast(buffer);
  }
}
