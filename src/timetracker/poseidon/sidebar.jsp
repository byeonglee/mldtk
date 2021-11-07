<html>
  <head>
    <title>SideBar</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
   <%
    if (sessionBean.getUser().equals("")) {
   %>
   <h3 align="center">Invalid session. Please try to login.</h3>
   <% } else {
    %>
   <%
	String user = sessionBean.getUser();
	String pass = sessionBean.getPassword();
        Connection conn = DatabaseConnection.getDatabaseConnection();
	Statement st  = null;
	ResultSet set = null;
	String role   = "";
	int roleType  = -1;
        String statement = null;
        try {
	   st  = conn.createStatement();
           statement = "SELECT role from users where name=\'"+user+"\' and password=\'" + pass + "\'";
	   set = st.executeQuery(statement);
   	   while (set.next() == true) {
	     role = set.getString("role");
           }
          
           if (role.equals("admin")) {
             roleType = 3;   
           } else if (role.equals("project")) {
             roleType = 2;
           } else if (role.equals("user")) {
             roleType = 1;
           }
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
  <body>
     </br>
     </br>
     </br>
     </br>   
    <table border="0" cellspacing="0" cellpadding="5" align="center">
      <% if (roleType == 3) { %>
      <tr><td><A href="usersAll.jsp" target="main">Users</A><td></tr>
      <% } %>
      <% if (roleType >= 2 ) { %>
      <tr><td><A href="projectsAll.jsp" target="main">Projects</A></td></tr>
      <tr><td><A href="tasksAll.jsp" target="main">Tasks</A></td></tr>
      <tr><td><A href="selectProject.jsp" target="main">Entries</A></td></tr>
      <tr><td><A href="redirector1.jsp?logout=true" target="main">Logout</A></td></tr>
      <% } %>
    </table>
   <% } %>
  </body>
</html>
