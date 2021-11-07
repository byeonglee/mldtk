/**

mailDaemon.java
Written using msgsend.java from the JAvaMail API demo software and the MysSQL
documentation at http://www.mysql.com/documentation/connector-j/index.html

This daemon serves as a way for users to subscribe and unsubscribe from the
hermes directory system. In order to subscribe, users must submit an email
with the subject line SUB (see hermes.conf) including an attached vCard file that
conforms to the rules set in the vCardGuide file in the hermes documentation.

@author Erik Friese esf221@nyu.edu
2003

*/

package edu.nyu.cs.hermes;

import java.util.Properties;
import java.util.Date;
import java.util.StringTokenizer;
import javax.mail.*;
import javax.mail.internet.*;

import java.lang.Thread;
import java.sql.*;
import java.io.InputStream;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.*;

public class mailDaemon extends Thread{

  private Properties props;
 
  private boolean LOG_READY = false;
	
  /**constructor
  * Start the log, get the settings, start listening
  * for mail.
  */
  public mailDaemon( Properties p ){
  
  	this.props = p;
  
    this.startLog();
  
  }
  
  public void run() {
    
    boolean done     = false;
    
    boolean vcFound  = false;
    
    Message emails[] = new Message[ 200 ];
    
    Session session  = null;
    
    Store store      = null;
    
    Folder folder    = null;
    
    vCard vc         = null;
		
    while( !done ){
      
      try{
      
        // Get email from hermes address  
        Properties props = new Properties();
      
        session = Session.getDefaultInstance( props, null );
        
        store = session.getStore("pop3");
      
        //System.out.println( this.props.getProperty( "POP3_HOST" ) );
      
        //System.out.println( this.props.getProperty( "POP3_USER" ) );
      
        //System.out.println( this.props.getProperty( "POP3_PASS" ) );
      
        store.connect( this.props.getProperty( "POP3_HOST" ),
                       this.props.getProperty( "POP3_USER" ),
                       this.props.getProperty( "POP3_PASS" ) );
        
        folder = store.getFolder("INBOX");
      
        folder.open(Folder.READ_WRITE);
        
        emails = folder.getMessages();
      
        System.out.println("Got mail successfully");
      
      }
      catch( Exception e){
      
        e.printStackTrace();
      
        this.log("error during mail retrieval");
      
        this.log(e.getMessage());
      
      }//done getting the mail

      try{
        
        //cycle through emails
        for( int i = 0; i < emails.length; i++ ){
          
          
          vcFound = false;
          //subscribe attempt
          if( emails[i].getSubject().toUpperCase().equals( this.props.getProperty( "SUBSCRIBE_SUBJECT" ) )){
            
            System.out.println( "SUBSCRIBE ATTEMPT" );
            
            vCardParser vcp = new vCardParser( false );
            
            Multipart mp = (Multipart)emails[i].getContent();
            
            int j = 0, n = mp.getCount();
					
            while( j < n && vcFound == false ){
              
              Part part = mp.getBodyPart( j );
              
              String disposition = part.getDisposition();

              if( ( disposition != null)
                    && ( disposition.equals(Part.ATTACHMENT)
                         || disposition.equals(Part.INLINE) ) ){
                
                MimeBodyPart mbp = (MimeBodyPart)part;
      
                if( (mbp.isMimeType( "text/x-vcard" ) || mbp.isMimeType( "text/plain" ))
                       && mbp.getFileName().endsWith(".vcf") ){
                
                  vcFound = true;
              
                  System.out.println("email -> vCard file ->" 
                    + this.props.getProperty( "HERMES_VC_DIR" )
                    + "/" + mailDaemon.cleanFrom( emails[i].getFrom()[0].toString()) );
              
                  //found a vCard, write it out
                  InputStream is = part.getInputStream();
                
                  if( !(is instanceof BufferedInputStream) )
                
                    is = new BufferedInputStream( is );
                  
                
                  byte[] b = new byte[ 1 ];
                
                  int c = is.read( b );
                
                  BufferedOutputStream bs =  new BufferedOutputStream(
                
                                  new FileOutputStream( this.props.getProperty( "HERMES_VC_DIR" ) + "/"
				
								  + mailDaemon.cleanFrom(emails[i].getFrom()[0].toString() ) +".vcf"));
                
                  while( c != -1){
                
                    System.out.print(c);
                
                    bs.write( b );
                
                    c = is.read( b );
                
                  }//done with writeout
                
                  bs.flush();
			 
                  //parse that sucker
                  System.out.println( this.props.getProperty( "HERMES_VC_DIR" ) + "/" +
								mailDaemon.cleanFrom(emails[i].getFrom()[0].toString()) + ".vcf" );

                  vc = vcp.parse(this.props.getProperty( "HERMES_VC_DIR" ) + "/" +
                    mailDaemon.cleanFrom(emails[i].getFrom()[0].toString()) + ".vcf" );
                
                  System.out.println("VCARD FN: " + vc.getValue("FN") );
                
                this.log("vCard for " + mailDaemon.cleanFrom(emails[i].getFrom()[0].toString())
												+ "written and parsed");
                String hit = vc.hermesIt();
                
                System.out.println(hit);
                
                String pass = "";

                if( vc.isValid() && hit.equals( "DONE" ) ){
                  
                  //System.out.println("inside valid, hit loop");
                  
                  Statement stmt = null;
                  
                  Connection conn = null;
                  
                  try{
                  
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                  
                  } 
                  catch (InstantiationException ie){
                  
                    this.log("Class Instantiation Exception: " + ie);
                  
                  } 
                  catch (ClassNotFoundException cnf){
                    
                    this.log("Class Not Found Exception: " + cnf);
                  
                  } 
                  catch (IllegalAccessException iae){
                  
                    this.log("Illegal Access Exception: " + iae);
                  
                  }
                  
                  try{
                  
                    DriverManager.getConnection("jdbc:mysql://"+this.props.getProperty( "SQL_HOST"  )
                      + "/" + this.props.getProperty( "HERMES_DB"  )
                      + "?user=" + this.props.getProperty( "SQL_RW_USER"  )
                      + "&password=" + this.props.getProperty( "SQL_RW_PASS" ) 
                      );
                  
                    this.log("Connection to MySQL Database Successful");
                  
                  } 
                  catch (SQLException sqe1){
                 
                    this.log("Caught SQL Exception: " + sqe1);
                 
                  }
                 
                  try{
                 
                    String first  = vc.getValue( "FIRSTNAME");
                    String middle = vc.getValue( "MIDDLEINIT");
                    String last   = vc.getValue( "LASTNAME");
                    String pic    = vc.getValue( "PHOTO");
                    String loc    = vc.getValue( "LOCATION");
                           pass   =  getRandomString( 8 ); //
                    String email = mailDaemon.cleanFrom(emails[i].getFrom()[0].toString());
                    String contact_0 = vc.getValue("CONTACT_0");
                    String contact_1 = vc.getValue("CONTACT_1");
                    String contact_2 = vc.getValue("CONTACT_2");
                    String contact_3 = vc.getValue("CONTACT_3");
                    String contact_4 = vc.getValue("CONTACT_4");
                    String contact_5 = vc.getValue("CONTACT_5");
                    String contact_6 = vc.getValue("CONTACT_6");
                    String contact_7 = vc.getValue("CONTACT_7");
                    String contact_8 = vc.getValue("CONTACT_8");
                    String contact_9 = vc.getValue("CONTACT_9");
                    //whitelist?

                    String insert = "INSERT INTO " + "hermesDir" +
                                  "(lastName, firstName, middleInit, location, email, " +
                                  "picture, password, status, stat_expires, auth, contact_0, " +
                                  "contact_1, contact_2, contact_3, contact_4, contact_5, " +
                                  "contact_6, contact_7, contact_8, contact_9, phonePin)" +

                                  " VALUES( \'" +
                                  last + "\',\'" + first + "\',\'" + middle + "\',\'" +
                                  loc  + "\',\'" + email + "\',\'" + pic    + "\',SHA1(\'" +
                                  pass + "\'),\'" + "init_status"  + "\',\'" + "init_exp" + "\',\'" +
                                  "0"  + "\',\'" +
                                  contact_0 + "\',\'" + contact_1 + "\',\'" + contact_2 + "\',\'" +  										            				  				    	contact_3 + "\',\'" + contact_4 + "\',\'" + contact_5 + "\',\'" +
                                  contact_6 + "\',\'" + contact_7 + "\',\'" + contact_8 + "\',\'" +
                                  contact_9 + ", " + "1234" + "\')" ;
              
                    System.out.println("insert*** " + insert);
              
                    stmt = conn.createStatement();
              
                    stmt.executeUpdate( insert );
              
                    this.log("vCard info for " +last+ ", " +first+ " inserted into db");
              
                  }
              
                  catch (SQLException sqe2){
              
                    this.log("Caught SQL Exception: " + sqe2);
              
                  }
                  try { stmt.close(); }
              
                  catch( SQLException sqlEx ) { stmt = null; }

                  String body = "You have been added to the Hermes directory database.\n"
                            + "Your password is currently " + pass +"\n" 
                            + "Please go <a href=\""+ this.props.getProperty( "HERMES_WEB_HOST" ) + ":8080/hermes/hermes.jsp\">"
                            + "here </a> to activate your account and change your password. "
                            + "To change your status over the phone call ***NUMBER***." 
                            + "Your pin code for the phone status number is 1234. \n\n Thanks\n Hermes";
              
                  this.sendMessage(this.props.getProperty( "SMTP_USER"), 
                                 mailDaemon.cleanFrom( emails[i].getFrom()[0].toString() ),
                                 "Hermes Subscription", body);
                }
                else{
              
                  String error = "";
              
                  if( ! (vc.isValid()) )
              
                    error = "VCARD NOT VALID";
              
                  else
              
                    error = vc.hermesIt();

                  String body = "The vCard you submitted did not have some of the required fields. Please"
                              + " review your card and resubmit\n "
                              + "Error: " + error;
              
                  this.sendMessage( this.props.getProperty( "SMTP_USER" ),
                                    emails[i].getFrom()[0].toString(), 
                                    "MALFORMED VCARD", body );
              
                }//end else
              
              }//end if( part.isMimeType(
              else{
                
                String body = "The email you submitted did not contain a vcard. Please send another email with "
                              +"the subject SUBSCRIBE and a vcard (ending in .vcf) attached with the appropriate information. Put "
                              + "link to info.\n Thanks\n Hermes";
      
                this.sendMessage( this.props.getProperty( "SMTP_USER" ), 
                                    emails[i].getFrom()[0].toString(), 
                                    "MISSING VCARD", body );
      
              }
      
            }//end if disposition != null
      
            j++;
      
        }//end while
      
      }//end if
     
      //someone wants to leave hermes (inexplicable)
      else if( emails[i].getSubject().toUpperCase().equals(this.props.getProperty( "UNSUBSCRIBE_SUBJECT" ) ) ){
        
        Connection conn = null;
        
        Statement  stmt = null;
        
        ResultSet  rs = null;
        
        String from = mailDaemon.cleanFrom(emails[i].getFrom()[0].toString());
        
        try{
        
          Class.forName("com.mysql.jdbc.Driver").newInstance();
        
          this.log("Driver Registration Successful.");
        
        } catch (InstantiationException ie){
        
          this.log("Class Instantiation Exception: " + ie);
        
        } catch (ClassNotFoundException cnf){
        
          this.log("Class Not Found Exception: " + cnf);
        
        } catch (IllegalAccessException iae){
        
          this.log("Illegal Access Exception: " + iae);
        
        }
        
        try { 
          
          String s = "jdbc:mysql://"+this.props.getProperty( "SQL_HOST" ) +"/" 
                   + this.props.getProperty( "HERMES_DB" )
                   + "?user="     + this.props.getProperty( "SQL_RW_USER" )
                   + "&password=" + this.props.getProperty( "SQL_RW_PASS;" );

          conn = DriverManager.getConnection( s );

          this.log("Connection to MySQL Database Successful");

        } 
        catch (SQLException sqe1){

          this.log("Caught SQL Exception: " + sqe1);

		}
        try {
    
          stmt = conn.createStatement();
    
          rs = stmt.executeQuery("SELECT email FROM " + this.props.getProperty( "HERMES_TABLE"  )
             +  " WHERE email = \'" + from +"\'");
    
          rs.first();
    
          String fromDb = rs.getString("email");
    
          if( fromDb != null ){
    
            stmt.executeUpdate("DELETE FROM " + this.props.getProperty( "HERMES_TABLE" ) +  " WHERE email = \'" + fromDb + "\'");
    
            sendMessage(this.props.getProperty( "SMTP_USER" ), from, "Re: UNSUBSCRIBE",
									 "You have been removed from the hermes directory.");
    
          }
          else{
    
            String body = "The email address ( " + from + ")"
                        + " from which the unsubscribe request was received"
                        + " was not found in the hermes directory. Please send"
                        + " another request from the email address listed in the hermes directory";
    
            sendMessage(this.props.getProperty( "SMTP_USER"  ), from, "Re: UNSUBSCRIBE", body);
    
          }
    
        }
        catch (SQLException sqe2){
    
          this.log("Caught SQL Exception: " + sqe2);
    
        }
        try { stmt.close(); }
    
        catch( SQLException sqlEx ) { stmt = null; }
    
      }//end else if
      
      /*
        all other subject lines
      */
      else{
    
        String from  = mailDaemon.cleanFrom(emails[i].getFrom()[0].toString());
    
        String reply = "You sent an email to the directory subscribe/unsubscribe email " 
                     + "address with an invalid subject line. For instuctions on how to subscribe " 
                     + "or unsubscribe to the directory please refer to PUT LINK HERE" ;
    
        this.sendMessage( this.props.getProperty( "SMTP_USER" ), from, "Unrecognized subject line", reply );
    
      }
    
      emails[i].setFlag( Flags.Flag.DELETED, true );
	
	}//end for
		

	try{

      //close the mail connection ( deletes processed messages )
      folder.close( true );  
	  store.close();
	
	}
	catch( Exception e ){
	
	  e.printStackTrace();
	
	  this.log("error during mail save see next line");
	
	  this.log(e.getMessage());
	
	}
		
  }//end try

  catch(Exception e){

    this.log(e.getMessage() );

   }
   try{ 

     Thread.sleep(Long.parseLong(this.props.getProperty( "WAIT_TIME" ) ) );

   }

   catch( InterruptedException e){ this.log("odd thread error for delay");}

   }//end while

 }
 
 
  /** Method to send an email message. Assumes a smtp server
      is installed.
      @params String fromP  Message receiver
              String toP  Message originator
			  String body  Message body
  **/
  private void sendMessage(String fromP, String toP, String subjectP, String body){
  
    try{
  
      this.log("Seding message to " + toP + " from " + fromP + " subject=" + subjectP );
  
      //establish mail session for sending and receving emails
      Properties props = System.getProperties();
      
      props.put("mail.smtp.host", this.props.getProperty( "SMTP_HOST" ) );
  
      Session session = Session.getDefaultInstance(props, null);
  
      //create a Message and set the fields
      Message msg = new MimeMessage(session);
      
      Multipart mp = new MimeMultipart();
      
      MimeBodyPart messageBodyPart = new MimeBodyPart( );
  
      messageBodyPart.setContent( body, "text/html" );
      
      mp.addBodyPart( messageBodyPart );
      
      msg.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(toP, false));
      
      msg.setSentDate(new Date());
      
      msg.setFrom(new InternetAddress(fromP));
      
      msg.setSubject(subjectP);
      
      msg.setContent( mp );
 
      //send it off
      Transport.send(msg);
 
    }
    catch (Exception e){
 
      e.printStackTrace();
 
    }
 
  }//end sendMessage
  
	/**
    * Generate a random String with the ascii chars  (48) - (122)
	* @param length The length of the random String
	* @return sb random String
	*/
  private String getRandomString(int length) {
    
    StringBuffer sb = new StringBuffer();
    
    int i = 0;
  	
  	while( i < 8 ) {
  	  
  	  int j = 48 + (int) Math.floor( Math.random() * 74 );
  	  
  	  if(( j > 57 && j < 65) || ( j > 90 && j < 97  ) ){
  	  
  	  ;
  	  
  	  }
  	  else{
      
        sb.append( (char)j);
      
        i++; 
      
      }
 	
 	}
  	
  	return sb.toString();
  
  }


  /** Method to prepare the Hermes Mail log
	* if the file specified by the LOG_FILE field
	* in the hermes.conf file it does not exist,
	* an attempt is made to create a new one. If that
	* fails, the variable this.LOG_READY is set to false
	* and all calls to log() will do nothing.
	*/
  private void startLog(){
    
    File log = new File(this.props.getProperty("LOG_FILE" ));
    
      try{
    
        if( !(log.exists()) )
    
          log.createNewFile();
	
		  PrintWriter logW = new PrintWriter(new BufferedWriter( 
		                     new FileWriter( this.props.getProperty("LOG_FILE" ), true)));
	
		  logW.println("=============================");
	
		  logW.println("Hermes mail daemon log");
	
		  Date d = new Date();
			
		  logW.println("Started " + d.toString());
			
		  
		  logW.println("=============================");
		  
		  logW.flush();
		  
		  logW.close();
		
		}
		catch( IOException e ){
		
		  this.LOG_READY = false;
		
		}
    this.LOG_READY = true;
  }
  
  /**Write out to the hermes log. Do not call this
  * method without first calling the startLog() method
  * @param String l the message to write to the log
  */
  private void log( String l ){
    
    if( this.LOG_READY ){
    
      try{
    
        PrintWriter logW = new PrintWriter( new BufferedWriter(
			                     new FileWriter( this.props.getProperty("LOG_FILE" ), true)));
    
        Date d = new Date();
    
        logW.println(d + ":  " + l );
    
        logW.flush();
    
        logW.close();
    
      }
      catch( IOException e ){}
      
      }
  
  }
  
  /** Clean out the email address from the getFrom() method
  * of the Message class
  */
  public static String cleanFrom( String  o ){

    if( ( o.indexOf('<') == -1 ) && ( o.indexOf('>') == -1 ) )

      return o;

    else{

      StringTokenizer st = new StringTokenizer( o, "<>", false);

      String s = st.nextToken();

      if( st.hasMoreTokens() )

        return st.nextToken();

      else

      	return s;

    }

  }

}
