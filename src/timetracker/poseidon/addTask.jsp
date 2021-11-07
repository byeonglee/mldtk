<html>
  <head>
    <title>Add Task</title>
  </head>
  <body>
  <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
    <div align="center">
	<h3>Add New Task</h3>
        </br>
        </br>
        <pre>
          This page allows uses to add new tasks that will be used by 
          by this Time-Tracking system to differentiate different
          entries logged here.
       <%
        if (sessionBean.getUser().equals("")) {
        %>
       <h3 align="center">Invalid session. Please try to login.</h3>
       <% } else {
        %>

       <form action="redirector.jsp">
          Task Name:  <input type="text"  name="name">
          Description :  <input type="text" name="description">
          <input type="hidden" name="form" value="tasks">
          <input type="hidden" name="type" value="add">	
       </pre>   
        <input type="submit" value="Add New Task"/>
        <input type="reset" value="Reset New Values"/>
      </form>
    </div>
      <% } %>
  </body>
</html>
  
