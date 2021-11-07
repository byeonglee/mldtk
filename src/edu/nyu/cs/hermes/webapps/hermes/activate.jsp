<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Hermes</title>
    <link rel="stylesheet" href="control.css" type="text/css" />
  </head>
<body >

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>

<div class="backButton">
  
  <br>    
  <a href="hermes.jsp"><img align="center" src="images/back_arrow.png" border="0" height="64" width="64" >Back</a>
  <br>
  
</div>


<%

String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RW&password=danish+scum";

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

try{                                                                                   

  Class.forName("com.mysql.jdbc.Driver").newInstance();

  connection = DriverManager.getConnection(connectionURL, "", "");

  statement = connection.createStatement();

}

catch( Exception e ){

  out.println("<h1> DATABASE UNAVAILABLE, please try again later</h1>");

}
 
String email    = request.getParameter( "email" );

String password = request.getParameter( "act" );
  
String query = "SELECT * from hermesDir where email=\'" + email 
                                + "\' AND password =\'"+ password + "\' ";
rs = statement.executeQuery( query );

rs.next();
  
String indb = rs.getString( "firstName" );

if( indb == null ){

  out.println( "Error in validation, please try again later. <br>");

}
else{
  
  try{
   
    int i = statement.executeUpdate("UPDATE hermesDir SET auth=1 where email=\'" + email 
                                    + "\' AND password = \'" + password + "\'" ); 
    out.println("You have been activated. Thanks!<br>");
   
  }
  catch( SQLException sql ){

    out.println( "An error occurred while communcating with the database. Please try again later." );

  }

}

%>                               