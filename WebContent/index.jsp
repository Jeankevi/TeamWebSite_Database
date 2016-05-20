<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />
<% if(myUtil.getConn() == null) {%>
<jsp:forward page="openForm.jsp"></jsp:forward>
<% }%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Menu</title>
<style>
</style>
</head>
<body>
	<jsp:include page="head.jsp" />

	<h1>Main Menu</h1>
	<h1>BAREFOOT RULES</h1>

	<% 
	ResultSet rset = null;
	if(userInfo.isStudent()){
		rset = myUtil.getAllScheduleNum(userInfo.getUser());
		//ResultSet rsetSingle = myUtil.getCurrentSchedule(sid, sch_num)
	}
	%>

	<p>
		Schedule number: <select id = "sch_num" style="width: 150px;" tabindex="5" name="Tag">
			<option></option>
			<% while (rset.next()) {%>
			<option value = "<%= rset.getString(1) %>" select = "sch_num" ><%= rset.getString(1) %></option>
			<%}%>

		</select> <input type="submit" value="View">
	</p>


</body>
</html>