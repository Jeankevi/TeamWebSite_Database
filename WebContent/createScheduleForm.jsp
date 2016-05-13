<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Student creates a new Schedule </title>
</head>
<body>

<h1> Student creates a new Schedule </h1>

<form action = "createSchedule.jsp" method="get">


<table>
	<tr> <td> Student ID: </td> <td> <input type="text" name="SID" value="" size="20"> </td> </tr>
	<tr> <td> Schedule Number: </td> <td> <input type="text" name="sNum" value="" size="20"> </td> </tr>
	<tr> <td> Year Plan Number: </td> <td> <input type="text" name="yrPlan" value="" size="20"> </td> </tr>
	<tr> <td> Degree Type: </td> <td> <input type="text" name="type" value="" size="20"> </td> </tr>
</table>
<input type="submit" value="Create Schedule">


</form>

</body>
</html>