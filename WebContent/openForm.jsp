<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style> 
</style>
</head>
<body>
<jsp:include page="head.jsp"/>
<h1>Login</h1>

<form action="open.jsp" method="get">
  <table> 
   <tr> <td> User ID:     </td>  <td> <input type="text" name="user" value="" size="20">  </td> </tr>
   <tr> <td> Password: </td>  <td> <input type="password" name="password" value="" size="20"> </td> </tr>
  
           
  </table>
  <input type="submit" value="Login">
</form>


</body>
</html>