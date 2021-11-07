<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>

<html>

<head>

<title>Hermes status change</title>

<link rel="stylesheet" href="control.css" type="text/css" />

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>



<div align="left">
  
  <br>    
  <a href="hermes.jsp"><img align="center" src="images/back_arrow.png" border="0" height="64" width="64" >Back</a>
  <br>
  
</div>


<div align="center">
  <br>
  <b> Hermes Status change </b>
  <br>
</div>

<div align="left">

<%
if( session.getAttribute( "loggedin" ) == null ) {
    
  out.println( "<br>Please <a href=\"login.html\"> <img src=\"images/login.png\" border=\"0\">\n" +
                 " login</a> first.\n" );

}  
if( request.getParameter("mode").equals( "init") && session.getAttribute( "loggedin" ) != null){
 
  out.println("<br>New Status: <br><br>\n");
  
  out.println("<form name=\"changeStatus\" method=\"post\" action=\"changeStatusUser.jsp\" onSubmit=\"return makeCommand();\">\n<br>\n");
  
  out.println("<input type=\"hidden\" name=\"mode\" value=\"apply\">\n\n");
  
  out.println("<input type=\"text\" name=\"status\" size=\"40\" maxlength=\"40\">\n<br><br>\n");
  
  out.println("<button type=\"submit\" name=\"Apply\" value=\"Submit\">Apply Change</button></form>\n<br>\n");
  
  out.println("Click below to generate a command string that can be used to update your status from<br> ");
  
  out.println("a script or a *nix command line with the <a href=\"http://curl.haxx.se\">curl</a> utility installed.");
  
  out.println("<button name=\"command\" onClick=\"makeCommand( )\"> Generate </button>");
              
  out.println("<br><form name=\"cmd\" onSubmit=\"makeCommand()\"><textarea name=\"commandArea\" cols=85 rows=4></textarea></form>\n" );

}
else if( request.getParameter("mode").equals( "apply" ) ){
  
  String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RW&password=danish+scum";

  Connection connection = null;

  Statement statement = null;
 
  ResultSet rs = null;

  try{                                                                                   

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    connection = DriverManager.getConnection(connectionURL, "", "");

    statement = connection.createStatement();
    
    String email    = (String)session.getAttribute( "email"  );
    
    String password = (String)session.getAttribute( "password"    );
    
    String status   = request.getParameter( "status" );
    
    if( ( email != null && password != null ) && ( status != null ) ){

      String query = "SELECT * from hermesDir where email=\'" + email 
                                + "\' AND password =\'"+ password + "\' ";
      rs = statement.executeQuery( query );

      boolean error = false;
  
      if( status.length() > 40 ){
    
        out.println( "Please limit your status to 40 characters." );
      
        error = true;
      
      }
      if( ! rs.next() ){
   
        out.println( "The email address / password you submitted was incorrect." );
    
        error = true;
    
  
      }
      if( ! error ){
   
        try{
    
          int i = statement.executeUpdate("UPDATE hermesDir SET status=\'" + status + "\' where email=\'" + email 
                                    + "\' AND password = \'" + password + "\'" ); 
          out.println("Youre status has been changed. Thanks!");

        }
        catch( SQLException sql ){
    
          out.println( "An error occurred while communcating with the database. Please try again later." );
    
        }
  
      }

    }
    else{
    
      out.println("Missing information");
    
    }
  
  }
  catch( Exception e ){

    out.println("<h1> DATABASE UNAVAILABLE, please try again later</h1>");

  }
  
}
%>

</body>
<script language="Javascript" >

function makeCommand( ){

  if( document.changeStatus.status.value.length == 0){
  
    alert( "Please enter a status" );
    
    return (false);
    
  }
  else
  {
    document.cmd.commandArea.value = "curl \'http://giles.cs.nyu.edu:8080/hermes/changeStatus.jsp?email=" 
                                    + <%= "\"" + (String)session.getAttribute( "email" ) + "\"" %>
                                    + "&act=" + <%= "\"" + (String)session.getAttribute( "password" ) + "\"" %> 
                                    + "&status=" + document.changeStatus.status.value + "\'";
    return (true);
    
  }                             
}
</script>
</html>