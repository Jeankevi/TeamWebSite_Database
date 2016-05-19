<%@ page import="java.sql.*"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>

<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (myUtil.getConn() == null) {
%>
<jsp:forward page="openForm.jsp"></jsp:forward>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Creates a New Schedule</title>
</head>
<body>
	<jsp:include page="head.jsp" />
	<h1>Form data from createSchedule.jsp</h1>

	<%
		if (!userInfo.isStudent()) {
	%>
	The SID is:<%=request.getParameter("sid")%>
	<br>
	<%
		}
	%>

	The Schedule number is:
	<%=request.getParameter("sNum")%>
	<br> The Year plan is:
	<%=request.getParameter("yrPlan")%>
	<br> The Degree type is:
	<%=request.getParameter("type")%>
	<br>



	<%
		String sid = null;
		if (!userInfo.isStudent()) {
			sid = request.getParameter("sid");
		} else {
			sid = userInfo.getUser();
		}

		int schNum = Integer.parseInt(request.getParameter("sNum"));

		if (myUtil.validSchedule(sid, schNum) != 2) {
			userInfo.setValidSchedule(false);
	%>
	<jsp:forward page="createScheduleForm.jsp"></jsp:forward>
	<%
		} else {
			userInfo.setValidSchedule(true);
		}

		String sNum = request.getParameter("sNum");
		int yrPlan = Integer.parseInt(request.getSelectedIndex("yrPlan"));
		String type = (request.getSelectedIndex("type")).toUpperCase();
		ResultSet rset = myUtil.createSchedule(sNum, sid, yrPlan, type);
	%>

	<table border="1" cellpadding="5">
		<tr>
			<th>Schedule Number</th>
			<th>Year Plan</th>
			<th>Degree Type</th>
		</tr>
		<%
			while (rset.next()) {
		%>
		<tr>
			<td align="center"><%=rset.getInt(1)%></td>
			<td align="center"><%=rset.getInt(2)%></td>
			<td align="center"><%=rset.getString(3)%></td>
		</tr>
		<%
			}
		%>

	</table>

	<a href="index.jsp">Back to Main Menu</a>

</body>
</html>