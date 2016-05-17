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
<jsp:include page="head.jsp"/>
	<h1 style="color:blue;">Form Data From Login</h1>
	The user is:<%= request.getParameter("user") %>
	<br> The password is:<%="*******" %>
	
	<%
	if(myUtil.getConn() == null){
		myUtil.openDef();%>
		<jsp:forward page="open.jsp"></jsp:forward>
	<%}%>	

	<%
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		ResultSet rset = null;
		rset = myUtil.validUser(user, password);
	%>

	<br>
	<%if(rset.next()){ %>
	<% userInfo.setValid(true);%>
	
	<h2 style="color:green;">Welcome to Smart Schedule</h2>
	
	<%ResultSetMetaData rsmd = rset.getMetaData(); %>
		<% if(rsmd.getColumnCount() > 4){ %>
			<% userInfo.setStudent(true); %>
			<p><b>		
				<%= rset.getString(4) +", " + rset.getString(3)%></b>
			<p>
				Year in:
				<%= rset.getString(5) %></p>
			<p>
				Your Adviser FID:
				<%= rset.getString(6) %></p>
		<%}else{ %>
			<% userInfo.setStudent(false); %>
			<P><b>Hi Professor</b></P>
			<p><b>		
				<%= rset.getString(3) +", " + rset.getString(2)%></b></p>
		<%} %>
			
	<%}else{ %>
		<% userInfo.setValid(false);	
		   myUtil.closeDB();
		   System.out.println("Invalid User Data");%>
		<jsp:forward page="openForm.jsp"></jsp:forward>
	<%} %>
	<br>
	<a href="index.jsp">Back to Main Menu</a>

</body>
</html>