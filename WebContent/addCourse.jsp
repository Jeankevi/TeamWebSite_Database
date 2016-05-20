<%@ page import="java.sql.*"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%if (myUtil.getConn() == null) {%>
<jsp:forward page="openForm.jsp"></jsp:forward>
<%}%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course Added</title>
</head>
<body>
	<jsp:include page="head.jsp" />
	<h1>Form data from addCourse.jsp</h1>

	<%if (!userInfo.isStudent()) {%>
	The SID is:<%=request.getParameter("sid")%>
	<br>
	<%}%>

	The Schedule number is:
	<%=request.getParameter("sNum")%>
	<br> The Department is:
	<%=request.getParameter("dept")%>
	<br> The Course Number is:
	<%=request.getParameter("cNum")%>
	<br>In this semester is:
	<%=request.getParameter("sem")%>
	<br>In this year is:
	<%=request.getParameter("year")%>
	<br>



	<%
		String sid = null;
		if (!userInfo.isStudent()) {
			sid = request.getParameter("sid");
		} else {
			sid = userInfo.getUser();
		}

		int schNum = Integer.parseInt(request.getParameter("sNum"));

				
		String sNum = request.getParameter("sNum");
		int cNum = Integer.parseInt(request.getParameter("cNum"));
		String dept = (request.getParameter("dept")).toUpperCase();
		int temp = myUtil.validCourse(dept, cNum, sid, schNum);
		
		if (temp != 1) {
			if(temp == -1){
				userInfo.setValidSchedule(false);
				%><jsp:forward page="addCourseForm.jsp"></jsp:forward><%
			}
			else if(temp == 0){
				userInfo.setValidCourse(false);
				%><jsp:forward page="addCourseForm.jsp"></jsp:forward><%
			}
		} else {
			userInfo.setValidCourse(true);
		}
		
		ResultSet rset = myUtil.addCourse(sNum, sid, dept, cNum);
	%>

	<table border="1" cellpadding="5">
		<tr>
			<th>Schedule Number</th>
			<th>Department</th>
			<th>Course Number</th>
		</tr>
		<%while (rset.next()) {%>
		<tr>
			<td align="center"><%=rset.getInt(1)%></td>
			<td align="center"><%=rset.getInt(2)%></td>
			<td align="center"><%=rset.getString(3)%></td>
		</tr>
		<%}%>

	</table>

	<a href="index.jsp">Back to Main Menu</a>

</body>
</html>