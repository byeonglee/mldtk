<html>
  <head>
    <title>Add User</title>
  </head>
  <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
  <body>
    <div align="center">
        <h3>Add New User</h3>
       
	</br>
	</br>
        <pre>
	  This page allows administer to add new user to
	  this Time-Tracking system.
       
  
     <%
      if (sessionBean.getUser().equals("")) {
     %>
    <h3 align="center">Invalid session. Please try to login.</h3>
    <% } else {
     %>

 
         <form action="redirector.jsp">
          User Name:  <input type="text"     name="name">
          Password :  <input type="password" name="password">
          Role     :  <select name="role">
                        <option selected>admin
                        <option>project
                        <option>user
                      </select> 
           </pre>
          <input type="hidden" name="form" value="users">
          <input type="hidden" name="type" value="add">	
        <input type="submit" value="Add New User"/>
        <input type="reset" value="Reset New Values"/>
      </form>
    </div>
    <% } %>
  </body>
</html>
  
