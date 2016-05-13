<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluate Schedule</title>
</head>
<body>
<h1>Evaluate Schedule </h1>

The Student ID is: <%=request.getParameter("sid") %> <br>
The Schedule Number is: <%=request.getParameter("schNum") %> <br>


<%

String sid = request.getParameter("sid");
int schNum = Integer.parseInt(request.getParameter("schNum"));

ResultSet rset1 = myUtil.scheduleEval1(schNum);
ResultSet rset2 = myUtil.scheduleEval2(schNum);
ResultSet rset3 = myUtil.scheduleEval3(schNum);

%>


 <a href="index.jsp">Back to Main Menu</a>	
 
 
</body>
</html>