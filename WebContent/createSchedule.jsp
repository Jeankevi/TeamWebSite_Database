<%@ page import="java.sql.*" %>
<jsp:useBean id="dbUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Creates a New Schedule</title>
</head>
<body>
<jsp:include page="head.jsp" />
<h1>Form data from createSchedule.jsp</h1>

The SID is:<%=request.getParameter("sid") %> <br>
The Schedule number is: <%=request.getParameter("sNum") %> <br>
The Year plan is:  <%=request.getParameter("yrPlan") %> <br>
The Degree type is: <%=request.getParameter("type") %> <br>


	<%	
	
		String sid = request.getParameter("sid");
	
		String sNum = request.getParameter("sNum");
	
		int yrPlan = Integer.parseInt(request.getParameter("yrPlan"));
		
		String type = request.getParameter("type");
	
		ResultSet rset = dbUtil.createSchedule(sNum, sid, yrPlan, type);
	%>
	
	<table>
		<tr>
			<td>Schedule Number</td>
			<td>Year Plan Number</td>
			<td>Degree Type</td>
		</tr>
		
		<%	while(rset.next()){ 
			out.println("<tr>");
			out.println("<td>" + rset.getString(1) + "</td>");
			out.println("<td>" + rset.getString(2) + "</td>");
			out.println("<td>" + rset.getInt(1) + "</td>");
			out.println("<td>" + rset.getString(3) + "</td>");
			out.println("</tr>");
			}
		%>
	</table>
	
	<a href="index.jsp">Back to Main Menu</a>

	
</body>
</html>