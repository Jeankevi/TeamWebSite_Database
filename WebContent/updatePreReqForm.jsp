<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<% if(myUtil.getConn() == null){%>
	<jsp:forward page="openForm.jsp"></jsp:forward>
<% }%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp" />
<title> Adviser Updates PreReq </title>
</head>
<body>
<h1> Update PreReq </h1>

<form action="updatePreReq.jsp" method="get">
<table> 


   <tr> <td> Old PreReq Course Department to be updated: </td>  <td> <input type="text" name="oDept" value="MATH" size="20"> </td> </tr>
   <tr> <td> Old PreReq Course Number to be updated: </td>  <td> <input type="text" name="oNum" value="140" size="20"> </td> </tr>
  
   <tr> <td> Course Department with the PreReq: </td>  <td> <input type="text" name="cDept" value="CHEM" size="20"> </td> </tr>
   <tr> <td> Course Department with the PreReq: </td>  <td> <input type="text" name="cNum" value="115" size="20"> </td> </tr>
  
  
  
   <tr> <td> New PreReq Course Department: </td>  <td> <input type="text" name="nDept" value="MATH" size="20"> </td> </tr>
   <tr> <td> New PreReq Course Number: </td>  <td> <input type="text" name="nNum" value="152" size="20"> </td> </tr>





  </table>
  <input type="submit" value="Update PreReq">
</form>

</body>
</html>