package xtc.lang.marco.type;

public final class CodeType extends Type {
  public final String lang;
  public final String phrase;

  public CodeType(String lang, String phrase) {
    this.lang = lang;
    this.phrase = phrase;
  }

  public boolean typeEquals(Type t) {
    if (t instanceof CodeType) {
      CodeType ct = (CodeType) t;
      return this.lang.equals(ct.lang) && this.phrase.equals(ct.phrase);
    } else {
      return false;
    }
  }

  public String toExpression() {
    return String.format("Code<%s,%s>", lang, phrase);
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((lang == null) ? 0 : lang.hashCode());
    result = prime * result + ((phrase == null) ? 0 : phrase.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    CodeType other = (CodeType) obj;
    if (lang == null) {
      if (other.lang != null)
        return false;
    } else if (!lang.equals(other.lang))
      return false;
    if (phrase == null) {
      if (other.phrase != null)
        return false;
    } else if (!phrase.equals(other.phrase))
      return false;
    return true;
  }

}
