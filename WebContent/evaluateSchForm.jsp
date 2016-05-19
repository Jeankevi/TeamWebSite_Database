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
<title> Evaluate Schedule </title>
</head>
<body>
<jsp:include page="head.jsp"/>
<h1>Evaluation the schedule </h1>
<%if(!userInfo.isValidSchedule()){ %>
	<h2 style="color: red;">Error Message</h2>
	<p style="color: red;">Invalid SID or Schedule Number. Schedule number must be between 1 and 9</p>
<%} %>
<form action="evaluateSch.jsp" method="post">
<table> 

	<%if(!userInfo.isStudent()){ %>
   		<tr> <td> Student ID: </td>  <td> <input type="text" name="sid" value="" size="20"> </td> </tr>
   	<%} %>
   <tr> <td> Schedule Num: </td>  <td> <input type="text" name="schNum" value="" size="20"> </td> </tr>
  
  </table>
  <input type="submit" value="Submit">
</form>

</body>
</html>