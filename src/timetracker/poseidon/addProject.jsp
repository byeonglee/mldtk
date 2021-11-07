<html>
  <head>
    <title>Add Project</title>
  </head>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <div align="center">
        <h3>Add New Project</h3>
        </br>
        </br>
        <pre>
          This page allows users to add new projects that will
          be used by this Time-Tracking system.

    <%
     if (sessionBean.getUser().equals("")) {
     %>
    <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
     %>

      <form action="redirector.jsp">
          Project Name:  <input type="text"     name="name">
          Description :  <input type="text" name="description">
          <input type="hidden" name="form" value="projects">
          <input type="hidden" name="type" value="add">	
        </pre> 
        <input type="submit" value="Add New Project"/>
        <input type="reset" value="Reset New Values"/>
      </form>
    </div>
    <% } %>
  </body>
</html>
  
