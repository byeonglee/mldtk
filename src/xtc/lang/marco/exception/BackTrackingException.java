package xtc.lang.marco.exception;

import xtc.lang.marco.analysis.oracle.cpp.QueryState;

@SuppressWarnings("serial")
public class BackTrackingException extends OracleAnalysisException {
  public final QueryState qs;

  public BackTrackingException(QueryState qs) {
    this.qs = qs;
  }
}
