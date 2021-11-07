
<%@ page import="java.sql.*" %>

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
 
String email    = request.getParameter( "email"  );
String password = request.getParameter( "act"    );
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

  out.println( "Invalid URL" );

}

%>                               