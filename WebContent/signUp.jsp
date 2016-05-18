<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signed In</title>
</head>
<body>
<jsp:include page="head.jsp"/>
	

	
	<h1 style="color:blue;">This is your Information</h1>
	The user is:<%= request.getParameter("user") %>
	<br> The password is:<%="*******" %>
	
	<%
		String user = request.getParameter("user");
		String passwrd = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		int yr_in = Integer.parseInt(request.getParameter("yr_in"));
		ResultSet rset = null;
		myUtil.openDef();
		rset = myUtil.createStudent(user, fname, lname, passwrd, yr_in);
	%>

	<br>
	<%if(rset.next()){ %>
		<%userInfo.setValid(true);%>
		<h2 style="color:green;">Successfully Created an Account</h2>
		<form action="openForm.jsp" method="post"><input type="submit" value="Login"></form>
		<%userInfo.reset(); 
		myUtil.closeDB(); %>	
	<%}else{ %>	
		<%userInfo.setValid(false);
		myUtil.closeDB();%>
		<jsp:forward page="signUpForm.jsp"></jsp:forward>
	<%} %>
	<br>
</body>
</html>