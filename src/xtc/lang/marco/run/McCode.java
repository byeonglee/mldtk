package xtc.lang.marco.run;

import java.util.LinkedList;
import java.util.List;

public class McCode extends McObject {
  public final List<McToken> tokens = new LinkedList<McToken>();

  public McCode(McToken t) {
    tokens.add(t);
  }

  public McCode(List<McToken> l) {
    tokens.addAll(l);
  }

  public boolean equals(Object obj) {
    if (obj instanceof McCode) {
      McCode you = (McCode) obj;
      if (this.tokens.size() == you.tokens.size()) {
        for (int i = 0; i < this.tokens.size(); i++) {
          if (!this.tokens.get(i).equals(you.tokens.get(i))) {
            return false;
          }
        }
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
