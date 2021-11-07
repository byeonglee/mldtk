<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<head>

<title>View the directory</title>

<link rel="stylesheet" href="style.css" type="text/css" />

</head>

<body>

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>



<div align="left">
  
  <br>    
  <a href="hermes.jsp"><img align="center" src="images/back_arrow.png" border="0" >Back</a>
  <br>
  
</div>

<%!
//return the html for single user info
public String writeEntry(String uid, ResultSet rs ){

  String last     = "none";
  String first    = "none";
  String location = "none";
  String pic      = "none";
  String status   = "none";
 
  try{
	
	last     = rs.getString("lastName");
  
    first    = rs.getString("firstName");
  
    location = rs.getString("location");
  
    pic      = rs.getString("picture");
  
    status   = rs.getString("status");
  
  }
  
  catch(SQLException e){
	;
  }

  if( pic .equals("") )
  	pic = "images/face_outline.gif";

  String answer="<img class=\"pic\" src=\""+pic+"\" height=\"100\" border=\"0\" /> \n <div class=\"name\">\n"
             +first+" "+last+"\n </div> \n <br /> \n <div class=\"location\"> \n Room: "
             +location+"\n </div> \n <br /> \n <div class=\"status\"> \nStatus: "
             +status+"\n </div><br /> \n ";

  return answer;
}
%>

<%!
public String printTable(){

  String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RO&password=danish";
  
  Connection connection = null;
  
  Statement statement = null;
  
  ResultSet rs = null;
  
  StringBuffer sb = new StringBuffer();

  try{
      
    Class.forName("com.mysql.jdbc.Driver").newInstance();
  
    connection = DriverManager.getConnection(connectionURL, "", "");
  
    statement = connection.createStatement();
    
    rs = statement.executeQuery( "SELECT * from hermesDir where auth=1");

    int column = 0;
    
    rs.next();
    
    while( ! rs.isAfterLast() ){
      
      if( column == 0 )
         sb.append("<tr>\n");
   
      sb.append("<td align=\"left\">\n" + writeEntry( rs.getString( "uid" ), rs ) + "\n</td>\n" );
      
      column++;
      
      if( column == 3 ){
      
        sb.append("</tr>\n");
      
        column = 0;
      
      }
      
      rs.next(); 
    
    }  
  
  }
  catch( Exception e ){
    
    sb.delete( 0, sb.length() );
    
    sb.append( "An error has occurred. The database may be unavailable." );
  
  }
  
  return sb.toString();
} 
%>
<br />
<br />

<table class="main" width="750px" columns="3" >
  <%
    if( session.getAttribute( "loggedin") != null ){
    
      out.println( "<table align=\"center\" border=\"0\" cellpadding=\"10\">\n" );
      
      out.println( printTable() );
      
      out.println( "</table>\n" );
    
    }
    else{
    
      
      out.println( "<tr><td align=\"center\">\n  <br>\nPlease <a href=\"login.html\"> <img src=\"images/login.png\" border=\"0\">\n" +
                 " login</a> first.\n</td>\n</tr>" );
    }
 %>
</table>
</body>
</html>
