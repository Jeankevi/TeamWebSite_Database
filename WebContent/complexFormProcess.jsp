<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Process complexForm.html</title>
</head>
<body>
	<h2>Data From the Complex Form</h2>
	<table>
		<tr>
			<td>Name</td>
			<td><%=request.getParameter("name_field")%></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><%=request.getParameter("addr_field")%></td>
		</tr>
		<tr>
			<td>City</td>
			<td><%=request.getParameter("city_field")%></td>
		</tr>
		<tr>
			<td>State</td>
			<td><%=request.getParameter("state_field")%></td>
		</tr>
		<tr>
			<td>Zip</td>
			<td><%=request.getParameter("zip_field")%></td>
		</tr>
	</table>

	Your favorite color is
	<%
		String favColor = request.getParameter("fav_color");
		if (favColor == null)
			out.println("unknown.");
		else if (favColor.equals("r"))
			out.println("red.");
		else if (favColor.equals("g"))
			out.println("green.");
		else if (favColor.equals("b"))
			out.println("blue.");
		else if (favColor.equals("y"))
			out.println("yellow.");
	%>
	<br> 
	
	Your pet's name is
	<%=request.getParameter("pet_name")%>.
	<br> 
	
	Your pizza will contain:
	<%
		String toppings[] = request.getParameterValues("toppings");
		if (toppings != null) {
			for (int i = 0; i < toppings.length - 1; i++)
				out.println(toppings[i] + ",");
			out.println(toppings[toppings.length - 1] + ".");
		} else {
			out.println("nothing extra!");
		}
	%>
	<br> 
	
	Your comments:
	<br>
	<div style="font-family:monospace; font-size:12">
		<%=request.getParameter("comments")%>
	</div>

</body>
</html>