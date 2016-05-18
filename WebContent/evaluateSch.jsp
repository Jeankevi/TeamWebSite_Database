<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluate Schedule</title>
</head>
<body>
<jsp:include page="head.jsp"/>
	<h1>Evaluate Schedule</h1>

	<%if(!userInfo.isStudent()){ %>
	The Student ID is:
	<%=request.getParameter("sid") %>
	<%} %>
	<br> The Schedule Number is:
	<%=request.getParameter("schNum") %>
	<br>


	<%
	String sid = "";
	if(!userInfo.isStudent()){		
		sid = request.getParameter("sid");
	}else{
		sid = userInfo.getUser();
	}
		int schNum = Integer.parseInt(request.getParameter("schNum"));
		
		ResultSet rset1 = myUtil.scheduleEval1(schNum,sid);
		ResultSet rset2 = myUtil.scheduleEval2(schNum,sid);
		ResultSet rset3 = myUtil.scheduleEval3(schNum,sid);
		ResultSet rset4 = myUtil.scheduleEval4(schNum,sid);
	%>

	<%if(rset1 == null) {%>
		<h2 style="color:green">1. You have fulfilled required CSCE courses (12 credits)</h2>
	<%}else{ %>	
		<h2 style="color:red">1. There are classes required CSCE courses (12 credits)</h2>
		<table border="1" cellpadding="5">
			<tr>
				<th>Course</th>
				<th>Semester</th>
				<th>Credit hours</th>
			</tr>
			<%while(rset1.next()) {%>
			<tr>
				<td align="center"><%=rset1.getString(1)%></td>
				<td align="left"><%=rset1.getString(2)%>
				<td align="center"><%=rset1.getString(3)%></td>
			</tr>
			<%}	%>
		</table>
		<br>
	<%} %>
	
	<%if(rset2 == null) {%>
		<h2 style="color:green">2. You have fulfilled required of CSCE 367 or CSCE 390 (4 credits)</h2>
	<%}else{ %>	
	<h2 style="color:red">2. Please choose 1 course required of CSCE 367 or CSCE 390 (4 credits)</h2>
	<table border="1" cellpadding="5">
		<tr>
			<th>Course</th>
			<th>Semester</th>
			<th>Credit hours</th>
		</tr>
		<%
			while (rset2.next()) {
		%>
		<tr>
			<td align="center"><%=rset2.getString(1)%></td>
			<td align="left"><%=rset2.getString(2)%>
			<td align="center"><%=rset2.getString(3)%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<%} %>
	
	<%if(rset3 == null) {%>
		<h2 style="color:green">3. You have fulfilled required of CSCE electives (12 credits)</h2>
	<%}else{ %>	
	<h2 style="color:red">3. Please choose 3 courses required of CSCE electives (12 credits)</h2>
	<table border="1" cellpadding="5">
		<tr>
			<th>Course</th>
			<th>Semester</th>
			<th>Credit hours</th>
		</tr>
		<%
			while (rset3.next()) {
		%>
		<tr>
			<td align="center"><%=rset3.getString(1)%></td>
			<td align="left"><%=rset3.getString(2)%>
			<td align="center"><%=rset3.getString(3)%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<%} %>
	
	<%if(rset4 == null) {%>
		<h2 style="color:green">4. You have fulfilled required of CSCE supporting Math Course (12 credits)</h2>
	<%}else{ %>	
	<h2 style="color:red">4. Please complete courses required of CSCE supporting Math Course (12 credits)</h2>
	<table border="1" cellpadding="5">
		<tr>
			<th>Course</th>
			<th>Semester</th>
			<th>Credit hours</th>
		</tr>
		<%
			while (rset4.next()) {
		%>
		<tr>
			<td align="center"><%=rset4.getString(1)%></td>
			<td align="left"><%=rset4.getString(2)%>
			<td align="center"><%=rset4.getString(3)%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<%} %>


	<a href="index.jsp">Back to Main Menu</a>


</body>
</html>