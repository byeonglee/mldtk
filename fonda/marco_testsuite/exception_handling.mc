extern boolean simple_expression(Code<cpp,expr>);

Code<cpp,stmt> throw(Code<cpp,expr> value) {
  if (simple_expression(value)) {
    return `cpp(stmt)[ { /*throw1*/
      if (exception_ptr == NULL) {
        error("No handler for %d", $value);
      } else longjmp(exception_ptr, $value);
    }];
  } else {
    return `cpp(stmt)[ {/*throw2*/
      int the_value = $value;
      if (exception_ptr == NULL)
        error("no handler for %d", the_value);
      else longjmp(exception_ptr, the_value);
    }];
  }
}

Code<cpp,stmt> catch(
   Code<cpp,expr> tag,
   Code<cpp,stmt> handler,
   Code<cpp,stmt> body) {
   Code<cpp,stmt> throwStmt = throw(`cpp(expr)[result]); #catch1
  return `cpp(stmt)[{ /*catch2*/
    int old_exception_ptr = exception_ptr;
    int jmp_buf[2];
    int result;
    result = setjmp(jmp_buf);
    if (result == 0) {
      exception_ptr = jmp_buf;
      $body
    } else {
       exception_ptr = old_exception_ptr;
       if (result == $tag)
         $handler
       else
         $throwStmt
    }
  }];
}

Code<cpp,stmt> unwind_protect(
  Code<cpp,stmt> body,
  Code<cpp,stmt> cleanup) {
  Code<cpp,stmt> throwStmt = throw(`cpp(expr)[result]);  #unwind_protect1
  return `cpp(stmt) [ /*unwind_protect2*/
    int *old_exception_ptr = exception_ptr;
    int jmp_buf[2];
    int result = setjump(jmp_buf);
    if (result == 0) {
      exception_ptr = jmp_buf;
      $body
    }
    exception_ptr = old_exception_ptr;
    $cleanup
    if (result != 0)
      $throwStmt
  ];
}
