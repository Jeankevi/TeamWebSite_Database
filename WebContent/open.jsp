<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProcessOpenForm</title>
</head>
<body>
<h1>Form Data From openForm.html</h1>
	The user id:<%= request.getParameter("id") %> <br>
	The  password is:<%="*******" %> <br>
	The database is: ba367_2016 <br> 
	
	The current value of connection is:<%= myUtil.getConn() %><br>
	
	<% String id = request.getParameter("id");
	   String password = request.getParameter("password");
	   //String database = request.getParameter("db");
	   myUtil.openDef();			//replace this with openDB(user,pw,db)
	   myUtil.validUser(id, password);
	%>
	
	<br>
	After call to open(user,password,database) the database connection is:<%= myUtil.getConn() %> 
	<br>
	<a href="index.jsp">Back to Main Menu</a>
	

</body>
</html>