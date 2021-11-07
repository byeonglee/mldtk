<html>
  <head>
    <title>Create New Entry</title>
  </head>
  <%@ page import="poseidon.DatabaseConnection"%>
  <%@ page import="java.sql.*"%>
  <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <h2 align="center">Create New Entry</h2>
    <br><br><br>
    <%
     if (sessionBean.getUser().equals("")) {
    %>
    <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
     %>

     <div align="center">
        <%
          Locale locale = Locale.getDefault();
          SimpleDateFormat format = new SimpleDateFormat(
                         "hh:mm aaa MMM dd yyyy", locale);
          String time = format.format(new java.util.Date());
        %>
       <table borderr="1" cellspacing="0" cellpadding="5" align="center">
         <tr>
            <th>Task Type</th>
            <th>Entry Name</th> 
            <th>Entry Description</th>
            <th>Time Start</th>
            <th>Time End</th>
         </tr>
         <tr>
           <td>
       <form action="redirector.jsp">
         <input type="hidden" name="form" value="projectEntry">
         <input type="hidden" name="type" value="addEntryToProject">
         <input type="hidden" name="project" value="<%=request.getParameter("project")%>">
         <input type="hidden" name="user"   value="<%=request.getParameter("user")%>">
         <select name="task" align="center">
          <%
            Connection conn = DatabaseConnection.getDatabaseConnection();
            Statement st  = null;
	ResultSet set = null;
	try {
	   st  = conn.createStatement();
	   String stat = "SELECT name FROM tasks";
           set = st.executeQuery(stat);
           while (set.next() == true) {
    %>
         <option value="<%=set.getString("name")%>"><%=set.getString("name")%></option>
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
         </td>
         <td><input type="text" name ="name"> </td>
         <td><input type="text" name ="description"></td>
         <td><input type="text" name ="time_start" value="<%=time%>"> 
         </td>
         <td><input type="text" name ="time_end" value="<%=time%>"> 
         </td>
         </tr>
    </table>
    </br>
    </br>
    <input type="submit" value="Add New Entry"/>
    </form>
    </div>
    <% } %>
  </body>
</html>
 

 
