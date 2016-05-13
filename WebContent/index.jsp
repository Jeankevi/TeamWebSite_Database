<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<% if(myUtil.getConn() == null) {%>
<jsp:forward page="openForm.jsp"></jsp:forward>
<% }%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Menu</title>
<style> 
</style>
</head>
<body>
<jsp:include page="head.jsp"/>
<h1>Main Menu</h1>
<ol>
 
  <li> <a href = "openForm.jsp"> Login </a>  </li> 
  <li> <a href = "employeeByDeptForm.jsp">  Employees work on project controlled by (deptNum)</a>  </li>
  <li> <a href = "newAdvisorForm.jsp">  Student gets a new advisor </a>  </li>
  <li> <a href = "deleteCourseForm.jsp">  Student deletes a course from their schedule</a>  </li>
  <li> <a href = "updatePreReqForm.jsp">  Adviser updates a PreReq </a>  </li>

  <li> <a href = "matchLastNameForm.jsp">Employees that match specified last name</a>  </li> 
  <li> <a href = "close.jsp"> Close the DB </a> </li>
 

</ol>

</body>
</html>