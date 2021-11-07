'<html>
  <head>
    <title>ShowAllProjectUsers</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <h2 align="center">Show All Users</h2>
    <br><br><br>
    <%
      if (sessionBean.getUser().equals("")) {
     %>
    <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
    %>

    <pre>
     <h3>Project Name: <%=request.getParameter("project")%></h3>
    </pre>
    <table border="1" cellspacing="0" cellpadding="5" align="center">
       <tr>
          <th>User Name</th>
       </tr>
    <%
        Connection conn = DatabaseConnection.getDatabaseConnection();
	Statement st  = null;
	ResultSet set = null;
	try {
	   st  = conn.createStatement();
           String stat = "SELECT user FROM project_users where project = \'" + request.getParameter("project") + "\'";
           // out.println(stat);
           set = st.executeQuery(stat);
        while (set.next() == true) {
    %>
	<tr align="center">
          <td align="center"><%=set.getString("user")%></td>
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
    <form action="addExistUser.jsp">
      <input type="hidden" name="project" value="<%=request.getParameter("project")%>">
      <input type="submit" value="Add Existing User To This Project"/>
    </form>
    </div>
    <% } %>
  </body>
</html>
 

 
