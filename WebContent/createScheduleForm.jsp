<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session"/> 
<% if(myUtil.getConn() == null){%>
	<jsp:forward page="openForm.jsp"></jsp:forward>
<% }%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp" />
<title> Student creates a new Schedule </title>
</head>
<body>
<h1> Student creates a new Schedule </h1>
<%if(!userInfo.isValidSchedule()){ %>
	<h2 style="color: red;">Error Message</h2>
	<p style="color: red;">Invalid SID or Schedule Number Already Exists or Schedule Number Must be Between 1 and 9</p>
<%} %>

<form action = "createSchedule.jsp" method="post">



<table>
	<%if(!userInfo.isStudent()){ %>
		<tr> <td> Student ID: </td> <td> <input type="number" name="sid" value="" size="20" required> </td> </tr>
	<%} %>
	<tr> <td> Schedule Number: </td> <td> <input type="number" name="sNum" value="" size="20" required> </td> </tr>
	
	

	<tr> <td> Year Plan Number: </td> <td>    
		<select name = "yrPlan">
		  <option value="2" selected = "yrPlan">2</option>
		  <option value="4" selected = "yrPlan">4</option>
		</select>
	</td> </tr>
	
	
	<tr> <td> Degree Type: </td> <td>
		<select name = "type">
  			<option value="BA" selected = "type">BA</option>
  			<option value="BS" selected = "type" >BS</option>
		</select>
	</td> </tr>
	
	
</table>
<input type="submit" value="Create Schedule">



</form>

</body>
</html>