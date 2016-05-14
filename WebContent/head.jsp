<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #e7e7e7;
    background-color: #f3f3f3;
    top: 0;
    width: 100%;
}

li {
	float: left;
	border-right:1px solid #bbb;
}

li a {
	display: block;
	color: #666;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
li a:hover:not(.active ) {
	background-color: #ddd;
}

.menu li.active {
	color: white;
	background-color: #4CAF50;
}

.menu li.last a {
    text-align: center;
    float: right;
}

</style>
</head>
<body>
	<ul class = "menu">
		<li><a href="index.jsp">Home</a></li>
	
		<li> <a href = "createScheduleForm.jsp">Create Schedule</a></li>
	    <li> <a href = "newAdvisorForm.jsp">Add New Advisor</a></li>
	    <li> <a href = "deleteCourseForm.jsp">Deletes a Course</a></li>
	    <li> <a href = "updatePreReqForm.jsp">Updates PreReq</a></li>
		<% if(myUtil.getConn() != null) {%>
		  <li style="float:right; border-left:1px solid #bbb"><a href="logOut.jsp">LogOut</a></li>
		<% } else {%>
		  <li style="float:right; border-left:1px solid #bbb"><a href="openForm.jsp">Login</a></li>
		<%} %>
	</ul>

	<script type="text/javascript">
		var make_button_active = function() {
			//Get item siblings
			var siblings = ($(this).siblings());

			//Remove active class on all buttons
			siblings.each(function(index) {
				$(this).removeClass('active');
			})

			//Add the clicked button class
			$(this).addClass('active');
		}

		//Attach events to menu
		$(document).ready(function() {
			$(".menu li").click(make_button_active);
		})
	</script>
</body>
</html>