<%@ page import="java.sql.*"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student gets a new Adviser</title>
</head>
<body>
<h1>Form date from newAdviserForm.jsp </h1>

The SID is:<%= request.getParameter("user") %> <br>
	The FID is: <%=request.getParameter("fid") %> <br>

	

	
	<% String sid = request.getParameter("user");

	   String fid = request.getParameter("fid");
	   
	   ResultSet rset = myUtil.newAdviser(fid,sid);
	   
	%> 
	
	<table>
		<tr>
			<td>Student ID </td>
			<td>Student's new Adviser ID </td>
		
			
		</tr>
		
		
		<%
			while (rset.next()) {
			out.println("<tr>");
			out.println("<td>" + rset.getString(1) + "</td>");
			out.println("<td>" + rset.getString(2) + "</td>");
			out.println("</tr>");
			}
		%>
		
	</table>
	
  <a href="index.jsp">Back to Main Menu</a>

</body>
</html>