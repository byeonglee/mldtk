<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Hermes</title>
  <link rel="stylesheet" href="style.css" type="text/css" />
</head>

<body onLoad="doRedirect()">

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>

<div class="backButton"><br>
<a href="hermes.jsp"><img align="center" src="images/back_arrow.png" border="0" height="64" width="64" >Back</a>
<br>  

</div>

<div class="paddedDiv">

<%

String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RW&password=danish+scum";

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

String update = "";

try{                                                                                   

  Class.forName("com.mysql.jdbc.Driver").newInstance();

  connection = DriverManager.getConnection(connectionURL, "", "");

  statement = connection.createStatement();

}
catch( Exception e ){

  out.println("<h1> DATABASE UNAVAILABLE, please try again later</h1>");

}
 
String email    = (String)session.getAttribute( "email" );

String password = (String)session.getAttribute( "password" );
  
String query = "SELECT * from hermesDir where email=\'" + email 
                                + "\' AND password =\'"+ password + "\'";
rs = statement.executeQuery( query );

rs.first();
  
String indb = rs.getString( "firstName" );

if( indb == null ){
  out.println( "The email address / password combination you entered was not found in our database. <br>");
  out.println( "This is a strange error. You may have logged in, unsubscribed, subscribe again, and then tried to unsubscribe.");
  out.println( "Why are you behaving like this? Please log out and log back in with the correct password.");
}
else{

  try{

    update ="DELETE FROM hermesDir where email=\'" + email + "\'";

    int i = statement.executeUpdate( update ); 

    out.println("<br><br>You have been removed from the Hermes database. Sorry to see you go. ");
    out.println("<br>Return to <a href=\"hermes.jsp?logout=true\">hermes</a>. ");

  }
  catch( SQLException sql ){

    out.println( "An error occurred while communcating with the database. Please try again later." );

  }

}

%>
</div>

</body>
</html>                               