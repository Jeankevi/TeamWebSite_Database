<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LogOut</title>
<style> 
</style>
</head>
<body>
	<jsp:include page="head.jsp" />
	<% myUtil.closeDB(); %>
	<h1 style="color: blue;">Successfully LogOut</h1>
	<a href="index.jsp">Back to Home</a>


</body>
</html>