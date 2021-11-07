<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<html >

<head>

<title>Hermes Subscribe</title>

<link rel="stylesheet" href="control.css" type="text/css" />

<script language="Javascript">



<% 	HashMap map = new HashMap();
	
	map.put( "email", "0" );
	map.put( "aim", "1" );
	map.put( "phone", "2" );

%>

function fill_fields(){

  document.subscribe.first.value = <%= "\"" + fillField( request.getParameter( "first" ), false ) + "\"" + ";" %> 

  document.subscribe.last.value = <%= "\"" + fillField( request.getParameter( "last" ), false ) + "\"" + ";" %>  

  document.subscribe.middle.value = <%= "\"" + fillField( request.getParameter( "middle" ), false ) + "\"" + ";" %>  

  document.subscribe.location.value = <%= "\"" + fillField( request.getParameter( "location" ), false ) + "\"" + ";" %> 

  document.subscribe.picture.value = <%= "\"" + fillField( request.getParameter( "picture" ) , false) + "\"" + ";" %> 

  document.subscribe.email.value = <%= "\"" + fillField( request.getParameter( "email" ), false ) + "\"" + ";" %> 

  document.subscribe.status.value = <%= "\"" + fillField( request.getParameter( "status" ), false ) + "\"" + ";" %> 
  
  document.subscribe.cmType0.options[<%= fillField( (String)map.get( request.getParameter( "cmType0" ) ), true )  %> ].selected=true;
  
  document.subscribe.cmType1.options[<%= fillField( (String)map.get( request.getParameter( "cmType1" ) ), true ) %> ].selected=true;

  document.subscribe.cmType2.options[<%= fillField( (String)map.get( request.getParameter( "cmType2" ) ), true )  %> ].selected=true;
  
  document.subscribe.cmType3.options[<%= fillField( (String)map.get( request.getParameter( "cmType3" ) ), true ) %> ].selected=true;

  document.subscribe.cmType4.options[<%= fillField( (String)map.get( request.getParameter( "cmType4" ) ), true ) %> ].selected=true;

  document.subscribe.cmType5.options[<%= fillField( (String)map.get( request.getParameter( "cmType5" ) ), true ) %> ].selected=true;

  document.subscribe.cmType6.options[<%= fillField( (String)map.get( request.getParameter( "cmType6" ) ), true ) %> ].selected=true;

  document.subscribe.cmType7.options[<%= fillField( (String)map.get( request.getParameter( "cmType7" ) ), true ) %> ].selected=true;

  document.subscribe.cmType8.options[<%= fillField( (String)map.get( request.getParameter( "cmType8" ) ), true ) %> ].selected=true;

  document.subscribe.cmType9.options[<%= fillField( (String)map.get( request.getParameter( "cmType9" ) ), true ) %> ].selected=true;

  document.subscribe.contactMethod0.value = <%= "\"" + fillField( request.getParameter( "contactMethod0" ), false ) + "\"" + ";" %> 
 
  document.subscribe.contactMethod1.value = <%= "\"" + fillField( request.getParameter( "contactMethod1" ), false ) + "\"" + ";" %> 
 
  document.subscribe.contactMethod2.value = <%= "\"" + fillField( request.getParameter( "contactMethod2" ), false ) + "\"" + ";" %> 
  
  document.subscribe.contactMethod3.value = <%= "\"" + fillField( request.getParameter( "contactMethod3" ), false ) + "\"" + ";" %> 
  
  document.subscribe.contactMethod4.value = <%= "\"" + fillField( request.getParameter( "contactMethod4" ), false ) + "\"" + ";" %> 
  
  document.subscribe.contactMethod5.value = <%= "\"" + fillField( request.getParameter( "contactMethod5" ), false ) + "\"" + ";" %> 
  
  document.subscribe.contactMethod6.value = <%= "\"" + fillField( request.getParameter( "contactMethod6" ), false ) + "\"" + ";" %> 
   
  document.subscribe.contactMethod7.value = <%= "\"" + fillField( request.getParameter( "contactMethod7" ), false ) + "\"" + ";" %> 
    
  document.subscribe.contactMethod8.value = <%= "\"" + fillField( request.getParameter( "contactMethod8" ), false ) + "\"" + ";" %> 
    
  document.subscribe.contactMethod9.value = <%= "\"" + fillField( request.getParameter( "contactMethod9" ), false ) + "\"" + ";" %> 
  
  document.subscribe.pin.value = <%= "\"" + fillField( request.getParameter( "pin" ), false ) + "\"" + ";" %> 

}
</script>

<body onload="fill_fields()">

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>

<div class="backButton"> <a href="hermes.jsp"><img src="images/back_arrow.png" border="0">Back</a> 

</div>

<%
if( request.getParameter( "mode" ) == null  ){

	out.println( getInitForm( ) );
}

if( request.getParameter( "mode" ) != null && request.getParameter( "mode" ).equals( "subscribe" ) ){

	String f = getValidatedForm( request );
	
	if( f != null )
		
		out.println( f );
	
	else
		
		doSubscribe( (ServletRequest)request, out );
	
}
%>

</body>
</html>

<%! 

public String printContactField( int i ){

	return 	"Contact method: (" + i + ")\n" +
    		"<SELECT name=\"cmType" + i + "\">\n" +
      		"<OPTION value=\"email\">email\n" + 
      		"<OPTION value=\"aim\">aim \n" +
      		"<OPTION value=\"phone\">phone \n" +
    		"</SELECT>\n" +
    		"<input type=\"text\" name=\"contactMethod" + i + "\" size=\"25\" maxlength=\"40\">\n" ;
    }
%>

<%! 

public boolean isValidContactField( int i, String type, String value ){
	
	if( i == 0 ){
		
		if( value == null || value.equals( "" ) )
			
			return false;
	
	}
	else{
			
		if( type.equals( "phone" ) ){
		
			if( value.length() < 5 )
		
				return false;
			
			for( int k = 0; k < value.length(); k++ ){
			
				if( value.charAt( k ) < '0' || value.charAt( k ) > '9' )
					
					return false;
			
			}
		}
	}
	
	return true;

}

	
%>

<%!
	
public String getValidatedForm( ServletRequest request  ){

	boolean valid = true;
	
	String INVALID = "<img src=\"images/fileclose.png\" height=\"25\" border=\"0\">" ;

	StringBuffer sb = new StringBuffer();
	
	sb.append( "<div class=\"paddedDiv\"> <br>\n" +
 				 "<b>Hermes Signup </b> </div>\n" );

	sb.append( "<div class=\"formDiv\"> \n" +  
 				 "<form name=\"subscribe\" method=\"post\"  >\n" );
    
    sb.append( "<br>\n<br>\n" +
    			 "First name: " +
    			 "<input type=\"text\" name=\"first\" size\"25\" maxlength=\"40\" >");
    
    if( request.getParameter( "first" ) == null || request.getParameter( "first" ).equals( "" ) ){
    	
    	sb.append( INVALID );

    	valid = false;

    }

   
    
    sb.append( "<br><br>\n" );
 			
    sb.append( "Middle initial: \n" +
    			 "<input type=\"text\" name=\"middle\" size=\"1\" maxlength=\"1\">\n " );
    
    sb.append( "<br><br>\n" );
    
    sb.append( "Last name:\n" + 
    			"<input type=\"text\" name=\"last\" size=\"30\" maxlength=\"40\" >" );

    
    if( request.getParameter( "last" ) == null || request.getParameter( "last" ).equals( "" ) ){
    	
    	sb.append( INVALID );
    	
    	valid = false;
    	
    }


    
    sb.append( "<br><br>\n" ) ;		
    
    sb.append( "Location: \n" +
    			"<input type=\"text\" name=\"location\" size=\"20\" maxlength=\"20\">" );
 
    
   	if( request.getParameter( "location" ) == null || request.getParameter( "location" ).equals( "" ) ){
    	
   		sb.append( INVALID );
    	
   		valid = false;
    	
   	}


    
    sb.append( "<br><br>\n" ) ;		
    			
    sb.append( "Picture URL: Please include the <b> full url </b>to your picture<br>\n" +
    			"<input type=\"text\" name=\"picture\" size=\"50\" maxlength=\"100\" >" );
    
    String pic = request.getParameter( "picture" );
    
   	if( pic != null && (! pic.equals( "" ) ) ){
   	
   		if( ! pic.startsWith( "http://" ) )
   			
   			sb.append( INVALID + "Must begin with http://" );
   			
   	}

    
    sb.append( "<br><br>\n" );		
    
    
    sb.append( "Email: <br>\n" +
    			"<input type=\"text\" name=\"email\" size=\"40\" maxlength=\"40\" >" );
    
    if( request.getParameter( "email" ) == null || request.getParameter( "email" ).equals( "" ) ){
    	
    	sb.append( INVALID );
    	
    	valid = false;
    	
    }
      
    sb.append( "<br><br>\n" );	   
    
    sb.append( "Status: Put anything you  like!\n" +
    			"<input type=\"text\" name=\"status\" size=\"40\" maxlength=\"40\">\n" +
    			"<br><br>\n" );

    sb.append( "<input type=\"hidden\" name=\"statexp\" value=\"2014-01-22\" ></p>\n" );
    
    sb.append( "Phone pin: 4 numbers please \n" +
    			"<input type=\"text\" name=\"pin\" size=\"5\" maxlength=\"4\">");
    
    
    if( request.getParameter( "pin" ) == null || request.getParameter( "pin" ).equals( "" )){
    	
    	sb.append( INVALID );
    	
    	valid = false;
    	
    }
    else{
    	
    	for( int j = 0; j < request.getParameter( "pin" ).length(); j++ ){
    		
    		if( request.getParameter( "pin" ).charAt(j) < '0' ||  request.getParameter( "pin" ).charAt(j) > '9' ){
    		
    			sb.append( INVALID );
    			
    			valid = false;
    		
    		}
    	}
    }

    
    sb.append( "<br><br>\n" );	
    
    sb.append( "(1st preference)<br>\n" );
    			
    sb.append( printContactField( 0 ) );
    
    
    if( ! isValidContactField( 0, request.getParameter( "cmType0" ), request.getParameter( "contactMethod0" ) ) ){
    
    	sb.append( INVALID );
    	
    	valid = false;
   
    }
    
    sb.append( "<br><br>\n" );
    
    sb.append( "(2nd preference)<br>\n" );
    			
 	sb.append( printContactField( 1 ) );
    
    if( ! isValidContactField( 1, request.getParameter( "cmType1" ), request.getParameter( "contactMethod1" ) ) ){
    
    	sb.append( INVALID );
    	
    	valid = false;
    	
    }

    
    sb.append( "<br><br>\n" );
    			
    sb.append( "(3rd preference)<br>\n" );
    			
    sb.append( printContactField( 2 ) );
    
    if( ! isValidContactField( 2, request.getParameter( "cmType2" ), request.getParameter( "contactMethod2" ) ) ){
    	
   		sb.append( INVALID );
   		
   		valid = false;
    	
    }
    
    sb.append( "<br><br>\n" );
    			
    for( int i = 3; i < 10; i ++){
    
    	sb.append( printContactField( i) );

    		
    	if( ! isValidContactField( 2, request.getParameter( "cmType2" ), request.getParameter( "contactMethod2" ) ) ){
    
    		sb.append( INVALID );
 
 			valid = false;
    	
    	}
    
   		sb.append( "<br><br>\n" );
				
	}
    			
    sb.append(  "<input type=\"hidden\" name=\"mode\" value=\"subscribe\" > " +
    			"<button type=\"submit\" name=\"Submit\" >Submit</button>\n" +
    			"<button type=\"reset\">Reset</button>\n" + 
  				"</form></div>\n" );
  	
  	if( !valid ){
  				
  		return sb.toString();
 	
 	}
 	else{
 		
 		return null;
 	}
}
 %>
 <%!
 public String getInitForm(){
 
 	StringBuffer sb = new StringBuffer();
	
	sb.append( "<div class=\"paddedDiv\"> <br>\n" +
 				 "<b>Hermes Signup </b> </div>\n" );

	sb.append( "<div class=\"formDiv\"> \n" +  
 				 "<form name = \"subscribe\" method=\"post\" >\n" );
    
    sb.append( "<br>\n<br>\n" +
    			 "First name: " +
    			 "<input type=\"text\" name=\"first\" size\"25\" maxlength=\"40\">\n" );

    sb.append( "<br><br>\n" );
 			
    sb.append( "Middle initial: \n" +
    			 "<input type=\"text\" name=\"middle\" size=\"1\" maxlength=\"1\">\n " );
    
    sb.append( "<br><br>\n" );
    
    sb.append( "Last name:\n" + 
    			"<input type=\"text\" name=\"last\" size=\"30\" maxlength=\"40\" >\n" );
    
    sb.append( "<br><br>\n" ) ;		
    
    sb.append( "Location: \n" +
    			"<input type=\"text\" name=\"location\" size=\"20\" maxlength=\"20\" >\n" );
    
    sb.append( "<br><br>\n" ) ;		
    			
    sb.append( "Picture URL: Please include the <b> full url </b>to your picture<br>\n" +
    			"<input type=\"text\" name=\"picture\" size=\"50\" maxlength=\"100\" >\n" );
    
    sb.append( "<br><br>\n" );		
    
    
    sb.append( "Email: <br>\n" +
    			"<input type=\"text\" name=\"email\" size=\"40\" maxlength=\"40\">\n" );
    
    sb.append( "<br><br>\n" );	   
    
    sb.append( "Status: Put anything you  like!\n" +
    			"<input type=\"text\" name=\"status\" size=\"40\" maxlength=\"40\">\n" +
    			"<br><br>\n" );

    sb.append( "<input type=\"hidden\" name=\"statexp\" value=\"2014-01-22\" ></p>\n" );
    
    sb.append( "Phone pin: 4 numbers please \n" +
    			"<input type=\"text\" name=\"pin\" size=\"5\" maxlength=\"4\" >\n" );
    
    sb.append( "<br><br>\n" );	
    
    sb.append( "(1st preference)<br>\n" );
    			
    sb.append( printContactField( 0 ) );
    
    sb.append( "<br><br>\n" );
    
    sb.append( "(2nd preference)<br>\n" );
    			
 	sb.append( printContactField( 1 ) );
    
    sb.append( "<br><br>\n" );
    			
    sb.append( "(3rd preference)<br>\n" );
    			
    sb.append( printContactField( 2 ) );
    
    sb.append( "<br><br>\n" );
    			
    for( int i = 3; i < 10; i ++){
    
    	sb.append( printContactField( i) );
    
   		sb.append( "<br><br>\n" );
				
	}
    			
    sb.append( 	"<input type=\"hidden\" name=\"mode\" value=\"subscribe\" > " +
    			"<button type=\"submit\" name=\"Submit\" >Submit</button>\n" +
    			"<button type=\"reset\">Reset</button>\n" + 
  				"</form></div>\n" );
  	
  	return sb.toString();

}
%>

<%!

public void doSubscribe( ServletRequest request, JspWriter out ){
	
	String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RW&password=danish+scum";

	Connection connection = null;

	Statement statement = null;

	ResultSet rs = null;

	String q = "l";

	try{                                                                                   

  		Class.forName("com.mysql.jdbc.Driver").newInstance();

  		connection = DriverManager.getConnection(connectionURL, "", "");

  		statement = connection.createStatement();
  
  		String last     = request.getParameter( "last"     );

  		String first    = request.getParameter( "first"    );

  		String middle   = request.getParameter( "middle"   );

  		String loc      = request.getParameter( "location" );

  		String pic      = request.getParameter( "picture"  );

  		String email    = request.getParameter( "email"    );

  		String status   = request.getParameter( "status"   );

  		String statexp  = request.getParameter( "statexp"  );

  		String password = getRandomString( 8 );
  
  		String pin = request.getParameter( "pin" );

  		int auth     = 0;

  		String[] cm = new String[10];
  
  		String[] type = new String[10];

 		 int i;

 		 for( i = 0; i <=9; i++ ){
  
  		  cm[i] = request.getParameter( "contactMethod" + Integer.toString(i) );
  
  	}
	for( i = 0; i <=9; i++ ){
  
   		type[i] = request.getParameter( "cmType" + Integer.toString(i) );
		
		if( cm[i].length() > 2 ){
 
      		type[i] = type[i] + "://";
    
    	}
    	else{
    
    		type[i] = "";
    		cm[i]   = "";
      
    	}
  
  	}
  
  rs = statement.executeQuery("SELECT uid, lastName FROM hermesDir where email=\'" + email +"\' ORDER BY lastName");

  if( rs.next() ){ 
  
    out.println("ERROR: A user with the email address you specified is already in our database. <br>");
    out.println("If that is the correct email address you can request a password change  "); 
    out.println(" <a href=\"lostpassword.html\"><img src=\"images/password.png\" border=\"0\"> here </a>");
  }
  
  else{
  
    q = "INSERT into hermesDir ( lastName, firstName, middleInit,"
                                 +"location, email, picture, password, status, stat_expires,"
                                 +"auth, contact_0, contact_1,contact_2,contact_3,contact_4,"
                                 +"contact_5,contact_6,contact_7,contact_8,contact_9, phonePin) VALUES ("
                                 +"\'" + last   + "\', "
                                 +"\'" + first  + "\', "
                                 +"\'" + middle + "\', "
                                 +"\'" + loc    + "\', "
                                 +"\'" + email  + "\', "
                                 +"\'" + pic    + "\', "
                                 +"SHA1(\'" + password + "\'), "
                                 +"\'" + status  + "\', "
                                 +"\'" + statexp + "\', "
                                 +"\'" + Integer.toString( auth ) + "\', "
                                 +"\'" + type[0] + cm[0] + "\', "
                                 +"\'" + type[1] + cm[1] + "\', "
                                 +"\'" + type[2] + cm[2] + "\', "
                                 +"\'" + type[3] + cm[3] + "\', "
                                 +"\'" + type[4] + cm[4] + "\', "
                                 +"\'" + type[5] + cm[5] + "\', "
                                 +"\'" + type[6] + cm[6] + "\', "
                                 +"\'" + type[7] + cm[7] + "\', "
                                 +"\'" + type[8] + cm[8] + "\', "
                                 +"\'" + type[9] + cm[9] + "\', "
                                 +"\'" + pin + "\') " ;
    int n = statement.executeUpdate( q );
    
    if( n == 1 ){
  
      out.println("Thanks! Please check your email to confirm and get your password. <br>" );

      rs = statement.executeQuery("SELECT password from hermesDir WHERE email=\'" + email + "\'");
  
      rs.next();
    
      String hash = rs.getString( "password" );
    
      //Send the mail
      Properties props = System.getProperties();
  
      props.put("mail.smtp.host", "dept.cs.nyu.edu" );

      javax.mail.Session mailSession = Session.getDefaultInstance( props, null );
 
      MimeMessage message = new MimeMessage( mailSession );

      message.setFrom( new InternetAddress( "hermes@cs.nyu.edu" ) );
  
      message.addRecipient( Message.RecipientType.TO, new InternetAddress( email ) );
  
      message.setSubject( "Welcome to Hermes" );
  
      message.setText("Hello " + first  + "\n Welcome to hermes. Your password is currently " + password
                    + " .\n Please click <a href=\" http://giles.cs.nyu.edu:8080/hermes/activate.jsp?email=" + email
                    +"&act=" + hash +" \"> here</a> to activate your account.\n\n"
                    +"If your email client doesnt support links copy this url into your webbrowser:\n"
                    +"http://giles.cs.nyu.edu:8080/hermes/activate.jsp?email=" + email +"&act=" + hash 
                    +"\n\n To access more functions go <a href=\"http://giles.cs.nyu.edu:8080/hermes/hermes.jsp\"> here </a>"
                    + "\n\n Hermes");

      // Send message
      Transport.send(message);
    }
    
  }
}

catch( SQLException ex ){
	
  try{
  out.println("<h1> DATABASE UNAVAILABLE, please try again later</h1>");
  }
  catch( Exception e ){}

}
catch( Exception e ){
	
	;
}
}
%>

<%!
 /**
  * Generate a random String with the ascii chars  (48) - (126)
  * @param length The length of the random String
  * @return sb random String
  */
  private String getRandomString(int length ) {
  	
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
%>

<%!
/** 
	Used to fill the fields upon unsuccessful form completion.
	@param String the value of the field from the previous attempt
	@param boolean whether or not to return a digit ( for the contact field select boxes)
*/

public String fillField( String s, boolean d ){

	if( d ){
		
		if( s == null || s.equals( "null" ) )
		
			return "0";
		
		else
		
			return s;
	
	}
	else{
		
		if(  s == null || s.equals( "null" ) )
		
			return "";
	
		else
		
			return s;
	
	}

}
%>

