<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>

<title>Hermes</title>

<link rel="stylesheet" href="interface.css" type="text/css" />

</head>
<body >

<div class="header"> 

  <p class="message"><br />

    <a href="front_page.jsp" ><img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>



<%!
  public String printTableLine( String uid, String name , String pic ){

	if( pic == null || pic.equals( "" ) ){
	
		pic = "images/face_outline.gif" ;
	
	}
	
	return "<tr><td align=\"left\"><a href=\"contact.jsp?uid=" + uid + "&mode=lookup&meth=0\" >"
				+ name + "</a></td>\n" 
				+ "<td align=\"right\"><a href=\"contact.jsp?uid=" + uid + "&mode=lookup&meth=0\">"
				+ "<img src=\"" + pic + "\" border=\"0\" height=\"50\"></td></tr>";
}
%>

<%

String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RO&password=danish";

Connection connection = null;

Statement statement = null;

ResultSet rs = null;
                                                                                   
Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, "", "");

statement = connection.createStatement();

rs = statement.executeQuery("SELECT uid, firstName, lastName, picture FROM hermesDir WHERE auth=1 ORDER BY lastName");

%>

<br>

Welcome to the Hermes system. Touch the name or picture to choose the person to you would like to contact.


<br />

<a name=\"0\"></a>

<table class="mainTable" cellpadding="10" cellspacing="10" align="center">
<% 
  
  int i = 0, n = 1;
  int namesPerPage = 8;
  
  while( rs.next() ){
  	
%>
  	<%= printTableLine( rs.getString( "uid" ),
  					rs.getString( "firstName" ) + " " + rs.getString( "lastName" ),
  					rs.getString( "picture" ) )
  	%>
  	
<%
	i++;
	
	if( i % namesPerPage == 0){	
	
		out.println( "<tr><td align=\"left\">\n  <a href=\"#" + n  + "\"> \n" +
	  			  	 "<span class=\"arrow_text\"><img src=\"images/down_arrow.png\" border=\"0\" height=\"45\">More</a> \n" );
	    
	    out.println( "\n<br><br><br><br><br><br><br><br><br>\n" );
	    
	    out.println( "<a href=\"#" + (n - 1) + "\">\n" +
	    			 "<img src=\"images/up_arrow.png\" border=\"0\" height=\"45\"> More</a></span> \n</td></tr>\n\n" );
	  			  	 
	  	out.println( "<a name=" + (n + 1) + "\"></a>\n" );
	  	
	  	n++;
	
	}

  }
  try{
  	
	
	rs.close();
	
	statement.close();
	
	connection.close();
  
  }
  catch( Exception e ){
  	
  	rs = null;
  	
  	statement = null;
  	
  	connection = null;
  	
  }
%>
</table>
</body>
</html>
