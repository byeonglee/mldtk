<html>
  <head>
    <title>Redirector</title>
  </head>
  <body>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <%
    String formName = request.getParameter("form"); 
    String type     = request.getParameter("type");
    out.println(formName + " " + type); 
   
    String statement = null;
    if (formName == null) {
      formName = "";
    }
    if (formName.equals("users") && type.equals("add")) {
      statement = "INSERT INTO " + formName + " VALUES (\'"   + 
                  request.getParameter("name") + "\', \'"    +
                  request.getParameter("password") + "\',\'" +
                  request.getParameter("role") + "\')";
    } else if (formName.equals("projects") && type.equals("add")) {
      statement = "INSERT INTO " + formName + " VALUES (\'"   + 
                  request.getParameter("name") + "\', \'"    +
                  request.getParameter("description") + "\')";
    } else if (formName.equals("tasks") && type.equals("add")) {
      statement = "INSERT INTO " + formName + " VALUES (\'" +
                   request.getParameter("name") + "\', \'" +
                   request.getParameter("description") + "\')";
    } else if (type.equals("addUserToProject")) {
      statement = "INSERT INTO project_users VALUES (\'"     + 
                  request.getParameter("project") + "\', \'" + 
                  request.getParameter("user")    + "\')";
    } else if (type.equals("addEntryToProject") && 
                formName.equals("projectEntry")) {
      statement = "INSERT INTO entries VALUES (\'" +
                   request.getParameter("project") + "\', \'" + 
                   request.getParameter("user") + "\', \'" + 
                   request.getParameter("task") + "\', \'" + 
                   request.getParameter("name") + "\', \'" + 
                   request.getParameter("description") + "\', \'" + 
                   request.getParameter("time_start") + "\', \'" + 
                   request.getParameter("time_end") + "\')";
     out.println(statement);
    }
    Connection conn = DatabaseConnection.getDatabaseConnection();

    Statement st  = null; 
    ResultSet set = null;
    try {
        st  = conn.createStatement();
      st.executeUpdate(statement) ;
    } catch (java.sql.SQLException sql) {
      System.err.println("SQL Exception");
      out.println("SQL Exception");
      out.println(sql.getMessage());
      out.println("\n"  + statement);
      sql.printStackTrace();
    } catch (Exception e) {
      System.err.println("General Exception");	
      out.println("General Exception");
    } finally {
      try {
        st.close();
        conn.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    if (formName != null) {
      if (formName.equals("users")) {
        pageContext.forward("usersAll.jsp");
      } else if (formName.equals("projects")) {
        pageContext.forward("projectsAll.jsp");
      } else if (formName.equals("tasks")) {
        pageContext.forward("tasksAll.jsp");
      } else if (formName.equals("projectUsers")) {
        pageContext.forward("projectUsers.jsp");
      } else if (formName.equals("projectEntry")) {
        pageContext.forward("entriesAll.jsp");
      }
    }
   %>
   </body>
</html>
