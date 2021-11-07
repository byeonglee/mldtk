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
#ifndef XTC_PARSER_H
#define XTC_PARSER_H

#include "Runtime.h"

/** A character stream reader. */
typedef struct __CRTReader {
  /** The input stream. */
  void* stream;

  /** The character read function. */
  int (*getc)(void* stream);
} CRTReader;

/** The parser column type. */
typedef struct __CRTColumn * CRTColumn;

/** The private layout of a parser. */
struct __CRTParser {
  CRTAllocator* alloc;
  CRTReader* reader;
  CRTIndex capacity;
  CRTIndex count;
  bool isEOF;
  CRTChar* data;
  CRTColumn* columns;
};

/** The parser type. */
typedef struct __CRTParser * CRTParser;

/**
 * Create a new parser.
 *
 * @param alloc The allocator or 0 if the default should be used.
 * @param reader The reader.
 * @param file The file name.
 * @param size The file size.
 * @return The new parser.
 */
CRTParser CRTParserCreate(CRTAllocator* alloc, CRTReader* reader, 
                          CRTChar* file, CRTIndex size);

/**
 * Create a new parser.
 *
 * @param alloc The allocator or 0 if the default should be used.
 * @param reader The reader.
 * @param file The file name.
 * @return The new parser.
 */
CRTParser CRTParserCreateDefaultSize(CRTAllocator* alloc,
                                     CRTReader* reader, CRTChar* file);

/**
 * Reset the specified parser to the specified index.
 *
 * @param parser The parser.
 * @param index The index.
 * @return <code>true</code> if the operation was successful.
 */
bool CRTParserReset(CRTParser parser, CRTIndex index);

/**
 * Determine whether the specified index represents the end-of-file
 * for the specified parser.
 *
 * @param parser The parser.
 * @return <code>true</code> if the index represents EOF.
 */
static inline bool
CRTParserIsEOF(CRTParser parser, CRTIndex index) {
  return parser->isEOF && (index == parser->count - 1);
}

/**
 * Delete the specified parser.
 *
 * @param parser The parser.
 */
void CRTParserDelete(CRTParser parser);

#endif /* XTC_PARSER_H */
