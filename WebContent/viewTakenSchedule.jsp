<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />
<%if (myUtil.getConn() == null) {%>
<jsp:forward page="openForm.jsp"></jsp:forward>
<%}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Schedule</title>
</head>
<body>
<jsp:include page="head.jsp"/>

	<h1>Main Menu</h1>
	<h1>BAREFOOT RULES</h1>
	
	<%
	int sch_num = Integer.parseInt(request.getParameter("sch_num")); 
	ResultSet rset = myUtil.getCurrentSchedule(userInfo.getUser(), sch_num);
	%>
	
	<table border="1" cellpadding="5">
				<tr>
					<th>Course</th>
					<th>Semester</th>
					<th>Year</th>
					<th>Grade</th>
				</tr>
		<%
			while (rset.next()) {
		%>
			<tr>
				<td align="center"><%=rset.getString(1)%></td>
				<td align="center"><%=rset.getString(2)%></td>
				<td align="center"><%=rset.getString(3)%></td>
				<td align="center"><%=rset.getString(4)%></td>
			</tr>
		<%}%>
	</table>
	
	<a href="index.jsp">Back to Main Menu</a>

</body>
</html>