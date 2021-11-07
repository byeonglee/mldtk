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

#include "ParserInternal.h"
#include "Null.h"

#include <string.h>

/**
 * The default size for the arrays storing the memoization table's
 * columns.
 */
#define INIT_SIZE 4096

/**
 * The increment for the arrays storing the memoization table's
 * columns.
 */
#define INCR_SIZE 4096

CRTParser CRTParserCreate(CRTAllocator* alloc, CRTReader* reader,
                          CRTChar* file, CRTIndex size) {
  CRTBeSuspicious(0 <= size);

  if (0 == alloc) alloc = CRTAllocatorDefault();

  CRTParser p = alloc->malloc(sizeof(struct __CRTParser));
  if (0 == p) return 0;

  p->alloc = alloc;
  p->reader    = reader;
  p->capacity  = size + 1;
  p->count     = 0;
  p->isEOF     = false;

  p->data = alloc->calloc(size+1, 1);
  if (0 == p->data) {
    alloc->free(p);
    return 0;
  }

  p->columns = alloc->calloc(size+1, sizeof(CRTColumn));
  if (0 == p->columns) {
    alloc->free(p->data);
    alloc->free(p);
    return 0;
  }

  CRTColumn c = CRTParserColumnCreate(alloc);
  if (0 == c) {
    alloc->free(p->columns);
    alloc->free(p->data);
    alloc->free(p);
  }

  c->file       = file;
  c->seenCR     = false;
  c->line       = 1;
  c->column     = 0;

  p->columns[0] = c;
}

CRTParser CRTParserCreateDefaultSize(CRTAllocator* alloc,
                                     CRTReader* reader, CRTChar* file) {
  return CRTParserCreate(alloc, reader, file, INIT_SIZE-1);
}

bool CRTParserReset(CRTParser parser, CRTIndex index) {
  CRTBeSuspicious((0 <= index) && (index < parser->count));

  if (0 == index) return true;

  CRTColumn c1 = CRTParserColumn(parser, index);
  CRTColumn c2 = CRTParserColumnCreate(parser->alloc);
  if (0 == c2) return false;

  c2->file   = c1->file;
  c2->seenCR = c1->seenCR;
  c2->line   = c1->line;
  c2->column = c1->column;

  CRTParserColumnDelete(parser->alloc, parser->columns[0]);
  parser->columns[0] = c2;

  CRTIndex length = parser->count - index;

  memmove(parser->data, parser->data + index, length);
  memset(parser->data + length, 0, index);

  for (int i=1; i<parser->count; i++) {
    CRTParserColumnDelete(parser->alloc, parser->columns[i]);
    parser->columns[i] = 0;
  }

  parser->count = length;
  return true;
}

bool CRTParserGrow(CRTParser parser, CRTIndex size) {
  // Determine the new capacity.
  int cap = parser->capacity + INCR_SIZE;

  // Reallocate the character array.
  CRTChar* old1  = parser->data;
  parser->data   = parser->alloc->realloc(old1, cap);
  if (0 == parser->data) {
    parser->data = old1;
    return false;
  }
  // Clear the new area.
  memset(parser->data + parser->capacity, 0, INCR_SIZE);

  // Reallocate the column array.
  CRTColumn* old2 = parser->columns;
  parser->columns = parser->alloc->realloc(old2,
                                           cap * sizeof(struct __CRTColumn));
  if (0 == parser->columns) {
    parser->columns = old2;
    return false;
  }
  // Clear the new area.
  memset(parser->columns + parser->capacity, 0,
         INCR_SIZE * sizeof(struct __CRTColumn));

  // Update the capacity.
  parser->capacity = cap;
  return true;
}

void CRTParserDelete(CRTParser parser) {
  for (int i=0; i<parser->count; i++) {
    CRTParserColumnDelete(parser->alloc, parser->columns[i]);
  }
  parser->alloc->free(parser->columns);
  parser->alloc->free(parser->data);
  parser->alloc->free(parser);
}

int CRTParserGetChar(CRTParser parser, CRTIndex index) {
  if (parser->isEOF) {
    if (index < parser->count-1) {
      return parser->data[index];
    } else {
      CRTBeSuspicious(index < parser->count);
      return -1;
    }
  } else if (index < parser->count) {
    return parser->data[index];
  }

  CRTBeSuspicious(index == parser->count);

  int c = parser->reader->getc(parser->reader->stream);

  if (parser->capacity <= parser->count) {
    if (! CRTParserGrow(parser, (-1 == c) ? 1 : INCR_SIZE)) return -1;
  }

  if (-1 == c) {
    parser->isEOF = true;
  } else {
    parser->data[index] = (CRTChar)c;
  }
  parser->count++;

  return c;
}

CRTString CRTParserDifference(CRTParser parser, CRTIndex start, CRTIndex end) {
  if (start == end) {
    return CRTSTR("");
  } else {
    return CRTStringCreateFromArray(parser->data, start, end-start);
  }
}

CRTColumn CRTParserColumn(CRTParser parser, CRTIndex index) {
  if (parser->capacity == index) CRTParserGrow(parser, INCR_SIZE);

  CRTColumn c = parser->columns[index];
  if (0 != c) return c;

  CRTColumn last = 0;
  int       start;
  for (start=index; start>=0; start--) {
    last = parser->columns[start];
    if (0 != last) break;
  }

  int  line   = last->line;
  int  column = last->column;
  bool seenCR = last->seenCR;

  for (int i=start; i<index; i++) {
    switch (parser->data[i]) {
    case '\t':
      column = ((column >> 3) + 1) << 3;
      seenCR = false;
      break;
    case '\n':
      if (! seenCR) {
        line++;
        column = 0;
      }
      seenCR = false;
      break;
    case '\r':
      line++;
      column = 0;
      seenCR = true;
      break;
    default:
      column++;
      seenCR = false;
    }
  }

  c = CRTParserColumnCreate(parser->alloc);
  c->file   = last->file;
  c->seenCR = seenCR;
  c->line   = line;
  c->column = column;
  parser->columns[index] = c;

  return c;
}

void CRTParserSetLocation(CRTParser parser, CRTNode node, CRTIndex index) {
  if ((0 != node) && (! CRTIsNull(node)) && (! CRTNodeHasLocation(node))) {
    CRTColumn c = CRTParserColumn(parser, index);
    CRTNodeSetLocation(node, c->file, c->line, c->column);
  }
}
