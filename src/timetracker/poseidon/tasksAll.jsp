<html>
  <head>
    <title>ShowAllTasks</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <h2 align="center">Show All Tasks</h2>
    </br>
    </br>
    </br>

    This page allows administeres and project managers to view all
    tasks currently accessible in this Time-Tracking system.

    </br>
    <%
     if (sessionBean.getUser().equals("")) {
    %>
    <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
     %>

    </br>
  	
    <table border="1" cellspacing="0" cellpadding="5" align="center">
       <tr>
          <th>Task Name</th>
          <th>Task Description</th>
       </tr>
    <%
        Connection conn = DatabaseConnection.getDatabaseConnection();
	Statement st  = null;
	ResultSet set = null;
	try {
	   st  = conn.createStatement();
	   set = st.executeQuery("SELECT * from tasks");
   	   while (set.next() == true) {
    %>
	<tr align="center">
          <td align="center"><%=set.getString("name")%></td>
          <td align="center"><%=set.getString("description")%></td>
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
      <form action="addTask.jsp">
        <input type="submit" value="Add New Task"/>
      </form>
    </div>
    <% } %>
  </body>
</html>
 

 
