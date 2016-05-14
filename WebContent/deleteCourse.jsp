<%@ page import="java.sql.*"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student deletes a course from their schedule</title>
</head>
<body>
<jsp:include page="head.jsp" />
<h1>Form date from deleteCourseForm.jsp </h1>

    The Course Num is:<%= request.getParameter("crsnum") %> <br>
	The Dept name is: <%=request.getParameter("dept") %> <br>
	The Schedule Num is: <%=request.getParameter("schnum") %> <br>
	SID is: <%=request.getParameter("sid") %> <br>
	

	
	<% 
	
	   int crsnum = Integer.parseInt(request.getParameter("crsnum"));
	  	   
	   String dept = request.getParameter("dept");
	   
	   String schnum = request.getParameter("schnum");
	   String sid = request.getParameter("schnum");
	   
	   myUtil.deleteCourse(crsnum,dept,schnum,sid);
	   
	%> 
	

	
	


</body>
</html>