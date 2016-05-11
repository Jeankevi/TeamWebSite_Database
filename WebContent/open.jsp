<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProcessOpenForm</title>
<style> 
</style>
</head>
<body>
<%@ include file="head.jsp" %>
	<h1 style="color:blue;">Form Data From Login</h1>
	The user is:<%= request.getParameter("user") %>
	<br> The password is:<%="*******" %>
	<!--<br> The current value of connection is:<%= myUtil.getConn() %><br>-->
	
	<% String user = request.getParameter("user");
	   String password = request.getParameter("password");
	   myUtil.openDef();
	   ResultSet rset = myUtil.validUser(user, password);
	%>

	<br>
	<% if(rset.next()){ %>
	<h2 style="color:green;">Welcome to Smart Schedule</h2>
	<p><b>
		Hi
		<%= rset.getString(4) +", " + rset.getString(3)%> </b></p>
		<input type="text" name="name" value= <%= rset.getString(4)%> size="20">
	<p>
		Year in:
		<%= rset.getString(5) %></p>
	<p>
		Your Adviser FID:
		<%= rset.getString(6) %></p>
	<%}else{ %>
	<h2 style="color:red;">Error Message</h2>
	<p>Invalid user id and password. Please try again</p>
	myUtil.closeDB();
	<jsp:forward page="openForm.jsp"></jsp:forward>
	<%} %>
	<br>
	<a href="index.jsp">Back to Main Menu</a>


</body>
</html>