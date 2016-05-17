<%@ page import="java.sql.*"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />

<% if(myUtil.getConn() == null) {%>
	<jsp:forward page="openForm.jsp"></jsp:forward>
<% }%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student gets a new Adviser</title>
</head>
<body>
<jsp:include page="head.jsp" />
<h1>Process Adding New Advisor</h1>

	<p>The SID is: <%= request.getParameter("user") %></p>
	<p>The FID is: <%=request.getParameter("fid") %></p>

	<% String sid = request.getParameter("user");
	   String fid = request.getParameter("fid");
	   ResultSet rset = null;
	   rset = myUtil.newAdviser(fid,sid);
	%> 
	
	<% if(rset != null){ %>
		<%userInfo.setAddNewAdviser(true); %>
		<h2 style="color:green;">Successful Updated new advisor for student</h2>
	<%} else {%>
		<%userInfo.setAddNewAdviser(false); %>
		<jsp:forward page="newAdvisorForm.jsp"></jsp:forward>
	<%} %>
	
	<!-- <table>
		<tr>
			<td>Student ID </td>
			<td>Student's new Adviser ID </td>
		
			
		</tr>

		<%
			if(rset.next()) {
			out.println("<tr>");
			out.println("<td>" + rset.getString(1) + "</td>");
			out.println("<td>" + rset.getString(2) + "</td>");
			out.println("</tr>");
			}
		%>
		</table>
		
	-->
	
	


</body>
</html>