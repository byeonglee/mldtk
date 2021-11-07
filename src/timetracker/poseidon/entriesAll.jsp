<html>
  <head>
    <title>View All Entries</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <%@ page import="java.util.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <h2 align="center">View All Entries</h2>
    <br><br><br>
    <%
     if (sessionBean.getUser().equals("")) {
     %>
    <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
     %>

     <div align="center">
       <table border="1" cellspacing="0" cellpadding="5" align="center">
         <tr>
            <th>Project </th>
            <th>User </th>
            <th>Task Type</th>
            <th>Entry Name</th> 
            <th>Entry Description</th>
            <th>Time Start</th>
            <th>Time End</th>
         </tr>
         

          <%
            Connection conn = DatabaseConnection.getDatabaseConnection();
            Statement st  = null;
            ResultSet set = null;
            String ta = request.getParameter("task");
            String pt = request.getParameter("project");
            String ur = request.getParameter("users");
	try {
	   st  = conn.createStatement();
	   String stat = "SELECT * FROM entries";
           String add =  " WHERE ";
           if (ur != null) {
             add += " user = \'"  + ur + "\' ";
           }
           if (pt != null) {
             if (ur != null) {
               add += " AND ";
             }
             add += " project = \'" + pt + "\' ";
           }
           if (ta != null) {
             if (ur != null || pt != null) {     
               add += " AND ";
             }
             add += " task = \'" + ta + "\' ";
           }
           if (ta != null | pt != null || ur != null) {
             stat += add;
           }
           //out.println(stat);
           set = st.executeQuery(stat);
           while (set.next() == true) {
    %>
      <tr align="center">
       <td> <%=set.getString("project")%> </td>
       <td>  <%=set.getString("user")%> </td>
       <td>  <%=set.getString("task")%> </td>
       <td>  <%=set.getString("name")%> </td>
       <td>  <%=set.getString("description")%> </td>
       <td> <%=set.getString("time_start")%> </td>
       <td> <%=set.getString("time_end")%> </td>
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
    </br>
    </br>
    <form action="selectProject.jsp">
      <input type="hidden" name="user" value="<%=request.getParameter("user")%>">
    <input type="submit" value="Add New Entry"/>
    </form>
    </br>
    </br>
      <form action="entriesAll.jsp">
       <%
          conn = DatabaseConnection.getDatabaseConnection();
          LinkedList usersAll = new LinkedList();
          LinkedList projectsAll = new LinkedList();
          LinkedList tasksAll = new LinkedList();
          st = null;
          set = null;
          String  statement = null;
          try {
            st = conn.createStatement();
            statement = "SELECT name FROM users";
            set = st.executeQuery(statement);
           while (set.next() == true) {
              usersAll.add(set.getString("name"));
            }           
            
            statement = "SELECT name FROM projects";
            set = st.executeQuery(statement);
            while (set.next() == true) {
              projectsAll.add(set.getString("name"));
            }
	    
            statement = "SELECT name FROM tasks";
            set = st.executeQuery(statement);
            while (set.next() == true) {
              tasksAll.add(set.getString("name"));
            }
          } catch (Exception e) { 
             System.err.println("Exception has been thrown");
          } finally {
            try {
              st.close();
              conn.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          }
        %>
        <%
          Iterator pr = projectsAll.iterator();
          Iterator us = usersAll.iterator();
          Iterator ts = tasksAll.iterator();
          String temp = null;
         %>
        <select name="project" align="center">
        <%
          while (pr.hasNext()) {
             temp = (String) pr.next();
         %>
         <option value="<%=temp%>"><%=temp%></option>
       <% } %>
        </select>

       <select name="users" align="center">
        <%
          while (us.hasNext()) {
             temp = (String) us.next();
         %>
         <option value="<%=temp%>"><%=temp%></option>
       <% } %>
        </select>

        <select name="task" align="center">
        <%
          while (ts.hasNext()) {
             temp = (String) ts.next();
         %>
         <option value="<%=temp%>"><%=temp%></option>
       <% } %>
        </select>
        <input type="submit" value="Enter Search Criteria"/>
    </form>
    </div>
    <% } %>
  </body>
</html>
 

 
