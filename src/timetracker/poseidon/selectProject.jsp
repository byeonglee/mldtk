<html>
  <head>
    <title>Select Project To Work With</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <%
     if (sessionBean.getUser().equals("")) {
     %>
    <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
    %>

    <h2 align="center">Select Project To Work With</h2>
    <br><br><br>
     <div align="center">
       <form action="projectEntry.jsp">
         <input type="hidden" name="user" value="<%=sessionBean.getUser()%>">
         <select name="project" align="center">
          <%
            String user = sessionBean.getUser();
            Connection conn = DatabaseConnection.getDatabaseConnection();
            Statement st  = null;
            ResultSet set = null;
	try {
	   st  = conn.createStatement();
	   set = st.executeQuery("SELECT project FROM project_users where user = \'" +
                                 user + "\' ");
        while (set.next() == true) {
    %>
         <option value="<%=set.getString("project")%>"><%=set.getString("project")%></option>
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
    <input type="submit" value="Select Working Project"/>
    </form>
   
    </br>
    </br>
    <form action="entriesAll.jsp">
      <input type="hidden" name="user" value="<%=request.getParameter("user")%>"/>
      <input type="submit" value="View All Entries"/>
    </form>
    </div>
    <% } %>
  </body>
</html>
 

 
