package xtc.lang.overlog.runtime;

import java.io.IOException;
import java.io.DataInputStream;
import java.io.DataOutputStream;

import java.lang.StringBuffer;

public class MsgDroppedTuple implements Tuple, Marshaller<MsgDroppedTuple> {
  Object terms[];
  ID id;
  String name;

  public MsgDroppedTuple(NetAddr v0, NetAddr v1) {
    terms = new Object[2];
    name = new String("msgDropped");
    id = IDMap.getId(name);
    terms[0] = v0;
    terms[1] = v1;
  }

  public MsgDroppedTuple() {
    terms = new Object[2];
    name = new String("msgDropped");
    id = IDMap.getId(name);
  }

  public ID getId() {
    return id;
  }

  @SuppressWarnings("unchecked")
  public <T> T getTerm(int index) {
    return (T) terms[index];
  }

  public MsgDroppedTuple readFromStream(DataInputStream in) throws IOException {
    // i've assumed nothing is null! may need to find a better way for
    // marshalling
    NetAddr addr0 = ((NetAddr) terms[0]).readFromStream(in);
    NetAddr addr1 = ((NetAddr) terms[1]).readFromStream(in);
    return new MsgDroppedTuple(addr0, addr1);
  }

  public void writeToStream(MsgDroppedTuple t, DataOutputStream out)
      throws IOException {
    t.id.writeToStream(id, out);
    NetAddr addr = (NetAddr) t.terms[0];
    addr.writeToStream(addr, out);
    addr = (NetAddr) t.terms[1];
    addr.writeToStream(addr, out);
  }

  @Override
  public String toString() {
    StringBuffer str = new StringBuffer(name);
    str.append("(");
    str.append(((NetAddr) terms[0]).toString());
    str.append(",");
    str.append(((NetAddr) terms[1]).toString());
    str.append(")");
    return str.toString();
  }

  /**
   * returns the number of terms in the tuple
   */
  public int size() {
    return terms.length;
  }

  /**
   * returns all the terms as an object array
   */
  public Object[] terms() {
    return terms;
  }
}
