/** vcard parser converted from php script
   @author Erik Froese
   Adapted from the php scrip found at
   http://ciaweb.net/free/contact_vcard_parse.php

   much thanks
*/
package edu.nyu.cs.hermes;

import java.util.*;
import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;

public class vCardParser{

  private String encoding;
  private File vcf;
  private String[] cardtext;
  private int MAX_PARAMS = 10;
  private boolean dbg = false;

  //constructor for multiple files
  public vCardParser(boolean p){
		this.dbg = p;
  }
	public vCardParser(){
	}

  public vCard parse( String fileNameP ){
    //this.encoding = setEncoding();
    this.vcf = new File( fileNameP );
    this.cardtext = fileToStrings( this.vcf );
    /*System.out.println("After fileToStrings");
    for(int k=0; k < this.cardtext.length; k++){
      if(this.cardtext[k] != null)
        System.out.println( k + " " + this.cardtext[k]);
    }*/
    this.convertLineEndings(); //standardize different newlines
    this.compress(); //concat lines with leading whitespace to previous line

    //the text should now be ready for processing into vCard Object
    String line = "", upToColon = "", type = "",
			afterColon = "", value = "";
    String[] params = new String[ MAX_PARAMS ];
    vCard vcard = new vCard();
    boolean set = false;

    //here we go
    for( int i = 0; i < this.cardtext.length; i++ ){
      if(this.cardtext[i] != null){
        line = this.cardtext[i];
        this.dbg("\n**********line " + line );
				if(line.indexOf( ':' ) != -1)
        	upToColon = line.substring(0, line.indexOf( ':' ) );
				else
					upToColon = line;
        String[] fieldsPars = this.fieldType( upToColon );
        type = fieldsPars[ 0 ];
        this.dbg("TYPE " + type);
				boolean anyp = false;
        for(int j = 1; j < fieldsPars.length; j++) {
          params[ j-1 ] = fieldsPars[j];
          //this.dbg("filedspars"+ j + " " + fieldsPars[j] );
					
					if(params[j-1] != null ){
            this.dbg("params "+ (j-1) + " " + params[j-1]);
						anyp = true;
					}
        }
				if( ! anyp )
						this.dbg("NO PARAMS");
				
        //aftercolon is just the value
        afterColon = line.substring((line.indexOf( ':' ) + 1), line.length() );
        //clean out escaped characters
        afterColon = this.unEscape( afterColon );
				String ac[] = new String[50];
				ac = this.splitBySemi( afterColon );
				value = "";
				for( int n = 0; n < ac.length; n++ ){
					if(ac[n] != null)
					  value = value + " " + ac[n];
			 }
        if(value != null){
          this.dbg("value " + value);
          set = vcard.setField(type, params, value);
        }
        if(set)
          this.dbg("field set ");
      }
    }
    this.dbg("**********RETURNING VCARD");
    return vcard;
  }

    /**figure out the encoding of File vcf and return a String
  * representing the name of the encoding
  */
  private String setEncoding(){
   return "not yet";
  }

  /**
  * Read the file and return an array of Strings
  * Use this.fileName
  */
  private String[] fileToStrings( File file ){
  //switch on this.encoding String
  //feed each line into a String[] ( BEGIN is text[0] )
  //BASIC implememntation. Doesnt get euro characters!
    String[] textAr = new String[ 200 ];
    int i = 0;
		byte[] b = null;
    try {
      FileReader fileRdr = new FileReader( file );
      BufferedReader bfRdr = new BufferedReader( fileRdr );
      this.dbg("**********fileToStrings");
      String tmp ="";
      while( tmp != null ){
        tmp = bfRdr.readLine();
        //b = tmp.getBytes("UTF8");
        //String s = new String(b, "UTF8");
        textAr[i] = tmp;
        this.dbg(tmp);
        i++;
      }
    }
    catch(Exception e){
      this.dbg("An exception\n");
      this.dbg(e.getMessage() + "\n");
    }
    finally{
      return textAr;
    }
  }//end method

  /**
  * Split a String into an array at semicolons
  * @param String text
  * @return String[] textAr
  */
  public String[] splitBySemi ( String textStr ){
    String[] ret = new String[ MAX_PARAMS ];
    StringTokenizer st = new StringTokenizer(textStr, ";", false);
    int i = 0;
    while (st.hasMoreTokens()) {
         ret[i] = st.nextToken();
         i++;
    }
    return ret;
  }
  /**Method to convert line endings in a String
  *  @param String text
  *  @return String text The text with line endings converted to \n
  *  NOTE TO SELF!!!! taking out double newline endings may not be
  * necessary if the parse loop dumps blank lines. The \r 's gotta go.
  */
  private String[] convertLineEndings(){
    String[] text = this.cardtext;
    this.dbg("**********convertLineEndings");
    for(int i = 0; i < text.length; i++) {
      if(text[i] != null){
        //this.dbg(text[i]);        //debug
        text[i].replace('\r', '\n');
        for(int j = 0; j < text[i].length(); j++){

          if( text[i].charAt(j) == '\n' ){
            if( j+1 > text[i].length() & text[i].charAt(j+1) == '\n' ){
              //take out one of the \n's
              String tmpLeft = text[i].substring(0, j);
              String tmpRght = text[i].substring(j+1, text[i].length());
              text[i] = tmpLeft.concat( tmpRght );
            }
          }
        }
      }
    }
    return text;
  }
  /**
  * Method to append lines starting with a blank
  * space character to the end of the previous line.
  * @param String[] text the array of Strings to compress
  * @return String [] text
  */
    private String[] compress() {
    this.dbg("**********compress");
    String[] text = this.cardtext;
    String textStr = "";
    String ret[] = new String[ 200 ];

    //copy String array into one String (this works)
    for( int i = 0; i < text.length; i++){
      if(text[i] != null)
        textStr = textStr.concat(text[i]);
    }
    //concatenate lines starting with a space to the previous line (this works)
    String tmpStr="";
    for (int i = 0; i < textStr.length(); i++){
      if(textStr.charAt(i) == 10){ //nelwine \n
        if( i+1 < textStr.length() && textStr.charAt(i+1) == 32 ){ //space
          String left = tmpStr.concat( textStr.substring(0, i+1) );
          tmpStr = "";
          String right = tmpStr.concat(textStr.substring(i+2, textStr.length()));
          textStr = left.concat(right);
        }
      }
    }
    //break the String up
    //find first newline
    int i = textStr.indexOf('\n');
    if( i == textStr.length() ){ //only one line
      ret[0] = textStr;
      return ret;
    }
    else{
      int j = 0, k = 0;
      String charStr = "";
      tmpStr = "";
      //if i = -1 we have come to the end of the String
      while (i != -1){
        while(j <= i){
          //copy the characters from j to i (thenewline)
          charStr = Character.toString( textStr.charAt(j));
          tmpStr = tmpStr.concat( charStr );
          j++;
        }
        ret[k] = tmpStr;
        tmpStr = "";
        k++;
        i = textStr.indexOf('\n', j);
      }
      return ret;
    }//end else
  }// end compress

  private String[] fieldType( String in ){
    String params = "";
    String[] ret = new String[ MAX_PARAMS ];
    String[] textAr = new String[MAX_PARAMS ];

    textAr = this.splitBySemi( in );
    //debuggy                             `
    //this.dbg("after splitBySemi");
    //for(int i = 0; i<textAr.length; i++)
      //this.dbg("textAr " + i + " " + textAr[i] );

    ret[0] = textAr[0];
    int k = 1;
    for(int j = 1; j < textAr.length; j++){//cycle through params
      if( textAr[j] != null ){
        int i = textAr[j].indexOf('=');
        /*Some programs (Mac Osx Address book) don't use the
          TYPE=Param syntax */
        if (i == -1) { //no = foundi
          params = textAr[j].toUpperCase();
        }
        else {
          if( textAr[j].substring( i+1, textAr[j].length()).toUpperCase().equals( "CHARSET)" ))
            params = "";
          else
            params = textAr[j].substring( i+1, textAr[j].length()).toUpperCase();
        }
        StringTokenizer st = new StringTokenizer(params, ",", false);
        i = 0;
        while (st.hasMoreTokens()) {
          ret[k] = st.nextToken();
          k++;
        }
      }
    }
    /*
    ///debug it
    for(int i = 0; i < ret.length; i++) {
      if(ret[i] != null)
        this.dbg("ret " + i + ret[i]);
    }*/
    return ret;
  }
  /**
  * Mathod to remove escaped characters in VALUE Strings
  * intended for vCardField object's value String
  */
  private String unEscape( String text ){
    if(text != null){
      text.replaceAll("\\;", ";");
      text.replaceAll("\\,", ",");
      text.replaceAll("\\n", "");
    }
    return text;
  }
	private void dbg (String d){
		if(this.dbg)
		  System.out.println(d);
	}
}//end class vCardParser

