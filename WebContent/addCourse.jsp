<%@ page import="java.sql.*"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />
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
	<%=request.getParameter("Tag")%>
	<br> The Department is:
	<%=request.getParameter("dept")%>
	<br> The Course Number is:
	<%=request.getParameter("cNum")%>
	<br>In this semester:
	<%=request.getParameter("sem")%>
	<br>In this year:
	<%=request.getParameter("year")%>
	<br>

	<%
		String sid = null;
		if (!userInfo.isStudent()) {
			sid = request.getParameter("sid");
		} else {
			sid = userInfo.getUser();
		}

		String sNum = request.getParameter("Tag");
		System.out.println("This is sNum from addCourse: "+sNum);
		int cNum = Integer.parseInt(request.getParameter("cNum"));
		String dept = (request.getParameter("dept")).toUpperCase();
		String sem = (request.getParameter("sem")).toUpperCase();
		int year = Integer.parseInt(request.getParameter("year"));
		
		int temp = myUtil.validCourse(dept, cNum, sid, sNum);
		
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
		
		ResultSet rset = myUtil.addCourse(sid, sNum, dept, cNum, sem, year);
	%>

	<table border="1" cellpadding="5">
		<tr>
			<th>Year</th>
			<th>Semester</th>
			<th>Department</th>
			<th>Course Number</th>
			
		</tr>
		<%while (rset.next()) {%>
		<tr>
			<td align="center"><%=rset.getInt(1)%></td>
			<td align="center"><%=rset.getString(2)%></td>
			<td align="center"><%=rset.getString(3)%></td>
			<td align="center"><%=rset.getInt(4)%></td>
		</tr>
		<%}%>

	</table>

	<a href="addCourseForm.jsp">Add Another Course</a>
	<a href="index.jsp">Back to Main Menu</a>

</body>
</html>