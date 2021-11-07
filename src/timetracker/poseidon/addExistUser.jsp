<html>
  <head>
    <title>Add Existing Users</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <h2 align="center">Add Existing Users</h2>
    <br><br><br>
    <%
     if (sessionBean.getUser().equals("")) {
     %>
    <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
    %>

     <div align="center">
       <form action="redirector.jsp">
         <input type="hidden" name="form" value="projectUsers">
         <input type="hidden" name="type" value="addUserToProject">
         <input type="hidden" name="project" value="<%=request.getParameter("project")%>">
         <select name="user" align="center">
          <%
            Connection conn = DatabaseConnection.getDatabaseConnection();
            Statement st  = null;
	ResultSet set = null;
	try {
	   st  = conn.createStatement();
	   String stat = "SELECT name FROM users LEFT JOIN project_users ON users.name = project_users.user WHERE project_users.user IS NULL OR project_users.project <> \'" + 
                    request.getParameter("project") + "\'";
           out.println(stat);
           set = st.executeQuery(stat);
           while (set.next() == true) {
    %>
         <option value="<%=set.getString("users.name")%>"><%=set.getString("users.name")%></option>
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
    </select>
    </br>
    </br>
    <input type="submit" value="Add Existing User To This Project"/>
    </form>
    </div>
    <% } %>
  </body>
</html>
 

 
