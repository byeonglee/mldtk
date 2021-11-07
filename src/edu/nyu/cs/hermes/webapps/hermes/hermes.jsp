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

    <img src="images/hermes_logo.png"> <br />

  </p>

</div>

<body>

<br>
<br>

<% 
  if( request.getParameter( "logout" ) != null ){
  
    if( request.getParameter( "logout" ).equals( "true" ) ){
  
      session.invalidate();
  
    }
  
  }
%>

<%
  HttpSession mysession  = request.getSession( true );
  
  if( request.getParameter( "email" ) != null && request.getParameter( "password" ) != null ){

    String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RO&password=danish";
  
    Connection connection = null;
  
    Statement statement = null;
  
    ResultSet rs = null;
  
    try{                                                                                   
  
      Class.forName("com.mysql.jdbc.Driver").newInstance();
  
      connection = DriverManager.getConnection(connectionURL, "", "");
  
      statement = connection.createStatement();
  
      rs = statement.executeQuery( "SELECT * FROM hermesDir WHERE email=\'" + request.getParameter( "email" ) + "\'"
                                 + " AND password=\'" + request.getParameter( "password" ) + "\'" );
  
      if( rs.next() ){
        
        mysession.setAttribute( "loggedin", "yes" );
        
        mysession.setAttribute( "email", request.getParameter( "email" ) );
        
        mysession.setAttribute( "password", request.getParameter( "password" ) );
  
  
     }  
      else{
  
        out.println("The email / password combination you provided was not in the directory. Please log in again.");
      
      }
  
    }
  
    catch( Exception e ){
  
      out.println("<h1> DATABASE UNAVAILABLE for login, please try again later</h1>");
  
    }
  
  }
%>


<div align="center">

  <table width="75%" border="0" class=mainTable>
	
	<tr align="left">
	<%
      String loggedIn = (String)mysession.getAttribute( "loggedin" );
     
	  if( loggedIn == null ){
     
	    out.println( "<tr>\n  <td valign=\"middle\"><a href=\"login.html\"><img src=\"images/login.png\" "
                     + "witdth=\"48\" height=\"48\" border=\"0\"> Login</a></td>" );
     
	  }
      else{
     
	    out.println("<tr>\n<td valign=\"middle\"><a href=\"hermes.jsp?logout=true\"><img src=\"images/loggedin.png\" "
                     + "witdth=\"48\" height=\"48\" border=\"0\"> Logout</a></td>" );
     
	  }
    %>
	  <td> <a href="help.html"><img src="images/help.png" width="48" height="48" border="0" >Help 
        </a></td>
	</tr>
	
	<tr height="10" align="left">
      <td><img src="images/spacer.gif" border="0" height="10" width="10"></td>
    </tr>
    
	<tr align="left">  
        <p><td><a href="view.jsp"><img src="images/vcard.png" name="view" width="48" height="48" border="0" id="view"/> 
          View directory</a></p>
        </td>
      <td valign="middle"><a href="edit.jsp"><img src="images/xedit.png" name="edit" width="48" height="48" border="0" id="edit"/>Edit 
        your information</a></td>
    </tr>
    
    <tr height="10" align="left">
      <td><img src="images/spacer.gif" border="0" height="10" width="10"></td>
    </tr>
   
    <tr align="left"> 
      <td valign="middle"><a href="subscribe.jsp"><img src="images/greenled.png" name="subscribe" width="48" height="48" border="0" id="subscribe"/> 
        Subscribe</a></td>
      <td valign="middle"><a href="unsubConfirm.jsp"><img src="images/fileclose.png" name="unsubscribe" width="48" height="48" border="0" id="unsubscribe"/> 
        Unsubscribe</a></td>
    </tr>
   
    <tr height="10" align="left">
      <td><img src="images/spacer.gif" border="0" height="10" width="10"></td>
    </tr>
   
    <tr align="left"> 
      <td valign="middle"><a href="lostPassword.html"><img src="images/lostPassword.png" name="lostPassword" width="48" height="48" border="0" id="lostPassword"/>Lost 
        your password?</a></td>
      <td align="left"valign="middle"><a href="changePasswordEnter.jsp"><img src="images/password.png" name="changePassword" width="48" height="48" border="0" id="changePassword"/>Change 
        your password</a></td>
    </tr>
    
    <tr height="10" align="left">
      <td><img src="images/spacer.gif" border="0" height="10" width="10"></td>
    </tr>
    
    <tr>
      <td align="left" valign="middle"><a href="activate_login.html"><img src="images/activate.png" name="activate" width="48" height="48" border="0" id="activate"/>Activate 
        your account</a></td>
      <td align="left"valign="middle"><a href="changeStatusUser.jsp?mode=init"><img src="images/status.png" name="changeStatus" width="48" height="48" border="0" id="changeStatus"/>Change 
        your status</a></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</div>
</body>
</html>