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


The user is:<%= request.getParameter("user") %>
The Course Num is:<%= request.getParameter("crsnum") %> <br>
	The Dept name is: <%=request.getParameter("dept") %> <br>
	The Schedule Num is: <%=request.getParameter("schnum") %> <br>
	SID is: <%=request.getParameter("sid") %> <br>
	

	
	 
	
	<% String crsnum = request.getParameter("crsnum");
	  
	   
	   String dept = request.getParameter("dept");
	   
	   int schnum = Integer.parseInt(request.getParameter("schnum"));
	   
	   String user = request.getParameter("user");

	   
	   String test = myUtil.deleteCourse(schnum,crsnum,dept, user);
	   
	%> 
		<p><%= test %> </p>
		
		if(myUtil.getconn == null){
		
		  <a href="openForm.jsp">Back to Main Menu</a>
		
		}
		
		
		  <a href="index.jsp">Back to Main Menu</a>	

	
	


</body>
</html>