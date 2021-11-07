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
#ifndef XTC_ASSERT_H
#define XTC_ASSERT_H

#include <assert.h>

/** The current assertion level. */
#define CRT_ASSERTION_LEVEL 3

#if CRT_ASSERTION_LEVEL == 3

#define CRTBeCautious(b) assert(b)
#define CRTBeSuspicious(b) assert(b)
#define CRTBeParanoid(b) assert(b)

#elif CRT_ASSERTION_LEVEL == 2

#define CRTBeCautious(b) assert(b)
#define CRTBeSuspicious(b) assert(b)
#define CRTBeParanoid(b) ((void)0)

#elif CRT_ASSERTION_LEVEL == 1

#define CRTBeCautious(b) assert(b)
#define CRTBeSuspicious(b) ((void)0)
#define CRTBeParanoid(b) ((void)0)

#else

#define CRTBeCautious(b) ((void)0)
#define CRTBeSuspicious(b) ((void)0)
#define CRTBeParanoid(b) ((void)0)

#endif 

#endif /* XTC_ASSERT_H */
