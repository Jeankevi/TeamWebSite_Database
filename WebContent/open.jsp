<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session"/> 
<jsp:setProperty name="userInfo" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Process Login</title>
<style> 
</style>
</head>
<body>
<% @ include file ="head.jsp" %>
	<h1 style="color:blue;">Form Data From Login</h1>
	The user is:<%= request.getParameter("user") %>
	<br> The password is:<%="*******" %>
	<!--<br> The current value of connection is:<%= myUtil.getConn() %><br>-->

	<%
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		ResultSet rset = null;
		if (user.isEmpty() && password.isEmpty()) {%>
			<% userInfo.setValid(false);%>
			<jsp:forward page="openForm.jsp"></jsp:forward>
		<% } else {
			myUtil.openDef();
			rset = myUtil.validUser(user, password);
	}%>

	<br>
	<% if(rset.next()){ %>
		<% userInfo.setValid(true);%>
	<h2 style="color:green;">Welcome to Smart Schedule</h2>
	<p><b>
		Hi
		<%= rset.getString(4) +", " + rset.getString(3)%> </b></p>
	<p>
		Year in:
		<%= rset.getString(5) %></p>
	<p>
		Your Adviser FID:
		<%= rset.getString(6) %></p>
	<%}else{ %>
		<% userInfo.setValid(false);%>		
		<% myUtil.closeDB();%>
		<jsp:forward page="openForm.jsp"></jsp:forward>
	<%} %>
	<br>
	<a href="index.jsp">Back to Main Menu</a>


</body>
</html>