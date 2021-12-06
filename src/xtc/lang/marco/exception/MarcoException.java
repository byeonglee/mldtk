package xtc.lang.marco.exception;

import xtc.lang.marco.ast.StrongAst;

@SuppressWarnings("serial")
public class MarcoException extends RuntimeException {
  public final StrongAst cause;

  public MarcoException(StrongAst cause, String fmt, Object... args) {
    super(String.format(fmt, args));
    this.cause = cause;
  }

  public MarcoException(StrongAst cause, String msg) {
    super(msg);
    this.cause = cause;
  }

  public MarcoException(Throwable ce, StrongAst cause, String msg) {
    super(msg, ce);
    this.cause = cause;
  }
}
