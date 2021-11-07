<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>

<title></title>

<link rel="stylesheet" href="interface.css" type="text/css" />

<script language="Javascript 1.1">

var targetURL = "front_page.jsp";

function doRedirect(){

  setTimeout( "timedRedirect()", 20000 );

}

function timedRedirect(){

  window.location.href = targetURL;

}
</script>

</head>

<body onload="doRedirect()">

<div class="header" align="left">

  <br />
  <a href="front_page.jsp"><img src="images/hermes_logo.png" border="0" class="main"></a> 
  <br />

</div>

<div class="backButton"> <a href="front_page.jsp"> <img align="center" src="images/back_arrow.png" border="0" height="64" width="64" > 
  Back </a> <br />
</div>

<%
if( (String)session.getAttribute( "kickedBack" ) != null ){

  session.invalidate();

}

HttpSession mySession = request.getSession( true );
  
String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RO&password=danish";

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, "", "");

statement = connection.createStatement();

String[] uidAr = new String[7];

for( int i = 1; i<=6; i++ )
  uidAr[i] = request.getParameter( "uid"+ Integer.toString( i ) );
  
mySession.setAttribute( "uids", uidAr );

%>


<%!
//return the html for single user info
public String writeEntry(String uid, Statement localStatement){
ResultSet rs = null;
String last     = "none";
String first    = "none";
String location = "none";
String pic      = "none";
String status   = "none";
 
try{
	
	rs=localStatement.executeQuery("SELECT firstName,lastName,picture,status,location FROM hermesDir WHERE uid="+uid);
	
	rs.next();
	
	last     = rs.getString("lastName");
    
    first    = rs.getString("firstName");
    
    location = rs.getString("location");
    
    pic      = rs.getString("picture");
    
    status   = rs.getString("status");

}

catch(SQLException e){

	System.out.println("An SQL Exception has occurred");

	System.out.println(e.toString());

}

//print pic
//print location
//print availability
//print click here to message

String answer="<img class=\"pic\" src=\"" + pic + "\" border=\"0\" height=\"100\" /> \n"+
              "  <div class=\"name\">\n"   +
                 first + " " + last + "\n "+
                 "</div> \n <br /> \n"     +
                 "<div class=\"location\">\n "+
                 "Room: " + location + "\n "  + 
                 "</div> \n <br /> \n "+
                 "<div class=\"status\"> \n "
                 + status + "\n <br /></div> \n"+
                 "<a href=\"contact.jsp?uid="+ uid + "&mode=lookup&meth=0\">" +
                 "<img src=\"images/contact.png\" border=\"0\" height=\"80\" ></a> \n <br />";

return answer;

}
%>

<br />

<table class="mainTable">
<tr>
  <td width="500px" height="150px" class="left">
<%
	if(!request.getParameter("uid1").equals("")){

	  out.println(writeEntry(request.getParameter("uid1"),statement));

	}
%>
 </td>
 <td>
<%
	if(!request.getParameter("uid2").equals("")){

 	 out.println(writeEntry(request.getParameter("uid2"),statement));

	}
%>
</td>
</tr>
<tr>
    <td  height="150px">
<%
	if(!request.getParameter("uid3").equals("")){

          out.println(writeEntry(request.getParameter("uid3"),statement));

	}
%>
   </td>
   <td>
<%
	if(!request.getParameter("uid4").equals("")){

          out.println(writeEntry(request.getParameter("uid4"),statement));

	}
%>

 	</td>
</tr>
<tr>
	<td height="150px">
<%
	if(!request.getParameter("uid5").equals("")){

         out.println(writeEntry(request.getParameter("uid5"),statement));

	}
%>
	</td>
	<td class="right">
<%
	if(!request.getParameter("uid6").equals("")){

          out.println(writeEntry(request.getParameter("uid6"),statement));

	}
%>

	</td>
</tr>
</table>

</body>
</html>
