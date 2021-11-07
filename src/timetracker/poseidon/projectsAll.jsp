<html>
  <head>
    <title>ShowAllProjects</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <h2 align="center">Show All Projects</h2>
    </br>
    </br>
    </br>

    <pre align="center">
      This page allows administers and project managers to view all 
      projects currently accessible in this Time-Tracking system.
    </pre>
    <%
      if (sessionBean.getUser().equals("")) {
     %>
     <h3 align="center">Invalid session. Please try to login.</h3>
     <% } else {
      %>

    <table border="1" cellspacing="0" cellpadding="5" align="center">
       <tr>
          <th>Project Name</th>
          <th>Project Description</th>
          <th>Project Users</th>
       </tr>
    <%
        Connection conn = DatabaseConnection.getDatabaseConnection();
	Statement st  = null;
	ResultSet set = null;
	try {
	   st  = conn.createStatement();
	   set = st.executeQuery("SELECT * from projects");
   	   while (set.next() == true) {
    %>
	<tr align="center">
          <td align="center"><%=set.getString("name")%></td>
          <td align="center"><%=set.getString("description")%></td>
          <td align="center"><form method="post" 
       action="projectUsers.jsp?project=<%=set.getString("name")%>"> 
         <input type="submit" name="Project Users" value="Project Users">
          </form>
        </td>
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
      <form action="addProject.jsp">
        <input type="submit" value="Add New Project"/>
      </form>
    </div>
    <% } %>
  </body>
</html>
 

 
