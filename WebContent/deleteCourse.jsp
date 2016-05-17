<%@ page import="java.sql.*"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session"/> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% if(myUtil.getConn() == null) {%>
	<jsp:forward page="openForm.jsp"></jsp:forward>
	<% }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp" />
<title>Student deletes a course from their schedule</title>
</head>
<body>
<jsp:include page="head.jsp" />
<h1>Process Deleting Course</h1>


	The Course Num is:<%= request.getParameter("crsnum") %> <br>

	The Dept name is: <%=request.getParameter("dept") %> <br>
	The Schedule Num is: <%=request.getParameter("schnum") %> <br>
	<%if(!userInfo.isStudent()){ %>
		SID is: <%=request.getParameter("sid") %> <br>
	<%} %>

	
	
	<% String crsnum = request.getParameter("crsnum");	   
	   String dept = request.getParameter("dept");	   
	   int schnum = Integer.parseInt(request.getParameter("schnum"));
	   String user = "";
	   if(!userInfo.isStudent()){
		   user = request.getParameter("sid");
	   }else{
		   user = userInfo.getUser();
	   }
	   int success = myUtil.deleteCourse(schnum,crsnum,dept, user);	   
	%> 
	<%if(success > 0){ %>
		<p style="color:green";><b>The course was deleted</b></p>
	<%}else{ %>
		<p style="color:red";><b>The course was not deleted, or the course is not there!</b></p>
	<%} %>
	<a href="index.jsp">Back to Main Menu</a>	
		  
		  
</body>
</html>