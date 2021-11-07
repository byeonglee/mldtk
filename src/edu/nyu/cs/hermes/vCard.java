/**
* A class to represent a vCard (RFC 2426)
* The vCard Object is just an Array of vCardField
* Objects. Each vCardField is a field you would
* encounter in a vCard. See the docs for the vCardField
* @ author Erik Froese
*
* From this Object one can retrieve vCardField values using
* the getValue() method and a specified set of parameters.
*
* Possible ways to extend:
* add a validate method - Check for required fields...
*/

package edu.nyu.cs.hermes;

import java.util.StringTokenizer;
import edu.nyu.cs.hermes.vCardField;

class vCard{

  vCardField[] fields;
  int index;
  /**
  * Empty Constructor instantiate ArrayList fields
  * @params none
  */
  public vCard(){
    this.fields = new vCardField[ 200 ];
    this.index = 0;
  }

  /**
  * Set a vCard field in the vCard Object. This vCardField will be
   * added to the END of the array.
  * @params String t The type of field
  *         String[] p An array of Strings containing paramters
  *         for the field type
  *         String v The field value
  * @return boolean whether or not the field was added
  */
  public boolean setField( String t, String p[], String v ){
    boolean dup = false;
    if( t == null || v == null) //params can be null, not type or value
      return false;

    this.fields[index] = new vCardField( t, p, v);
    this.index++;
    return true;
  }
  /**
   * Set a vCardField in the vCard Object. This vCardField will be
   * added to the END of the array.
   * @param vcf The vCardField
   * @return whether or not the field was added
   */
  public boolean setField( vCardField vcf ){
    if( vcf.getType() == null || vcf.getValue() == null)
      return false;

    this.fields[index] = vcf;
    this.index++;
    return true;
  }
	
  /**
  * Method to get the value of the field with type t
  * and params p. The method returns the FIRST vCardField
  * who's params[] contains all the Strings in p. BE SPECIFIC
  * WHEN NAMING YOUR PARAMETERS!!!
  * @params String t the type of the field
  *         String[] p the paramters
  * @return String The value, null if the field doesn't exist.
  */
  public String getValue( String t, String p[] ){
    System.out.println("*****getValue() called class vCard for " + t);
    if( t == null || p ==null){ //works
      return null;
    }
		//type is not found in the vCard
    if(! this.isInArray(t, this.getFieldTypes())){//works
      return null;
    }
		String[] params = new String[ 10 ];
    boolean paramFound = false;
    int i = 0, j = 0, k = 0;

    while(i < this.fields.length){
			System.out.println("Enter while loop getValue " + i);
      if( this.fields[i] == null || this.fields[i].getType() == null){
				System.out.println(" field or type was null");
				i++;
				continue;
			}
			System.out.println("type " + this.fields[i].getType() );
			j=0;
      if(this.fields[i].getType().equals( t )){//matched type
				System.out.println("matched type getType = "+this.fields[i].getType() + " t = " + t );
        params = this.fields[i].getParameters();//get parameters for vCardField we matched
				do{
					System.out.println("ENTERED DO LOOP****");
          if(p[j] != null){
						paramFound = false;
						System.out.println("p[j] != null " + p[j] );
            if(this.isInArray(p[j], params)){
							System.out.println("paramsfound");
              paramFound = true;
            }
          }
          j++;
        }while(j < p.length);
		  }
			if( paramFound ){
        return this.fields[i].getValue();
			}
			i++;
    }//end while
    return null;
  }// end method
	
	/** Method to retrieve the value field from a vCardField
	 * object stored in the vCard. This method will return the
	 * first instance of a vCardField encountered whose type
	 * field matches the String provided in the paramters.
	 * This method is useful for finding values that are
	 * unique in vCards (ie BEGIN, END, FN...)
	 * @param String the type field we're looking for
	 * @return String the value or null if not found
	 */
	public String getValue( String t ){
		if(! this.isInArray(t, this.getFieldTypes())
			 || t == null ){//works
      return null;
    }
		String f[] = new String[200];
		f = this.getFieldTypes();
		for( int i = 0; i < f.length; i++ ){
			if( f[i] != null && f[i].equals( t ) )
				return this.fields[i].getValue();
		}
		return null;
				
	}

  /** Get an array of Strings representing the type field
   * of each vCardFields in the vCard Object
   * @return Stirng[] rFields Each String is the type field of
   * a vCardField Object in the this.fields IN ORDER!!
   */
  public String[] getFieldTypes(){
    String[] rFields;
    rFields = new String[ 200 ];
    for( int i = 0; i < this.fields.length; i++ ){
      if(this.fields[i] != null ){
        rFields[i] = this.fields[i].getType();
      }
    }
    return rFields;
  }

  /**
   * method to return the array of vCardFields stored as this.fields[]
   * @return array of vCardFields stored as this.fields[]
   */
  public vCardField[] getFields(){
    if(this.fields != null)
      return this.fields;
    return null;
  }
		
  /** Method that tests whether or not the given String s
   * is contained in the array of String Objects a. In a
   * piece of novel logic on my part, if each String in
   * the array is null, the method returns true
   * (This is just for my sanity and eyesight when writing
   * the getValue method)
   * @param s String to be matched
   * @param a String array possibly containing a match for s
   * @return boolean whether or not a contains a match for s
   */
	private boolean isInArray(String s, String a[]){
		if(a != null){
      for(int i=0; i < a.length; i++)
        if( s.equals(a[i]) )
          return true;
    }
      return false;
  }

	/** Method to test whether or not the vCard contains
	* the necessary fields specified in RFC 2426
	* @return boolean whether or not the vCard is valid
	*/
	public boolean isValid( ){
    if( this.fields != null ){
			String[] p = new String[ 1 ];
		  String BEGIN = this.getValue( "BEGIN" ),
								FN = this.getValue( "FN" ),
								 N = this.getValue( "N" ),
		           END = this.getValue( "END" );
			if( BEGIN != null
			    && FN != null
			    &&  N != null
			    && END != null )
				return true;
			else
				return false;
		}
		return false;
	}
  /**Method to make this vCard into a form more accomidating the
  hermes system. Some fields are modified, others added. Really
  done for clarity in the mail daemon.
  */
  public String hermesIt( ){
		System.out.println("*******HERMES IT*****");
  	String first = "", middle = "", last = "", loc="";
  	String p[] = new String[ 10 ];
  	StringTokenizer st = new StringTokenizer( this.getValue("FN") );
  	String s = st.nextToken();
		
  	if(! (s.charAt( s.length() - 1 ) == '.') ){ //if the first toekn doesnt end in a .
	  	first = new String(s);
	  }
	  else first = st.nextToken();//Mr. Dr. ...
    s = st.nextToken();
	  if(s.charAt( s.length() - 1 ) == '.' ){ //middle init
	    middle = new String(s);
	  }
	  while( st.hasMoreTokens() )
		  last = last + st.nextToken();
  
  	this.setField(new vCardField("FIRSTNAME", p , first));
  	this.setField(new vCardField("LASTNAME", p , last));
  	this.setField(new vCardField("MIDDLEINIT", p , middle));
		System.out.println("NAMES SET");
    String note = this.getValue("NOTE");
		if(note == null)
			return "NO NOTE";
		
  	st = new StringTokenizer( this.getValue("NOTE"), ",", false );
   	loc = st.nextToken();
  	this.setField(new vCardField("LOCATION", p , loc));
		int i = 0;
		String pref = "";
		if( ! st.hasMoreTokens() )
			return "NO PREFS";
		else{
			System.out.println("PREF DETERMINATION");
			while( st.hasMoreTokens() ){
				pref = st.nextToken();
				if(pref.equals("TEL_WORK")){
					System.out.println(pref);
					p[0] = "WORK";
					this.setField("CONTACT_"+i, p, "phone://" + this.getValue("TEL", p));
					p[0] = "";
				}
				if(pref.equals("TEL_CELL")){
					p[0] = "CELL";
					this.setField("CONTACT_"+i, p, "cell://" + this.getValue("TEL", p));
					p[0] = "";
				}
				if(pref.equals("EMAIL")){
					this.setField("CONTACT_"+i, p, "email://" +this.getValue("EMAIL", p));
				}
				if(pref.equals("AIM")){
					String val = this.getValue("AIM");
					if( val == null )
						val = this.getValue("X-AIM");
					this.setField("CONTACT_"+i, p, val);
				}
			  i++;
			}
			System.out.println("PREF DETER DONE");
		}
		System.out.println("PHOTO THEN OUT");
		String pic = this.getValue("PHOTO");
		if( pic == null)
			return "NO PHOTO";
		else
			return "DONE";
	}

}//end class vCard
//remove trailing ;'s from value fields
