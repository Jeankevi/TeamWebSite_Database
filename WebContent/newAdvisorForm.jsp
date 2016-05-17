<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<% if(myUtil.getConn() == null){%>
	<jsp:forward page="openForm.jsp"></jsp:forward>
<% }%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<jsp:include page="head.jsp" />
<title> Student gets a new Adviser </title>

</head>
<body>
	<jsp:include page="head.jsp" />
	<h1>Student gets a new Adviser</h1>

	<%if(!userInfo.isAddNewAdviser()){ %>
		<h2 style="color:red;">Error Message</h2>
		<p style="color:red;">Student or Faculty might not exist</p>
	<%} %>

	<form action="newAdvisor.jsp" method="get">
		<table>

			<tr>
				<td>Student ID:</td>
				<td><input type="text" name="user" value="" size="20" required>
				</td>
			</tr>
			<tr>
				<td>Student's new Adviser's ID number:</td>
				<td><input type="text" name="fid" value="" size="20" required>
				</td>
			</tr>


		</table>
		<input type="submit" value="Add Adviser">
	</form>

</body>
</html>