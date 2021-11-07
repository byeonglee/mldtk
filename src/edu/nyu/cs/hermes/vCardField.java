/**
* class vCardField
* This class represents a line in a vCard 
* @author Erik Froese esf221@nyu.edu
*/

package edu.nyu.cs.hermes;

class vCardField{
	
  private String type;
  private String[] parameters;
  private String value;
	private String paramstr;
  private final int MAX_PARAMS = 10;

  public vCardField( String t, String p[], String v){
    this.type = t;
    this.parameters = new String[MAX_PARAMS];
		this.paramstr = "";
    for(int i = 0; i < p.length; i++)
      this.parameters[i] = p[i];
    this.value = v;
  }
  public String getType(){
    if(this.type != null)
      return this.type;
    else
      return null;
  }
  public String[] getParameters(){
    if(this.parameters != null){
      return this.parameters;
    }
    else
      return null;
  }
  public String getValue(){
    if(this.value != null)
      return this.value;
    else
      return null;
  }
}
