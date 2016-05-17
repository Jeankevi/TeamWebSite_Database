<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session"/> 
<% if(myUtil.getConn() == null){%>
	<jsp:forward page="openForm.jsp"></jsp:forward>
<% }%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp" />
<title> Student deletes a course </title>
</head>
<body>
<h1> Student deletes a course </h1>

<form action="deleteCourse.jsp" method="get">
<table> 

   <tr> <td> Course Number to be deleted: </td>  <td> <input type="text" name="crsnum" value="" size="20" required> </td> </tr>
   <tr> <td> Department of the course to be deleted: </td>  <td> <input type="text" name="dept" value="" size="20" required> </td> </tr>
   <tr> <td> Schedule Number that the course is on: </td>  <td> <input type="text" name="schnum" value="" size="20" required> </td> </tr>
   <%if(!userInfo.isStudent()){ %>
   	<tr> <td> SID is: </td>  <td> <input type="text" name="sid" value="" size="20" required> </td> </tr>
   <%} %>
	
  </table>
  <input type="submit" value="Delete Course">
</form>

</body>
</html>