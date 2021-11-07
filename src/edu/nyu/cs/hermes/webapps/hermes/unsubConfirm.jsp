<html >

<head>

<title>Hermes Unsubscribe</title>

<link rel="stylesheet" href="control.css" type="text/css" />

</head>

<body >

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>



<div class="backButton">

<a href="hermes.jsp"><img src="images/back_arrow.png">Back</a>

</div>

<div class="paddedDiv">

  <b><br><br> Hermes Unsubscribe </b>

 </div>
 
<br>
<br>

<div class="formDiv">

<form name="unsubscribe" method="post" action="unsub.jsp" >

<%

if( session.getAttribute( "loggedin" ) != null){

  out.println("Are you sure you really want to unsubscribe?");

  out.println("<button type=\"Submit\" name=\"unsub\" value=\"Submit\">Submit</button>" );

}
else{
  
  out.println( "<tr><td align=\"center\">\n  <br>\nPlease <a href=\"login.html\"> <img src=\"images/login.png\" border=\"0\">\n" +
                 " login</a> first.\n</td>\n</tr>" );

}
%>


</form>

</div>
</body>
</html>
