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
<jsp:include page ="head.jsp" />
<h1>Main Menu</h1>
<ol>
 
  <li> <a href = "openForm.jsp"> Login </a>  </li> 
  <li> <a href = "employeeByDeptForm.jsp">  Employees work on project controlled by (deptNum)</a>  </li>
  <li> <a href = "newAdvisor.jsp">  Student gets a new advisor </a>  </li>
  <li> <a href = "deleteCourse.jsp">  Student deletes a course from their schedule</a>  </li>
  <li> <a href = "notDone.jsp">  Employees that do not work on any project</a>  </li>
  <li> <a href = "notDone.jsp">  Insert into works_on one tuples(essn, pno, hr) - extra credit</a> </li>
  <li> <a href = "updateHoursWorkOnForm.jsp">  Update works_on add more hours to tuple (essn, pno, hr)</a> </li>  
  <li> <a href = "deleteEmployeeWorkOnForm.jsp">  Delete one tuple from works_on with (essn, pno) </a>  </li>
  <li> <a href = "addNewDeptLocationForm.jsp">  Add new department location(dnum, location) </a>  </li>
  
  <li> <a href = "matchLastNameForm.jsp">Employees that match specified last name</a>  </li> 
  <li> <a href = "close.jsp"> Close the DB </a> </li>
 

</ol>

</body>
</html>