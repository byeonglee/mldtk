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

import java.util.LinkedList;
import java.util.HashMap;
/**
 * <p /> A cache is a place to store recently used resources in a local memory.
 * This implementation is implemented using a <code>HashMap</code>. Where
 * <i>key</i> for each resource is represented through
 * {@link edu.nyu.cs.web.Cache.Key} and contents of a resource is represented
 * through {@link edu.nyu.cs.web.Cache.Value}.
 *
 * <p /> The data structure used to implement this cache is a queue
 * with a <i>Least-Recently Used</i> algorithm. As the size of a cache exceeds
 * certain limit, elements stored last are removed.
 *
 * @author Dmitriy Mindich
 * @version $Revision: 1.8 $
 */
public class Cache {

  /** Default size of this cache. */
  public static int MAX_LENGTH = 100 * 1024 * 1024;

  /** <code>LRU</code> based queue, containing all resources. */
  private LinkedList keys = new LinkedList();

  /** Mapping from <code>Key</code> to its <code>Value</code>. */
  private HashMap mapping = new HashMap();

  /** Reference to byte buffer pool. */
  private ByteBufferPool bufferPool;

  /** Current size of local cache determined iin bytes. */
  private long cacheSize;

  /**
   * Constructor.
   * <p /> Each cache holds as a resource byte buffers.
   * As elements in cache are removed, byte buffers need to be put
   * back to the byte buffer pool.
   *
   * @param pool Byte buffer pool used to store and allocate byte buffers.
   */
  public Cache(ByteBufferPool pool) {
    bufferPool = pool;
  }

  /**
   * Add new resource to this cache.
   *
   * <p /> This method checks to see if another resource
   * with the same name has already being inserted into this cache, and
   * removes it from a cache before inserting new resource.
   *
   * @param key       Unique key representing this resource.
   * @param value  Value to store in this cache.
   */
  public void addResource(Key key, Value value) {
    //remove old entry, then shrink, then add new entry.

    //remove key, if it is already inside this Cache
    if (mapping.containsKey(key)) {
     removeElement(key);
    }
    //shrink(), if size greatly exceeds the limit.
    if (cacheSize > MAX_LENGTH) {
      shrink();
    }

    mapping.put(key, value);
    keys.addFirst(key);
    cacheSize += value.getResource().remaining();
  }

  /**
   * Get resource, based on its key.
   *
   * @param key Key, specifying unique resource.
   * @return Resource beinge retrieved.
   */
  public Value getResource(Key key) {
    Value value = (Value)mapping.get(key);
    if (value != null)  {
      // if value is not null:
      // if key is not the first element in the list,
      // move it to the beginning of the list.
      if (keys.indexOf(key) > 0) {
        keys.remove(key);
        keys.addFirst(key);
      }
    }
    return value;
  }

  /**
   * Check whether a resource with specified key exists in this cache.
   *
   * @param key Key, specifying unique resource.
   *
   * @return <code>TRUE</code> if this resource exists in this cache
   *         and  <code>FALSE</code> otherwise.
   */
  public boolean containsResource(Key key) {
    return mapping.containsKey(key);
  }

  /**
   * Shrinks the size of this cache to predefined value specifed
   * by {@link #MAX_LENGTH}.
   */
  protected void shrink() {
    while (cacheSize > MAX_LENGTH) {
      //remove last element from a linked list.
      removeElement((Key)keys.removeLast());
    }
  }

  /**
   * Remove specified resource from cache.
   *
   * @param key Unique identifier of a resource.
   */
  private void removeElement(Key key) {
    Value value = null;
    ByteBuffer resource = null;

    keys.remove(key);
    //remove from a hash map.
    value = (Value)mapping.remove(key);
    resource = value.getResource();
    //decrement cache counter.
    cacheSize -= resource.remaining();
    // return byte buffer to the pool.
    bufferPool.returnByteBuffer(resource);
  }

  /**
   * <p /> A cache key is a unique identifier used to map each individual
   * resource in a local cache.
   *
   * @see Cache
   * @see Cache.Value
   */
  public static class Key {

    /** HTTP resource name. */
    protected String resourceName = "";

    /** HTTP method name. */
    protected String methodName   = "";

    /** HTTP Language. */
    protected String language     = "";

    /** HTTP host. */
    protected String host         = "";

    /**
     * Constructor.
     *
     * @param methodName    method name of a HTTP request.
     * @param resourceName  resource name of a HTTP request.
     * @param language      language of a HTTP request.
     * @param host          host of a HTTP request.
     */
    public Key(String methodName, String resourceName,
                    String language, String host) {
      this.methodName   = methodName;
      this.resourceName = resourceName;
      this.language     = language;
      this.host         = host;
      validateKey();

    }

    /**
     * Validate all variables of a key.
     * This method is designed to check all variables for null values.
     */
    private void validateKey() {
      if (methodName   == null) methodName   = "";
      if (resourceName == null) resourceName = "";
      if (language     == null) language     = "";
      if (host         == null) host         = "";
    }


    /**
     * Compares this cache key to the specified object.
     *
     * @param object the object to compare this <code>Key</code>
     *                     against.
     *
     * @return  <code>true</code> if the <code>Key</code>are equal;
     *          <code>false</code> otherwise.
     */
    public boolean equals(Object object) {
      if (this == object) return true;
      if (!(object instanceof Key)) return false;

      Key aKey = (Key)object;
      if (!resourceName.equalsIgnoreCase(aKey.resourceName)) return false;
      if (!methodName.equalsIgnoreCase(aKey.methodName))     return false;
      if (!host.equalsIgnoreCase(aKey.host))                 return false;
      if (!language.equalsIgnoreCase(aKey.language))         return false;
      return true;
    }

    /**
     * Return hash code for this cache key.
     *
     * @return A hash code value for this object.
     */
    public int hashCode() {
      int hash = 0;
      hash  = language.hashCode();
      hash *= 31;
      hash += host.hashCode();
      hash *= 31;
      hash += methodName.hashCode();
      hash *= 31;
      hash += resourceName.hashCode();
      return hash;
    }

    /**
     * Serialize cache key to its string representation.
     *
     * @return String representation of a cache key.
     */
    public String toString() {
      return host + " : " + language + " : " +
             methodName + " : " + resourceName;
    }
  }

  /**
   * <p /> A cache value stores information about a resource stored in a local
   * cache. It stores the actual resource (Byte Buffer), its size and also
   * resource mime type.
   *
   * @see Cache
   * @see Cache.Key
   */
  public static class Value {

    /** Byte buffer used to store a resource. */
    private ByteBuffer resource;

    /** Serialized size of a byte buffer. */
    private String size;

    /** Resource mime type. */
    private String mimeType;

    /**
     * Constructor.
     *
     * @param buffer   cached resource.
     * @param size     size of a cached resource.
     * @param mimeType mime type of a cached resource.
     */
    public Value(ByteBuffer buffer, String size, String mimeType) {
      this.resource = buffer;
      this.size     = size;
      this.mimeType = mimeType;
    }

    /**
     * Get resource associated with this <code>Value</code>.
     *
     * @return Byte buffer representing this resource.
     */
    public ByteBuffer getResource() {
      return resource.duplicate();
    }

    /**
     * Get serialized version of this resource size.
     *
     * @return Serialized version of this resource size.
     */
    public String getSize() {
      return size;
    }

    /**
     * Get mime type associated with this resource.
     *
     * @return Mime type of this resource.
     */
    public String getMimeType() {
      return mimeType;
    }
  }
}
