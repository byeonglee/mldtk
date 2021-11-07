<%@ page contentType="text/html" %>
<%@ page import="java.sql.*"     %>
<%@ page import="java.io.*"      %>
<%@ page import="java.net.*"     %>
<%@ page import="java.util.*"    %>
<%@ page import="java.util.Date" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<head>
<title> Hermes contact.jsp</title>

<link rel="stylesheet" href="interface.css" type="text/css" />

</head>

<body onload="refreshDelay()">

<div class="header"> 

  <p class="message"><br />

    <img src="images/hermes_logo.png"> <br />

  </p>

</div>

<div class="backButton">
  
  <br>    
  <a href="front_page.jsp"><img src="images/back_arrow.png" border="0" height="64" width="64" >Back</a>
  <br>
  
</div>


<%

String last   = "none", 
       
       first  = "none", 
       
       status = "none", 
       
       pic    = "none",
       
       cm0 = "none", cm1 = "none", cm2 = "none", cm3 = "none", cm4 = "none",
	   
	   cm5 = "none", cm6 = "none", cm7 = "none", cm8 = "none", cm9 = "none",
       
       uid = request.getParameter ("uid"),
       
       messageToUser = "";
       
int meth = Integer.parseInt( request.getParameter("meth") );

HashMap u;

Socket client;

ObjectOutputStream output;

ObjectInputStream input;

client = new Socket( InetAddress.getByName( "giles.cs.nyu.edu" ), 10383 );

output = new ObjectOutputStream( client.getOutputStream() );

input = new ObjectInputStream( client.getInputStream() );

/* 
 *  Mode one, retrieve info from the database and print out the initial screen
 */  
if( request.getParameter("mode").equals( "lookup" ) ){

  String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RO&password=danish";
  
  Connection connection = null;
  
  Statement  statement  = null;
  
  ResultSet  rs         = null;
  
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  
  connection = DriverManager.getConnection(connectionURL, "", "");
  
  statement = connection.createStatement();

  try{
	
	rs=statement.executeQuery( "SELECT * FROM hermesDir WHERE uid=" + uid );
  
    rs.next();
  
    HashMap user = new HashMap();
    
	if( rs.getString("lastName") != null ){
	
	  user.put( "lastName", rs.getString( "lastName" ) );
	  
	  user.put( "firstName", rs.getString( "firstName") );
	  
	  user.put( "status", rs.getString( "status" ) );
	  
	  user.put( "picture", rs.getString( "picture" ) );

	  cm0 = rs.getString( "contact_0" );
	  cm1 = rs.getString( "contact_1" );
	  cm2 = rs.getString( "contact_2" );
	  cm3 = rs.getString( "contact_3" );
	  cm4 = rs.getString( "contact_4" );
	  cm5 = rs.getString( "contact_5" );
	  cm6 = rs.getString( "contact_6" );
	  cm7 = rs.getString( "contact_7" );
	  cm8 = rs.getString( "contact_8" );
	  cm9 = rs.getString( "contact_9" );
	}
	
	if( cm0 == null ) cm0="none";
	if( cm1 == null ) cm1="none";
	if( cm2 == null ) cm2="none";
	if( cm3 == null ) cm3="none";
	if( cm4 == null ) cm4="none";
	if( cm5 == null ) cm5="none";
	if( cm6 == null ) cm6="none";
	if( cm7 == null ) cm7="none";
	if( cm8 == null ) cm8="none";
	if( cm9 == null ) cm9="none";
	
	
	user.put( "cm0", cm0 );
	user.put( "cm1", cm1 );
	user.put( "cm2", cm2 );
	user.put( "cm3", cm3 );
	user.put( "cm4", cm4 );
	user.put( "cm5", cm5 );
	user.put( "cm6", cm6 );
	user.put( "cm7", cm7 );
	user.put( "cm8", cm8 );
	user.put( "cm9", cm9 );
	
	session.setAttribute( "user", user );
  
  }
  
  catch( SQLException e ){
	
	out.println( "A SQL Exception has occurred" );
	
	out.println( e.toString( ) );
  
  }

}

u = (HashMap)session.getAttribute( "user" );

last   = (String)u.get( "lastName"   );

first  = (String)u.get( "firstName"  ); 

status = (String)u.get( "status"     );

pic    = (String)u.get( "picture"    );
 
String[] methods = new String[10];

for( int i = 0; i <= 9; i++)

  methods[i] = (String)u.get( "cm" + Integer.toString( i ) );


if( request.getParameter("mode").toLowerCase().equals("email") ){
  
  try{
  
    output.writeObject( " mail "
                     + methods[ meth - 1 ].substring( methods[ meth - 1 ].indexOf(':') + 3 )
                     + " " + request.getRemoteHost() );
    output.flush();
  
    String mailResponse = null;
    
    while( mailResponse == null ){
      
      try{
      
        mailResponse = (String)input.readObject();
        
      }
      catch( Exception e ){
      
      }
    
    }
    if( mailResponse.equals( "success" ) )
    
      messageToUser = "An email has been sent to" + first + " " + last;
    
    else
      
      messageToUser = "There was a problem sending the email. Please use the next contact method.";
    
    try{
    
      output.close();
    
      input.close();
    
    }
    
    catch(Exception e){
    
      output = null;
    
      input = null;
    
    }
 
 }
 
  catch( Exception e ){
 
    messageToUser = "There was an error talking to the Hermes system. Please try again.";
 
 }

}

if( request.getParameter("mode").toLowerCase().equals("aim") ){

  String aimsn  = methods[ meth - 1 ].substring( methods[ meth - 1 ].indexOf(':') + 3 );

  try{
  
    if( session.getAttribute("aimcheck") == null ){
    
      output.writeObject("aim send " + aimsn + " " + request.getRemoteHost() );
    
      session.setAttribute( "aimcheck", "1");
    
      messageToUser = "A message has been sent to " + first + " " + last + ".<br>"
                    + "Hermes will check for a reply every ten seconds ( 3 Times ).<br>";
    }
    else{
        
      output.writeObject( "aim get " + aimsn ); 

      Thread.sleep( 1000 );

      try{

        String reply = (String)input.readObject();

        messageToUser = "Message from user: " + reply;
        
        if( reply.equals( "no messages") ){

          if( Integer.parseInt( (String)session.getAttribute( "aimcheck" ) ) == 3 ){

            messageToUser = "After three attempts we have not received a message from your party. "
                          + "Please try another contact method (if available) or another user. ";

            session.removeAttribute( "aimcheck" );

          }
          else{

            messageToUser = "No reply received yet. <br>"
                          + "Hermes will try three times to see if a reply has been received. "
                          + "So far we've tried " + (String)session.getAttribute( "aimcheck" )
                          + " times.";
         
          }
        
        }
      
      }
      
      catch( Exception e ){
      
        messageToUser = "Error talking to the Hermes daemon";
      
      }
    
    }
    
    try{
    
      output.close();
    
      input.close();
    
    }
    
    catch(Exception e){
    
      output = null;
    
      input = null;
    
    }
    
  }
  catch( Exception e ){
  
    messageToUser = "There was an error talking to the Hermes system. Please try again.";
  	
  }
  
}

if( request.getParameter("mode").toLowerCase().equals("phone") ){

	String number  = methods[ meth - 1 ].substring( methods[ meth - 1 ].indexOf(':') + 3 );
	
	output.writeObject( "phone " + number );
	
	String phoneResponse = null;
    
    while( phoneResponse == null ){
      
      try{
      
        phoneResponse = (String)input.readObject();
        
      }
      catch( Exception e ){
      	
      	
      }
    
    }
    if( phoneResponse.equals( "success" ) )
    
      messageToUser = "Hermes called " + first + " " + last + " for you." ;
    
    else
      
      messageToUser = "There was a problem amking the call. Please use the next contact method.";
	
	
}
%>

<table class="main" width="500px">
<tr>
  <td>
	  <%= "<img src =\" " + pic + "\">" %>
	</td>
</tr>
<tr>
  <td height="20px" class="left" >
	  <%= "Hermes is helping you contact " + first + " " + last %>
	</td>
</tr>
<tr>
  <td>
    <%= first + " " + last + "\'s status is currently: " + status %>
  </td>
</tr>
<tr>
  <td>
    <%= printContactButton( methods, meth )  %>
	</td>
</tr>
<tr>
  <td>
    <%= messageToUser %>
  </td>
</tr>
</body>

<!--
 * If we aren't doing a timed loop looking for returned data (waiting for aim response)
 * we want the page to time out after 20 seconds. While waiting for an aim repsonse we 
 * refresh the page every 10 seconds and check for aim repsonses on the q in the HermesD
  -->

<script language="Javascript">

  var targetURL = "front_page.jsp";

  function refreshDelay(){

  <%

    String[] ar = new String[6];

    ar = ( String[] )session.getAttribute("uids");
    
    if( session.getAttribute( "aimcheck" ) == null ){

      out.println( "targetURL = \"front_page.jsp?\";" ); 

      out.println( "setTimeout(\"timedRedirect()\", 45000 );");     

      String kb = "true";

      session.setAttribute( "kickedBack", kb );           

    }
    else{

      int n = Integer.parseInt( (String)session.getAttribute( "aimcheck" ) );

      if( n < 3 ){

        out.println("setTimeout(\"history.go(0)\", 10000);");

        n++;

        session.setAttribute( "aimcheck", Integer.toString( n ) );

      }
      else{

      }

    }
  %>

}

function timedRedirect(){

  window.location.href = targetURL;

}

</script>

</html>

<%! 
/** Method to print the button for contacting a user. Links the apporpriate button
  * for each action
  */
  
public String printContactButton( String[] meths, int nextMeth ){
	
	//store button images
	
	HashMap buttons = new HashMap();
	
	buttons.put("email", "<img src=\"images/email.png\" border=0 >" );
	
	buttons.put("aim"  , "<img src=\"images/aim.png\" border=0 >"   );
	
	buttons.put("phone", "<img src=\"images/phone.png\" border=0 >" );

	String methType= "";
	
	StringBuffer sb = new StringBuffer();	
	
	
	for( int i = 0; i <= 9; i++ ){
	
	if( i == nextMeth ){
	
	  if( ( meths[i].length() > 6 ) || ( meths[i].indexOf(':') != -1 ) ){
    
        methType = meths[i].substring( 0, (meths[i].indexOf(':')) );
	    
	    sb.append( "<a href=\"contact.jsp?&mode="+ methType + "&meth=" + (nextMeth + 1) +"\">"
	                  + buttons.get( methType ) + "</a>") ;
	  }
	  else{
	    sb.append("There are no more contact methods available");
	  }
	}
	  /*
	  else {
	    if( ! (meths[i].equals("none")) && meths[i].indexOf(':') != -1)
	      sb.append( buttons.get( meths[i].substring( 0, (meths[i].indexOf(':')) ) ) ) ;
	    }
	  */
  }
  
  return sb.toString(); 

}
%> 
