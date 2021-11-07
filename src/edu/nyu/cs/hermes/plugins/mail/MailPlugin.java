//
//  MailPlugin.java
//  hermes
//
//  Created by Erik Froese 
//

package edu.nyu.cs.hermes.plugins.mail;

import java.net.InetAddress;
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
import java.util.HashMap;
import java.util.Date; 
import java.util.Properties;
import java.net.URL;

class MailPlugin {
	
  private String SMTP_HOST;
	private HashMap hostCams;
		
	public MailPlugin( ){
		this.SMTP_HOST = "giles.cs.nyu.edu";
		hostCams = new HashMap( );
		hostCams.put( "localhost", "orwell1.cs.nyu.edu" );
		// put names in for individual computers. Extend with loop for multiple cameras/configs
	}
	/**Method to send an email with a picture captured from an axis 2100 webcam
	  *@param fromP the email address of the "from" field
		*@param toP the email address to send the email to
		*@return boolean whether or not the mail was sent
	*/
 	public boolean sendMessage( String fromP, String toP){
	  try{
		  // establish mail session for sending and receving emails
      Properties props = System.getProperties( );
      props.put( "mail.smtp.host", this.SMTP_HOST );
      Session session = Session.getDefaultInstance(props, null);
      
			// create a Message and set the fields
      MimeMessage msg = new MimeMessage(session);
      msg.setRecipients( Message.RecipientType.TO, InternetAddress.parse( toP, false ) );
      msg.setSentDate( new Date( ) );
      msg.setFrom( new InternetAddress( fromP ) );
      msg.setSubject( "HERMES: Someone at the elevator for you" );

			// use the hashmap to determine which camera to get the picture from
			String myHostName = "localhost"; //InetAddress.getLocalHost().toString();	
			URL url = new URL( "http", (String)hostCams.get(myHostName), "/axis-cgi/jpg/image.cgi" );
			
			MimeBodyPart messageBodyPart = new MimeBodyPart( );
			String text = "Hello,\n This is the hermes Messanger letting you know you have a visitor at"
				+ "the elevator. There is a picture of your visitor attached to this email.\n"
				+ "Thank you \n hermes\n"
				+ "To see a video stream of the person currently trying to contact you click"
				+ "<a HREF=" + hostCams.get("myHostName") + "/axis-cgi/mjpg/video.cgi?resolution=320x240>here</a>";
			
			messageBodyPart.setContent(text, "text/html");
			Multipart mp = new MimeMultipart();
			mp.addBodyPart(messageBodyPart);
			
			//get the picture
			MimeBodyPart picPart = new MimeBodyPart( );
			DataSource source = new URLDataSource( url );
			picPart.setDataHandler( new DataHandler( source ) );
			picPart.setFileName( "visitorImg.jpg" );
			picPart.setDisposition( "ATTACHMENT" );
			mp.addBodyPart( picPart );
			msg.setContent( mp );
            
      //send it off
      Transport transport = session.getTransport( "smtp" );
			transport.connect( "dept.cs.nyu.edu", "hermes", "eSi*Aso7" ) ;
			transport.send(msg);
			transport.close();
      return true;
		}
		catch ( Exception e ){
      return false;
		}
	}//end sendMessage
}
