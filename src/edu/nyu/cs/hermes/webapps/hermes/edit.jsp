<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>

<html>

<head>

<title>Hermes edit</title>

<link rel="stylesheet" href="control.css" type="text/css" />

<%! 
public String fillField( String fieldName, boolean f, ResultSet rs ){
  try{
    if( f )
      return "\"" + rs.getString( fieldName ) + "\"" ;
    else
      return "\"\"";
  }
  catch( SQLException s){
    return "\"\"";
  }
}
%>


<%! 
public String fillContactField( String fieldName, String val, boolean f ){

  if( f && fieldName != null ){ 
    
    if( fieldName.charAt(0) == 'a' ){
   
  	  if( val.indexOf( ':' ) == -1 )
  	  	
  	  	return "0";
   
      String type = val.substring( 0, val.indexOf(':') );
  
      if( type.equals( "email" ) )
        
        return "0";
      
      else if( type.equals( "aim" ) )
        
        return "1";
      
      else if( type.equals( "phone" ) )
       
        return "2";
        
      else
      	
      	return "0";
    
    }
    if( fieldName.charAt(0) == 'c' && val.length() > 0 ){
  
      String value = val.substring( val.indexOf(':') + 3, val.length() );
  
      return "\"" + value + "\"";
    
    }
  
  }
  else{
   
    return "\"\"";
    
  }
  return "\"\"";
}
%>

<%

String connectionURL = "jdbc:mysql://localhost:3306/hermes?user=pervasive_RW&password=danish+scum";

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

String email = (String)session.getAttribute( "email" );

String password = (String)session.getAttribute( "password" );

String[] methods = new String[10];

String pin;
  
boolean found = false;
  
if( session.getAttribute( "loggedin" ) != null ){
  
  try{                                                                                   

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    connection = DriverManager.getConnection(connectionURL, "", "");

    statement = connection.createStatement();
  
    rs = statement.executeQuery("SELECT * from hermesDir WHERE email=\'" + email + " \' AND" 
                              + " password=\'" + password + "\'" );
    if( rs.next() ){
    
      found = true;
    
      methods[0] = rs.getString( "contact_0" );
      methods[1] = rs.getString( "contact_1" );
      methods[2] = rs.getString( "contact_2" );
      methods[3] = rs.getString( "contact_3" );
      methods[4] = rs.getString( "contact_4" );
      methods[5] = rs.getString( "contact_5" );
      methods[6] = rs.getString( "contact_6" );
      methods[7] = rs.getString( "contact_7" );
      methods[8] = rs.getString( "contact_8" );
      methods[9] = rs.getString( "contact_9" );
      
      pin = rs.getString( "pin" );
    }
  }
  catch( Exception e ){
    ;
  }
}
%>

</head>

<body onLoad="fill_fields()" >

<div class="header"> 

  <p class="message"><br />

    <a href="hermes.jsp" > <img src="images/hermes_logo.png" border="0"></a> <br />

  </p>

</div>

<div class="backButton">
  
  <br>    
  <a href="hermes.jsp"><img align="center" src="images/back_arrow.png" border="0" height="64" width="64" >Back</a>
  <br>
  
</div>

<div class="paddedDiv">

  <b> Hermes Edit </b>

 </div>

<% 
if( session.getAttribute( "loggedin" ) == null){
  
  out.println( "<tr><td align=\"center\">\n  <br>\nPlease <a href=\"login.html\"> <img src=\"images/login.png\" border=\"0\">\n" +
                 " login</a> first.\n</td>\n</tr>" );

}
%>
<div class="formDiv">

<form name = "edit" method="post" action="editSave.jsp" onSubmit="return edit_verify();" >

<br>


First name:

<input type="text" name="first" size="25" maxlength="40">



Middle initial:

<input type="text" name="middle" size="1" maxlength="1"><br><br>



Last name:

<input type="text" name="last" size="30" maxlength="40"><br><br>



Location:

<input type="text" name="location" size="20" maxlength="20"><br><br>



Picture URL: Please include the <b> full url </b>to your picture<br>

<input type="text" name="picture" size="50" maxlength="100"><br><br>



Email: <br>

<input type="text" name="email" size="40" maxlength="40"><br><br>

Status: Put anything you like! 

<input type="text" name="status" size="40" maxlength="40"><br><br>

<input type="hidden" name="statexp" value="2014-01-22" >

Phone pin

<input type="text" name="pin" size="5" maxlength="4"><br><br>


Contact method: (1st preference)

<SELECT name="a0">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm0" size="25" maxlength="40"><br><br>



Contact method: (2nd preference)

<SELECT name="a1">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm1" size="25" maxlength="40"><br><br>



Contact method: (3rd preference)

<SELECT name="a2">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm2" size="25" maxlength="40"><br><br>

 

Contact method: (4)

<SELECT name="a3">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm3" size="25" maxlength="40"><br><br>



Contact method: (5)

<SELECT name="a4">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm4" size="25" maxlength="40"><br><br>



Contact method: (6)

<SELECT name="a5">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm5" size="25" maxlength="40"><br><br>



Contact method: (7)

<SELECT name="a6">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm6" size="25" maxlength="40"><br><br>



Contact method: (8)

<SELECT name="a7">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm7" size="25" maxlength="40"><br><br>



Contact method: (9)

<SELECT name="a8">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm8" size="25" maxlength="40"><br><br>



Contact method: (10)

<SELECT name="a9">

   <OPTION value="email">email

   <OPTION value="aim">aim

   <OPTION value="phone">phone

</SELECT>

<input type="text" name="cm9" size="25" maxlength="40"><br><br>

<button type="submit" name="Submit" value="Submit" >Submit</button>

<button type="reset">Reset</button>

</form>

</body>


<script language="Javascript 1.1">

function edit_verify()

{

	missing_field = false;

	msg="You are missing the following required fields: \n";

	//test the core requirements

	

	//first name

	if(document.edit.first.value.length == 0)

	{

		msg+="-First Name\n";

		missing_field = true;

	}

	//last name

	if(document.edit.last.value.length == 0)

	{

		msg+="-Last Name\n";

		missing_field = true;

	}

	//location

	if(document.edit.location.value.length == 0)

	{

		msg+="-Location\n";

		missing_field = true;

	}

	//e-mail

	if(document.edit.email.value.length == 0)

	{

		msg+="-E-mail\n";

		missing_field = true;

	}
	
	if(document.edit.picture.value.length == 0)

	{

		msg+="-Picture\n";

		missing_field = true;

	}

	

	if(document.edit.pin.value.length < 4)

	{

		msg+="-Phone pin\n";

		missing_field = true;



	}
	else{
	
		var pin = document.edit.pin.value;
		
		var valid = false;
		
		for( int i = 0; i < pin.length; i++ ){
		
			if( ( pin.charAt( i ) == ',' || pin.charAt( i ) == '&' ) ||
				( pin.charAt( i ) == '#' || pin.charAt( i ) == '*' ) ){
				
				continue;
			
			}
			else if( pin.charAt( i ) >= '0' || pin.charAt( i ) <= '9' ){
				
				continue;
			
			}
			
			else{
				
				valid = false;
				
				break;
			
			}
		}
		if( !valid ){
		
			msg+="-Phone pin invalid\n";
			
			missing_field = true;
		
		}
	}

	//first contact method

	if(document.edit.cm0.value.length == 0)

	{

		msg+="-contact method 1\n";

		missing_field = true;



	}
	
    else{
	    if( document.edit.a0.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm0.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 1 invalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a1.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm1.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 2 invalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a2.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm2.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 3 invalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a3.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm3.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 4 invalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a4.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm4.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 5 invalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a5.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm5.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 6 nvalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a6.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm6.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 7 nvalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a7.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm7.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 8 nvalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a8.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm8.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 9 nvalid. Must be 10 numbers\n";
          
		  }
		}
		if( document.edit.a9.selectedIndex == 2 ){
	    
		  if( number_tokenizer(document.edit.cm9.value) == null ){
		    
			missing_field = true;
		  
		    msg +="Phone number 10 nvalid. Must be 10 numbers\n";
          
		  }
		}
	}

	if(missing_field == true)

	{

		alert(msg);
		
		return (false);

	}

	else

	{
        return (true);
	}

}
function number_tokenizer( n )

{

	num="";

	for(i=0;i<n.length;i++)

	{

		if(n.charAt(i)>='0' && n.charAt(i)<='9')

		{

			num+=n.charAt(i);

		}

	}

	

	if(num.length == 10)

	{

		return num;

	}

	else

	{

		alert("Phone numbers must be 10 digits long");

		var ret = "0";
		
		return ret;

	}

}
</script>


<script language="Javascript">
function fill_fields(){

  document.edit.first.value = <%= fillField( "firstName", found, rs ) + ";" %> 

  document.edit.last.value = <%= fillField( "lastName", found, rs ) + ";" %> 

  document.edit.middle.value = <%= fillField( "middleInit", found, rs ) + ";" %> 

  document.edit.location.value = <%= fillField( "location", found, rs ) + ";" %> 

  document.edit.picture.value = <%= fillField( "picture", found, rs ) + ";" %>

  document.edit.email.value = <%= fillField( "email", found, rs ) + ";" %> 

  document.edit.status.value = <%= fillField( "status", found, rs ) + ";" %> 
  
  document.edit.a0.options[<%= fillContactField( "a0", methods[0], found) %> ].selected=true;
  
  document.edit.cm0.value = <%= fillContactField( "cm0", methods[0], found ) + ";" %>
  
  document.edit.a1.options[<%= fillContactField( "a1", methods[1], found ) %> ].selected=true;
  
  document.edit.cm1.value = <%= fillContactField( "cm1", methods[1], found ) + ";" %>
  
  document.edit.a2.options[<%= fillContactField( "a2", methods[2], found ) %> ].selected=true;
  
  document.edit.cm2.value = <%= fillContactField( "cm2", methods[2], found ) + ";" %>
  
  document.edit.a3.options[<%= fillContactField( "a3", methods[3], found ) %> ].selected=true;
  
  document.edit.cm3.value = <%= fillContactField( "cm3", methods[3], found ) + ";" %>
  
  document.edit.a4.options[<%= fillContactField( "a4", methods[4], found ) %> ].selected=true;
  
  document.edit.cm4.value = <%= fillContactField( "cm4", methods[4], found ) + ";" %>
  
  document.edit.a5.options[<%= fillContactField( "a5", methods[5], found ) %> ].selected=true;
  
  document.edit.cm5.value = <%= fillContactField( "cm5", methods[5], found ) + ";" %>
  
  document.edit.a6.options[<%= fillContactField( "a6", methods[6], found ) %> ].selected=true;
  
  document.edit.cm6.value = <%= fillContactField( "cm6", methods[6], found ) + ";" %>
  
  document.edit.a7.options[<%= fillContactField( "a7", methods[7], found ) %> ].selected=true;
  
  document.edit.cm7.value = <%= fillContactField( "cm7", methods[7], found ) + ";" %>
  
  document.edit.a8.options[<%= fillContactField( "a8", methods[8], found ) %> ].selected=true;
  
  document.edit.cm8.value = <%= fillContactField( "cm8", methods[8], found ) + ";" %>
  
  document.edit.a9.options[<%= fillContactField( "a9", methods[9], found ) %> ].selected=true;
  
  document.edit.cm9.value = <%= fillContactField( "cm9", methods[9], found ) + ";" %>
  
  document.edit.pin.value = <%= fillField( "phonePin", found, rs ) + ";" %>

}
</script>
</html>