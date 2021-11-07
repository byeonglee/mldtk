<html>
  <head>
    <title>ShowAllUsers</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>  
  <body>
    <h2 align="center">Show All Users</h2>
    </br>
    </br>
    </br>

    <pre align="center">
      This page allows administers to view all users currently registered 
                          in this Time-Tracking system.
    </pre>
    <%
      if (sessionBean.getUser().equals("")) {
      %>
     <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
     %>

    <table border="1" cellspacing="0" cellpadding="5" align="center">
       <tr>
          <th>User Name</th>
          <th>User's Role</th>
       </tr>
    <%
        Connection conn = DatabaseConnection.getDatabaseConnection();
	Statement st  = null;
	ResultSet set = null;
	try {
	   st  = conn.createStatement();
	   set = st.executeQuery("SELECT * from users");
   	   while (set.next() == true) {
    %>
	<tr align="center">
          <td align="center"><%=set.getString("name")%></td>
          <td align="center"><%=set.getString("role")%></td>
        </tr>
    <%        }
        } catch (java.sql.SQLException sql) {
	  System.err.println("SQL Exception");
	  sql.printStackTrace();
        } catch (Exception e) {
	  System.err.println("General Exception");	
        } finally {
          try {
            st.close();
            conn.close();
          } catch (Exception e) {
            e.printStackTrace();
          }
        }
        
    %>
    </table>
    <div align="center">
    <form action="addUser.jsp">
      <input type="submit" value="Add New User"/>
    </form>
    </div>
     <% } %>
  </body>
</html>
 

 
