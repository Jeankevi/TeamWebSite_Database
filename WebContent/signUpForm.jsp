<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session"/> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up As Student</title>
</head>
<body>
<jsp:include page="head.jsp" />
	<h1>Sign Up</h1>

	<%if(userInfo.isValid()) {%>
		<h2 style="color: red;">Error Message</h2>
		<p style="color: red;">You are already signed up as a student</p>
	<%}	%>

	<form action="signUp.jsp" method="post">
		<table>
			<tr>
				<td>User ID:</td>
				<td><input type="text" name="user" value="<%= userInfo.getUser()%>" size="20" required>
				</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" value="" size="20" required>
				</td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="fname" value="" size="20" required>
				</td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lname" value="" size="20" required>
				</td>
			</tr>
			<tr>
				<td>Start Year:</td>
				<td><input type="text" name="yr_in" value="" size="20" required>
				</td>
			</tr>

		</table>
		<input type="submit" value="Sign Up">
	</form>
</body>
</html>