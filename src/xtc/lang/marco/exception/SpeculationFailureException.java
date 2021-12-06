package xtc.lang.marco.exception;

@SuppressWarnings("serial")
public class SpeculationFailureException extends RuntimeException {
  public final String scope, id;

  public SpeculationFailureException(String scope, String id) {
    super();
    this.scope = scope;
    this.id = id;
  }
}
