<html>
    <head>
	<title>Entrance</title>
    </head>

    <jsp:useBean id="sessionBean" class="poseidon.SessionBean" scope="session"/>
    <jsp:setProperty name="sessionBean"
                     property="user"
                     value='<%=request.getParameter("user")%>'/>
    <jsp:setProperty name="sessionBean"
                     property="password"
                     value='<%=request.getParameter("password")%>'/>
    
	<frameset cols="22%,78%">
	  <frame name="menu" src="sidebar.jsp" target="main"/>
	  <frame name="main" src="main.html"/>
	  <noframes>This browser does not support frames.</noframes>
	</frameset>    
</html>
