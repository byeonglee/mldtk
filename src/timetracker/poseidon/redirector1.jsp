<html>
  <head>
    <title>Redirector</title>
  </head>
  <body>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <%
    String logout = request.getParameter("logout");
    if (logout != null && logout.equals("true")) {
      session.invalidate();
      out.println("<h2 align="center">You have successfully logged out.</H2>");
    }
   
   %>
   </body>
</html>
