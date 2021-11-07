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
import java.nio.MappedByteBuffer;

import java.util.LinkedList;
/**
 * <p /> A byte buffer pool stores and reuses an array of byte buffers.
 * To start using this array, a caller have to initialize 2 parameters:
 * <ul>
 *    <li> <i>BufferSize</i>.This is a static variable that must be set for
 *         <b>all</b> instances of <code>ByteBufferPool</code>. It describes
 *         the initial size that each <code>ByteBuffer</code> must have.
 *
 *    <li> <i>PoolSize</i>. This variable is set through method
 *         {@link #setPoolSize(int poolSize)}. It specifies size of a
 *         byte buffer's pool must have.
 * </ul>
 *
 * <p /> Since it is used in an event-driven HTTP Server, it is not
 * synchronized. It should be explicitly synchronized if it is used in a
 * multiple-threaded environment or in another HTTP Server.
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.11 $
 */
public class ByteBufferPool {

  /** Default length of each individulal byte buffer. */
  protected static int BUFFER_SIZE = 1024;

  /** Initial size of current byte buffer pool. */
  private int poolSize;

  /** Current list of all byte buffer in this pool. */
  private LinkedList buffersPool = new LinkedList();

  /** Instantiate byte buffer's pool. */
  public ByteBufferPool() {}

  /**
   * Set size of this byte buffer pool.
   *
   * <p /> Note, this method should be called exactly <b>once</b> right after
   * the instantiation of <code>ByteBufferPool</code>.
   *
   * @param poolSize New size of <code>ByteBufferPool</code>.
   */
  public void setPoolSize(int poolSize) {
    this.poolSize = poolSize;
    init();
  }

  /**
   * Initialize this byte buffer pool.
   */
  private void init() {
    for (int i=0; i<poolSize; i++) {
      buffersPool.add(ByteBuffer.allocateDirect(BUFFER_SIZE));
    }
  }

  /**
   * Get a clean byte buffer from a pool.
   *
   * @return Byte buffer from this pool.
   */
  public ByteBuffer getByteBuffer() {
    if (!buffersPool.isEmpty()) {
      return (ByteBuffer) buffersPool.removeFirst();
    }
    return ByteBuffer.allocateDirect(BUFFER_SIZE);
  }

  /**
   * Return byte buffer back to this pool.
   *
   * @param buffer Returning byte buffer.
   */
  public void returnByteBuffer(ByteBuffer buffer) {
    if (buffer.capacity() != BUFFER_SIZE) return;
    if (buffer instanceof MappedByteBuffer) return;
    if (buffersPool.size()<poolSize) {
      buffer.clear();
      buffersPool.addLast(buffer);
    }
  }
}
