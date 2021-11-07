<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

    <title>Hermes</title>

    <link rel="stylesheet" href="control.css" type="text/css" />
    
    <script language="Javascript 1.1">
      
      var targetURL = "hermes.jsp";
      
      function doRedirect(){
      
        setTimeout( "timedRedirect()", 5000 );
      
      }
      
      function timedRedirect(){
      
        window.location.href = targetURL;
      
      }
      
      </script>
</head>
  
<body onLoad="doRedirect()" >

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>



<div class="backButton">
  <br>
  <a href="hermes.jsp"><img src="images/back_arrow.png" border="0">Back</a>

</div>

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
<p>
<%
String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RW&password=danish+scum";

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

String q = "";

try{        
                                                                           
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  
  connection = DriverManager.getConnection(connectionURL, "", "");
  
  statement = connection.createStatement();
  
  String last     = request.getParameter( "last"     );
  
  String first    = request.getParameter( "first"    );
  
  String middle   = request.getParameter( "middle"   );
  
  String location = request.getParameter( "location" );
  
  String picture  = request.getParameter( "picture"  );
  
  String email    = request.getParameter( "email"    );
  
  String status   = request.getParameter( "status"   );
  
  String statexp  = request.getParameter( "statexp"  );
  
  String password = getRandomString( 8 );
  
  String pin = request.getParameter( "pin" );
  
     int auth     = 0;
     
  String[] cm = new String[ 10 ];
  String[] type = new String[ 10 ];
  
  for( int i = 0; i < 10 ; i++ ){
  	
  	cm[i] = request.getParameter( "cm" + i );
  	
  	type[i] = request.getParameter( "a" + i );
  	
  	if( ! cm[i].equals("") )
  	
  		cm[i] = type[i] + "://" + cm[i]; 
  
  }
  
  boolean dupEmail = false;

  rs = statement.executeQuery("SELECT uid, lastName, email FROM hermesDir where email=\'" + email +"\' ORDER BY lastName");

  out.println("<br><table class=\"mainTable\"><tr><td>\n" );

  if( rs.next()  && ( rs.getString( "email" ) != null ) ){
  
  	if( ! rs.getString( "email" ).equals( email ) ){ //email has been changed
  		
  		rs = statement.executeQuery( "SELECT * FROM hermesDir WHERE email=\'" + rs.getString( "email" ) + "\'");
  		
  		
  		if( ! rs.next() ){
	    	
	    	dupEmail = true;
	    	
	    	out.println("ERROR: Another user with the email address you specified is already in our database. <br>\n");
  		
  		}
 
  	}
  	
  }
  
  if( !dupEmail ){
  
     q = "UPDATE hermesDir SET lastName=\'"   + last     + "\', "
                            + "firstName=\'"  + first    + "\', "
                            + "middleInit=\'" + middle   + "\', "
                            + "location=\'"   + location + "\', "
                            + "email=\'"      + email    + "\', "
                            + "picture=\'"    + picture  + "\', "
                            + "status=\'"     + status   + "\', "
                            + "stat_expires=\'" + statexp    + "\', "
                            + "contact_0=\'"    + cm[0]  + "\', "
                            + "contact_1=\'"    + cm[1]  + "\', "
                            + "contact_2=\'"    + cm[2]  + "\', "
                            + "contact_3=\'"    + cm[3]  + "\', "
                            + "contact_4=\'"    + cm[4]  + "\', "
                            + "contact_5=\'"    + cm[5]  + "\', "
                            + "contact_6=\'"    + cm[6]  + "\', "
                            + "contact_7=\'"    + cm[7]  + "\', "
                            + "contact_8=\'"    + cm[8]  + "\', "
                            + "contact_9=\'"    + cm[9]  + "\', "
                            + "phonePin=\'"		+ pin    + "\'"
                            + " where email=\'"  + email  + "\'";
  
    int n = statement.executeUpdate( q );
    
    out.println("<br>Changes are successful.<br>" );
  
    out.println("You will be taken back to the main page in 5 seconds.<br>");
    
  }
  
}

catch( Exception ex ){
  
  out.println( q );
  
  out.println("<h1> DATABASE UNAVAILABLE, please try again later</h1>");
  
  out.println( ex.getMessage() );

}
out.println("</td></tr></table>" );
    
%>       
                                                                                                                     
</body>
</html>