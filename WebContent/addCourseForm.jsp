<%@ page import="java.sql.*"%>
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
<title>Add A Course To a Schedule</title>
</head>
<body>
<h1> Add a Course to a Schedule </h1>
<%if(!userInfo.isValidCourse()){ %>
	<h2 style="color: red;">Error Message</h2>
	<p style="color: red;">Invalid Course. Make sure both department and course number are correct</p>
<%}else if(!userInfo.isValidSchedule()){ %>
	<h2 style="color: red;">Error Message</h2>
	<p style="color: red;">Schedule Number Must be Between 1 and 9</p>
<%}else if(userInfo.courseOnSchedule()){ %>
	<h2 style="color: red;">Error Message</h2>
	<p style="color: red;">Course is Already on Schedule</p>
<%}%>
<form action = "addCourse.jsp" method="post">

<table>
	<%if(!userInfo.isStudent()){ %>
		<tr> <td> Student ID: </td> <td> <input type="text" name="sid" value="" size="20" required> </td> </tr>
	<%} %>
	<%
	ResultSet rset = null;
	if(userInfo.isStudent()){
		rset = myUtil.getAllScheduleNum(userInfo.getUser());
	}%>

	<p>
		<tr> <td> Schedule Number: </td> <td> <select id = "sNum" style= "width: 145px;" tabindex="5" name="Tag">
			<% while (rset.next()) {%>				
			<option value = "<%=rset.getString(1)%>" selected ="sNum"><%=rset.getString(1)%></option>
			<%}%>
			</select></td></tr>
	</p>
	<tr> <td> Course Department: </td> <td> <input type="text" name="dept" value="" size="20" required> </td> </tr>
	<tr> <td> Course Number: </td> <td> <input type="text" name="cNum" value="" size="20" required> </td> </tr>
	<tr> <td> In what semester: </td> <td> <input type="text" name="sem" value="" size="20" required> </td> </tr>
	<tr> <td> In what year: </td> <td> <input type="text" name="year" value="" size="20" required> </td> </tr>
</table>
<input type="submit" value="Add Course">



</form>

</body>
</html>