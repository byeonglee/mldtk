<%@ page contentType="text/html" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.net.*"  %>
<%@ page import="java.util.*"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

  <head>

    <title>Hermes Password change</title>
   
    <link rel="stylesheet" href="control.css" type="text/css" />
  
  </head>

<body onLoad="doRedirect()">

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

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
  
  rs = statement.executeQuery( "SELECT * FROM hermesDir where email=\'" + 
                               request.getParameter( "email" ) + "\' AND password=" +
                               "\'"+ request.getParameter( "currentPassword" ) +"\'" );
  if( rs.next() ){
  
    String newPasswordQuery = "UPDATE hermesDir SET password=\'" + request.getParameter( "newPassword" ) + "\' "
                          + "WHERE email=\'" + request.getParameter( "email" ) + "\'";
   
    statement.executeUpdate( newPasswordQuery );
    
    out.println( "You're password has been changed" );    
  }
  else{
  
  	out.println("<div align=\"center\" border=\"0\">\n");
    out.println("Either the email address you provided was not found in the database or");
    out.println("the password you provided was incorrect.\n</div>");    
    out.println("<table align=\"center\" border=\"0\">\n");
    out.println("<tr><td> <a href=\"changePasswordEnter.jsp\"><img src=\"images/password.png\" border=\"0\">\n");
    out.println("Try Again</a></td></tr>\n</table>");
    
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

