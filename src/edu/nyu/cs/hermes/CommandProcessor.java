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

import edu.nyu.cs.hermes.aim.*;
import edu.nyu.cs.hermes.phone.*;
import edu.nyu.cs.hermes.HermesD;


public class CommandProcessor extends Thread{

ObjectInputStream input;

ObjectOutputStream output;

private Properties settings;

private InHandler inThread;

private OutHandler outThread;

private LinkedList outQ;

private LinkedList inQ;

private Integer phoneResponse;

private HermesD hd;


public CommandProcessor( HermesD h,
						 ObjectInputStream inStream, 
						 ObjectOutputStream outStream, 
						 Properties set, 
						 InHandler in, 
						 OutHandler out, 
						 LinkedList iq, 
						 LinkedList oq,
						 Integer pr
						
						){
						
	hd = h;

	input = inStream;
	
	output = outStream;
	
	settings = set;
	
	inThread = in;
	
	outThread = out;
	
	inQ = iq;
	
	outQ = oq;
	
	phoneResponse = pr;

}

public void run() {

	String inMessage;

	try{

		//get message from Hermes Touch Screen and tokenize
    	inMessage = (String)this.input.readObject();
    	
    	System.out.println( "Hermes command received: " + inMessage );

	}
	catch( Exception io ){
	
		return;
	
	}
	
	StringTokenizer msgTok = new StringTokenizer( inMessage );
        
    String user     = "";
      
    String message  = "XXX";
      
    String first    = "";
        

	if( msgTok.hasMoreTokens() )
      
		first = msgTok.nextToken();
      
    else
      
    	return;
        
   	if( first.equals( "aim" ) ){
            
    	String getOrSend = msgTok.nextToken();
        
        //send a message to the specified user
        if( getOrSend.toLowerCase().equals( "send" ) ){
              
        	if( msgTok.countTokens() == 2){
            
            	String m = "send  " + msgTok.nextToken() 
   							+ " Hello, this is Hermes. Someone is at the door for you";
   							
   				String cam = this.settings.getProperty( msgTok.nextToken() );

   				if( cam != null)
   			    
   					m = m + "<a HREF=\"" + "http://" + cam + "/axis-cgi/mjpg/video.cgi?resolution=320x240\">here</a>";
          
            	System.out.println("Hermes: aim: send: " + m );
          
            	outThread.enqCommand( m );
        
            }
            else{ //incorrect number of tokens
            
            	try{ 
          
   					output.writeObject( "ERROR: MALFORMED REQUEST" );
              	
    			}
    			catch( Exception e ){
              	
            		return;
            
    			}
          
            }
        }  
        //check for messages sent from a certain user to hermes
        else if( getOrSend.toLowerCase().equals( "get" ) ){
        
        	try{
        
        		if(msgTok.countTokens() == 1){
            
        	   		String getmsg = this.getAimMessage( inThread, msgTok.nextToken() ); 	
        	  
        	    	System.out.println("Hermes: aim: get: " + getmsg );			
            
            		if( getmsg == null )
            		
            			output.writeObject( "no messages" );
          		
              		else
          
                		output.writeObject( getmsg );
                
             	}
          
          		else{ //incorrect number of tokens
          
            		output.writeObject( "ERROR: MALFORMED REQUEST" );
            	
            	}
            	
            }
            catch( Exception e ){
            
            	return;
            
            }
          
        }
        else{ //incorrect number of tokens
          
       		try{ 
          
   				output.writeObject( "ERROR: MALFORMED REQUEST" );
              	
    		}
    		catch( Exception e ){
              	
            	return;
            
    		}
          
        }
   	}
        
    else if( first.equals("mail") ){
    
    	try{
          
    		System.out.println( msgTok.countTokens() );
          
        	if( msgTok.countTokens() != 2 ){
          
        		output.writeObject( "ERROR: MALFORMED REQUEST" );
          
      		 }
        	else{
          
        		String   to = msgTok.nextToken();
            
            	String  cam = msgTok.nextToken();
            
            	System.out.println("HermesD: mail: to: "+ to + " cam: " + cam );
            
            	boolean sent = sendMail( to, cam );
            
            	if( sent ){
            
            		output.writeObject("success");
            
            		System.out.println("mail success");
            
            	}
            	else{
            
            		output.writeObject("failure");
            
            		System.out.println("mail failure");
            	
            	}
            }
        }
        catch( Exception e ){
        
        	return;
        	
       	}
	}//end mail
	
    else if( first.equals( "phone" ) ){
    
    	String cmdType = msgTok.nextToken();
    
    	String number = msgTok.nextToken();
    	
    	System.out.println( "Hermes: Phone " + cmdType + "command number: " + number );
    	
    	if( cmdType.equals( "send" ) ){
    	
    		try{
    	
    			PhoneUtility pu = null;
    	
    			pu = new PhoneUtility( "localhost" , 1200 );
    	
    			CTPort ct = pu.getCTPort();
    		
    			int time = 3;
    		
    			if( number != null && number.length() >= 5 ){
    	
    				switch( number.length() ){
					
						//5 number phone numbers are extensions within nyu
    					case 5: break;
    		
    					// 234 456 5555 needs 9,1 in front of it
    					case 10:
    		
    						number = "91" + number;
    						time = 7;
    						break;
    		
    					// 444 4444 needs 9 1 212 in front of it
    					case 7:
    				
    						number = "91212" + number;
    						time = 7;
    						break;
    				
    					case 12:
    		
    						if( !number.startsWith( "91" ) )
    				
    							number = "91" + number; 	
    						
    						time = 7;
	    				
	    					break;
	    			}
	
    			}		
    			
    			if( pu.placeCall( ct.validateChars( number), time ) ){
    			
    				System.out.println( "HermesD: phone call complete phoneResponse = 1" );
    			
	    			hd.setPhoneResponse( 1 ); //success
	    		
	    		}
    			else
    				
    				hd.setPhoneResponse( -1 );//failure
    				
    			ct.killConnections();
    			
    			pu = null;
    			
    			ct = null;
    				
    		}
    		catch( Exception e ){
    		
    			hd.setPhoneResponse( -1 ); //failure
    		
    		}
    	}
    	else{// request for the the status of the last call
    	
    		System.out.println( "HermesD: Phone get: phoneResponse " + phoneResponse );
    		
    		try{
    		
    			switch( hd.getPhoneResponse() ){
    			
    			case 1:
    				
    				output.writeObject( "success" );
    		
    				hd.setPhoneResponse( 0 );
    				
    				break;
    				
    			case -1:
    			
    				output.writeObject( "failure" );
    				
    				hd.setPhoneResponse( 0 );
    				
    				break;
    				
    			case 0:
    			
    				output.writeObject( "pending" );
    				
    				break;
    			
    			}
    		
    		}
    		catch( Exception e ){
    		
    		}
    	}
    
    }
    //unknown command
    else{
        
    	try{ 
          
   			output.writeObject( "ERROR: MALFORMED REQUEST" );
              	
    	}
    	catch( Exception e ){
              	
              	
    	}
        
    } 
    
    
    try{
    
    	output.flush();  
 	
 	}
 	catch( Exception e ){
 	
 		return;
 	
 	}
}
  
  /** Collect aim messages from the inHandler thread. Then look for messages sent
   * to the username in the parameter. 
   * @param InHandler aimThread - A edu.nyu.cs.hermes.aim.InHandler Object to collect messages from
   * @param String screenName 
   * @return String the first message received for the user or null if no message exists
   */

private String getAimMessage( InHandler aimThread, String screenName ){
      
	synchronized( this ){
     
        //collect all messages that have been received so far
    	while( true ){
     
        	try{
     
          		String msg = (String)aimThread.getMessage();
     
          		inQ.addLast( msg );
     
        	} 
   	    	catch( NoSuchElementException no){
     
            break;
     
     	    }
     
    	}	//end while
    
 	}//end synch

    ListIterator li = inQ.listIterator( 0 );
     
    String msg       = "",
     
           currentSn = "",
     
           querySn   = screenName;
     
    boolean found = false;
     
    querySn = CommandProcessor.cleanScreenName( querySn );  
    
    int n = 0; 
    
    //loop through messages to find one addressed to the given user  
    while( li.hasNext() ){  
     
    	msg = (String)li.next();
     
    	currentSn = msg.substring( 0, msg.indexOf(':') ).toLowerCase();
     
    	msg = msg.substring( msg.indexOf(':') +1, msg.length() ).toLowerCase();
     
    	System.out.println("HermesD aim cmp: " + querySn + " to: " + currentSn);
                
    	currentSn = CommandProcessor.cleanScreenName( currentSn );
      
    	if( currentSn.equals( querySn ) ){
        
        	inQ.remove( n );
     
        	return msg; //optimize with hashmaps
      
      	}
      
      	n++;
     
    }//end while( li.hasNext() )
     
    return null;
   
  }
  /** 
    Remove the spaces and convert screen names to lowercase
    @param String sn
    @return String the modifies screen name
  */
  private static String cleanScreenName( String sn ){
    
  	String ret = "";
    
    if( sn != null ){
    
    	StringTokenizer st = new StringTokenizer( sn.toLowerCase() );
    
    	while( st.hasMoreTokens() )
    
        ret = ret + st.nextToken();
    
    	return ret;
    
    }
    
    return "";
   
  }
  /**Method to send an email with a picture captured from an axis 2100 webcam
    *@param toP the email address to send the email to
	*@param hostCam the hostname of the webcam
    *@return boolean whether or not the mail was sent
	*/
  private boolean sendMail( String toP, String hostCam){

    hostCam = this.settings.getProperty( hostCam.toLowerCase() );

    try{
    
      // establish mail session for sending and receving emails
      Properties props = System.getProperties( );
      
      props.put( "mail.smtp.host", this.settings.getProperty( "SMTP_HOST" ) );
      
      Session session = Session.getDefaultInstance( props, null );
      
      // create a Message and set the fields
      MimeMessage msg = new MimeMessage(session);
      
      msg.setRecipients( Message.RecipientType.TO, InternetAddress.parse( toP, false ) );
      
      msg.setFrom( new InternetAddress( this.settings.getProperty( "SMTP_USER" ) ) );
      
      msg.setSentDate( new Date( ) );
      
      msg.setSubject( "HERMES: Someone at the elevator for you" );

      URL url = new URL( "http://" +hostCam+ "/axis-cgi/jpg/image.cgi" );
			
      MimeBodyPart messageBodyPart = new MimeBodyPart( );
      
      String text = "Hello,\n This is the hermes messenger letting you know you have a visitor at "
				+ "the elevator.\n";
	  			
      Multipart mp = new MimeMultipart();
      
      if( hostCam != null ){
      
        //get the picture
        MimeBodyPart picPart = new MimeBodyPart( );
        
        picPart.setDataHandler( new DataHandler(  url ) );
     
        picPart.setFileName( "visitorImg.jpg" );
     
        picPart.setDisposition( "ATTACHMENT" );
      
        mp.addBodyPart( picPart );
        
        text = text + "There is a picture of your visitor attached to this email.\n\n"
				+ "To see a video stream of the person currently trying to contact you click"
				+ "<a HREF=http://" + hostCam + "/axis-cgi/mjpg/video.cgi?resolution=320x240>here</a>\n";
      
      }
      
      text = text + "\nThank you, \n hermes\n\n";
      
      messageBodyPart.setContent( text, "text/html" );
      
      mp.addBodyPart( messageBodyPart );
      
      /*
      //send it off
      Transport transport = session.getTransport( "smtp" );
      transport.connect( this.settings.getProperty("SMTP_HOST" ),
                         this.settings.getProperty("SMTP_USER" ), 
                         this.settings.getProperty("SMTP_PASS" ) ) ;
      */
      
      msg.setContent( mp );
      
      Transport.send( msg );

      return true;
    
    }
    catch ( Exception e ){
      
      e.printStackTrace();
      
      System.out.println( e.getMessage() );
      
      return false;
    
    }
    
  }//end sendMessage 

}//end class