/*
 * xtc - The eXTensible Compiler
 * Copyright (C) 2006 Robert Grimm
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * version 2.1 as published by the Free Software Foundation.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
 * USA.
 */
#ifndef XTC_NODE_H
#define XTC_NODE_H

#include "Core.h"
#include "String.h"
#include "Pair.h"

/** The node type. */
typedef struct __CRTNode * CRTNode;

/** The private node layout. */
struct __CRTNode {
  CRTObjectHeader header;
  CRTString name;
  CRTChar* file;
  CRTIndex line;
  CRTIndex column;
  CRTIndex capacity;
  CRTIndex size;
  CRTReference children[];
};

/** The private node id. */
extern CRTTypeID __CRTNodeID;

/**
 * Get the type id for nodes.
 *
 * @return The type id for nodes.
 */
static inline CRTTypeID
CRTNodeID(void) {
  return __CRTNodeID;
}

/**
 * Paranoically assert that the specified pointer is a node.
 *
 * @param p The pointer.
 */
#define CRTAssertNode(p)                                \
  CRTBeParanoid(CRTIsInstanceOf(p, CRTNodeID()))

/**
 * Create a new node with the specified name and capacity.
 *
 * @param name The name.
 * @param capacity The capacity.
 * @return The corresponding node.
 */
CRTNode CRTNodeCreate(CRTString name, CRTIndex capacity);

/**
 * Add the specified reference as child to the specified node.
 *
 * @param n The node.
 * @param r The new child.
 */
CRTNode CRTNodeAdd(CRTNode n, CRTReference r);

/**
 * Add the references on the list starting with the specified pair as
 * children to the specified node.
 *
 * @param n The node.
 * @param p The list of new children.
 */
CRTNode CRTNodeAddAll(CRTNode n, CRTPair p);

/**
 * Get the specified node's name.
 *
 * @param n The node.
 * @return The name.
 */
static inline CRTString
CRTNodeName(CRTNode n) {
  CRTAssertNode(n);

  return n->name;
}

/**
 * Determine whether the specified node has a location.
 *
 * @param n The node.
 * @return <code>true</code> if the node's location has been set.
 */
static inline bool
CRTNodeHasLocation(CRTNode n) {
  CRTAssertNode(n);

  return 0 != n->file;
}

/**
 * Set the specified node's location.  If the node does not yet have a
 * location, this function sets the node's file, line, and column.
 *
 * @param n The node.
 * @param file The file name.
 * @param line The line.
 * @param column The column.
 */
static inline void
CRTNodeSetLocation(CRTNode n, CRTChar* file, CRTIndex line, CRTIndex column) {
  CRTAssertNode(n);
  CRTAssertString(file);

  if (0 == n->file) {
    CRTRetain(file);
    n->file   = file;
    n->line   = line;
    n->column = column;
  }
}

/**
 * Get the specified node's file name.
 *
 * @param n The node.
 * @return The file name.
 */
static inline CRTChar*
CRTNodeFile(CRTNode n) {
  CRTAssertNode(n);
  CRTBeSuspicious(CRTNodeHasLocation(n));

  return n->file;
}

/**
 * Get the specified node's line number.
 *
 * @param n The node.
 * @return The line number.
 */
static inline CRTIndex
CRTNodeLine(CRTNode n) {
  CRTAssertNode(n);
  CRTBeSuspicious(CRTNodeHasLocation(n));

  return n->line;
}

/**
 * Get the specified node's column number.
 *
 * @param n The node.
 * @return The column number.
 */
static inline CRTIndex
CRTNodeColumn(CRTNode n) {
  CRTAssertNode(n);
  CRTBeSuspicious(CRTNodeHasLocation(n));

  return n->column;
}

/**
 * Get the specified node's capacity.
 *
 * @param n The node.
 * @return The capacity.
 */
static inline CRTIndex
CRTNodeCapacity(CRTNode n) {
  CRTAssertNode(n);

  return n->capacity;
}

/**
 * Get the specified node's size.
 *
 * @param n The node.
 * @return The size.
 */
static inline CRTIndex
CRTNodeSize(CRTNode n) {
  CRTAssertNode(n);

  return n->size;
}

/**
 * Get the specified node's child at the specified index.
 *
 * @param n The node.
 * @param idx The index.
 * @return The child.
 */
static inline CRTReference
CRTNodeGet(CRTNode n, CRTIndex idx) {
  CRTAssertNode(n);
  CRTBeSuspicious((0 <= idx) && (idx < n->size));

  return n->children[idx];
}

/** Initialize the node class. */
void CRTNodeInit(void);

#endif /* XTC_NODE_H */
