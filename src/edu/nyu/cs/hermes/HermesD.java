/* HermesD.class
 * The hermes daemon 
 * This simple daemon program provides the messaging capabilities 
 * for the hermes system. The jsp pages that comprise the user
 * interface communicate with the server which then contacts those
 * in the directory to come to the door.
 * The Daemon maintains a connection to the AIM network and
 * does the processing for the picture emails sent using webcams.
 * @author Erik Froese 
*/
package edu.nyu.cs.hermes;

import java.net.*;
import java.util.*;
import java.io.*;
import java.util.NoSuchElementException;

//mail capability.
import javax.mail.internet.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Multipart;
import javax.activation.URLDataSource;
import javax.activation.DataSource;
import javax.activation.DataHandler;

//aim capability
import edu.nyu.cs.hermes.aim.*;

//telephony using CTServer
import edu.nyu.cs.hermes.phone.*;

public class HermesD{

  private String CONFIG_FILE = "hermes.conf";
  
  Properties settings;  
  
  ServerSocket server;
  
  LinkedList outQ;
  LinkedList inQ;
  
  Integer phoneResponse;
  
  public HermesD( String config ){
  
  	CONFIG_FILE = config;
    
    this.outQ = new LinkedList();
    this.inQ  = new LinkedList();
    
    this.phoneResponse = new Integer( 0 );
    
    this.settings = this.getSettings();
    
  }
  
  /* Open a socket for listening, start aim connections,
   * wait for commands from the UI
   */
  public void listen(){
  
  	System.out.println( "Hermes Daemon starting..." );
  
  	InHandler inThread = null;
	OutHandler outThread = null;
    
    try{
      
      if( this.settings == null ){
        
        System.out.println("no settings");
        
        return;
        
      }
      
      System.out.println( "Settings loaded from " + CONFIG_FILE );
        
      //Listen on port 10383 for incoming connections
      server = new ServerSocket( 10383 );
      
      //Connect to AIM
      boolean connectedAIM = false; 
      
      Operations op = new Operations();
      
      connectedAIM = op.connect( this.settings.getProperty("AIM_SN"), 
                                 this.settings.getProperty("AIM_PW") );
      
      //No aim connection, 
      if( ! connectedAIM ){
      
        System.out.println("returning from op.connect no connection made to aim ");
      
        //return;
      
      }
	  
      //start the threads to handle incoming / outgoing AIM messages
      inThread = new InHandler();
	  outThread = new OutHandler();		
	  
	  inThread.start();
	  outThread.start();
	 
	 
	  //start the mail handler thread
	  //mailDaemon md = new mailDaemon( this.settings );
	  //md.start();
	  
	  //start the phone status listener
	  
      while( true ){  
      
        System.out.println("waiting for connection");

        //wait for connection from Hermes Touch Screen
        Socket connection = server.accept();
      
        ObjectInputStream input = new ObjectInputStream( connection.getInputStream() );
      
        ObjectOutputStream output = new ObjectOutputStream( connection.getOutputStream() );
 
        CommandProcessor cp = new CommandProcessor( this, input, output, 
        		settings, inThread, outThread, inQ, outQ, phoneResponse );
        		
        cp.start();
        
      }
      
	}
	catch( Exception e ){
	
	  
	  e.printStackTrace();
	
	}
}
  
  /**
   * Read settings from the hermes.conf config file
   */
  private Properties getSettings(){
    
    Properties ps = new Properties();
    
	try{
      
      FileInputStream in = new FileInputStream( CONFIG_FILE );
      
      ps.load( in );
      
      //for( Enumeration e = ps.propertyNames(); e.hasMoreElements(); )
      	//System.out.println( e.nextElement() );
      
      if(    ps.getProperty( "HERMES_DB" ) == null
          || ps.getProperty( "HERMES_TABLE" ) == null
          || ps.getProperty( "HERMES_VC_DIR" ) == null
          || ps.getProperty( "SUBSCRIBE_SUBJECT" ) == null
          || ps.getProperty( "UNSUBSCRIBE_SUBJECT" ) == null
          || ps.getProperty( "SMTP_HOST" ) == null
          || ps.getProperty( "SMTP_USER" ) == null
          || ps.getProperty( "SMTP_PASS" ) == null
          || ps.getProperty( "POP3_HOST" ) == null
          || ps.getProperty( "POP3_USER" ) == null
          || ps.getProperty( "POP3_PASS" ) == null
          || ps.getProperty( "SQL_HOST"  ) == null
          || ps.getProperty( "SQL_RW_USER" ) == null
          || ps.getProperty( "SQL_RW_PASS" ) == null
          || ps.getProperty( "SQL_RO_USER" ) == null
          || ps.getProperty( "SQL_RO_PASS" ) == null
          || ps.getProperty( "AIM_SN" ) == null
          || ps.getProperty( "AIM_PW" ) == null
          || ps.getProperty( "LOG_FILE" ) == null
          || ps.getProperty( "PHONE_HOST" ) == null
          || ps.getProperty( "PHONE_PORT" ) == null
        ){
          
           System.out.println("Config file is missing one or more fields");
           return null;
  	  }
	  else
	    
	    return ps;
	    
    }
    catch( IOException e ){
    
    	e.printStackTrace();
    	
    	return null;
    }
    
  }//end method
  
  public void setPhoneResponse( int r ){
  
  	phoneResponse = new Integer( r );
  	
  }
  
  public int getPhoneResponse( ){
  
  	return phoneResponse.intValue();
  
  }

}//end class
