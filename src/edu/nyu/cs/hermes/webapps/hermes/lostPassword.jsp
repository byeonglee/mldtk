<%@ page contentType="text/html" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.net.*"  %>
<%@ page import="java.util.*"  %>
<%@ page import="java.util.Date"  %>
<%@ page import="javax.activation.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

  <title>Hermes Password reset</title>

  <link rel="stylesheet" href="control.css" type="text/css" />

</head>

<body onLoad="doRedirect()">

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>



<div class="backButton">

  <br>
  <a href="hermes.jsp"><img src="images/back_arrow.png">Back</a>

</div>

<%!
 /**
  * Generate a random String with the ascii chars  (48) - (126)
  * @param length The length of the random String
  * @return sb random String
  */
 String getRandomString(int length ) {
 
  	StringBuffer sb = new StringBuffer();
 
    int i = 0;
 
  	while( i < length ) {
 
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
%>

<%

  String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RW&password=danish+scum";

  Connection connection = null;

  Statement statement = null;

  ResultSet rs = null;

  try{                                                                                   

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    connection = DriverManager.getConnection(connectionURL, "", "");

    statement = connection.createStatement();
  
    rs = statement.executeQuery( "SELECT * FROM hermesDir where email=\'" + 
                               request.getParameter( "email" ) + "\'" );
    if( rs.next() ){
    
   
      String newPassword = getRandomString( 8 );
    
      String newPasswordQuery = "UPDATE hermesDir SET password=SHA1(\'" + newPassword + "\')"
                          + "WHERE email = \'" + request.getParameter( "email" ) + "\'";
  
  
      statement.executeUpdate( newPasswordQuery );
      //Send the mail
      Properties props = System.getProperties();
      
	  props.put("mail.smtp.host", "dept.cs.nyu.edu" );

      javax.mail.Session mailSession = Session.getDefaultInstance( props, null );

      MimeMessage message = new MimeMessage( mailSession );

      message.setFrom( new InternetAddress( "hermes@cs.nyu.edu" ) );
      
	  message.addRecipient( Message.RecipientType.TO, new InternetAddress( request.getParameter( "email" ) ) );
      
	  message.setSubject( "Welcome to Hermes" );
      
	  message.setText("Hello \n  Your password has been changed to " + newPassword
                    + " .\n Please go to <a href=\"http://giles.cs.nyu.edu:8080/hermes/changePassword.html\"> here</a> to change your password"
                    +"\n\n To access more functions go <a href=\"http://giles.cs.nyu.edu:8080/hermes/hermes.jsp\"> here </a>"
                    + "\n\n Hermes");

      // Send message
      Transport.send(message);

      out.println("<div class=\"formDiv\">\n");
      out.println( "<br><br> You're password has been emailed to " +  request.getParameter( "email" )  );
      out.println("<form name=\"try\" action=\"hermes.jsp\" method=\"post\">");
      out.println("<button type=\"submit\" name=\"Back to Main\" value=\"Submit\">Back to Main</button>\n</form>");
      out.println("</div>\n");
    }
    else{
  
      out.println("The email address you provided was not found in the database");
    
    }

  }
  catch( Exception e ){

    out.println("<h1> DATABASE UNAVAILABLE, please try again later</h1>");

  }
  try{

    statement.close();

    connection.close();

  }
  catch( Exception e ){

    statement = null;

    connection = null;

  }

%>

