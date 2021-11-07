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
#ifndef XTC_PARSER_INTERNAL_H
#define XTC_PARSER_INTERNAL_H

#include "Parser.h"
#include "String.h"
#include "Node.h"

/** The private layout of a column header. */
struct __CRTColumn {
  CRTChar* file;
  bool     seenCR;
  CRTIndex line;
  CRTIndex column;
};

/**
 * Get the character at the specified index for the specified parser.
 *
 * @param parser The parser.
 * @param index The index.
 * @return The character or -1 if the index is at the end-of-file.
 */
int CRTParserGetChar(CRTParser parser, CRTIndex index);

/**
 * Get the string difference between the specified indices for the
 * specified parser.
 *
 * @param parser The parser.
 * @param start The start index.
 * @param end The end index.
 * @return The corresponding string.
 */
CRTString CRTParserDifference(CRTParser parser, CRTIndex start, CRTIndex end);

/**
 * Create a new parser column.
 *
 * @param alloc The allocator.
 * @return A new parser column.
 */
CRTColumn CRTParserColumnCreate(CRTAllocator* alloc);

/**
 * Delete the specified parser column.
 *
 * @param alloc The allocator.
 * @param c The column.
 */
void CRTParserColumnDelete(CRTAllocator* alloc, CRTColumn c);

/**
 * Get the column at the specified index for the specified parser.
 *
 * @param parser The parser.
 * @param index The index.
 * @return The column.
 */
CRTColumn CRTParserColumn(CRTParser parser, CRTIndex index);

/**
 * Set the specified node's location to the specified index for the
 * specified parser.
 *
 * @param parser The parser.
 * @param node The node.
 * @param index The index.
 */
void CRTParserSetLocation(CRTParser parser, CRTNode node, CRTIndex index);

#endif /* XTC_PARSER_INTERNAL_H */
