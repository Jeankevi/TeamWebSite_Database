<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Raise</title>
</head>
<body>
<h1>Employees with last name that starts with <%=request.getParameter("matchLast") %></h1>
  <%  String target = request.getParameter("matchLast");
      ResultSet r ;//= myUtil.matchLastName(target);
  %>
  <table border="1" cellpadding="5">
   <tr> <th>Dept Number</th> <th>LastName, FirstName</th></tr>
   <% while(r.next()){ %>
     <tr>
        <td align="center"><%= r.getString(1) %></td>
        <td align="left"><%= r.getString(2) + ", " +  r.getString(3)%></td>           
   <%} %>  
  </table>
  
  <a href="index.jsp">Back to Main Menu</a>

</body>
</html>