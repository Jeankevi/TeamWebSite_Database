<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="myUtil" class="dbUtil.Utilities" scope="session"></jsp:useBean>
    <jsp:useBean id="userInfo" class="dbUtil.UserData" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="head.jsp" />
<title>Update PreReq</title>
</head>
<body>
<h1></h1>

		The Department of the Course to be deleted:<%= request.getParameter("oDept") %> <br>
		The course number to be deleted: <%=request.getParameter("oNum") %> <br> <br>
	
		The Department of the course with the PreReq to be updated: <%=request.getParameter("cDept") %> <br>
		The Course number of the PreReq to be updated: <%=request.getParameter("cNum") %> <br> <br>
		
		The Department of the new PreReq is: <%=request.getParameter("nDept") %> <br>
		The Course number of the new PreReq is: <%=request.getParameter("nNum") %> <br>
	

	
	<% String oDept = request.getParameter("oDept");
	   String oNum  = request.getParameter("oNum");
	
	   String cDept = request.getParameter("cDept");
	   String cNum = request.getParameter("cNum");
	   
	   String nDept = request.getParameter("nDept");
	   String nNum = request.getParameter("nNum");

	   String test = "";
	   if(myUtil.validDept(oDept,oNum) > 0 && myUtil.validDept(cDept,cNum) > 0 && myUtil.validDept(nDept,nNum) > 0){
		   userInfo.setValidSchedule(true);
		   test = myUtil.updatePreReq(oNum, oDept, nNum, nDept, cNum, cDept);
		}else{%>
			<% userInfo.setValidDept(false);%>
			<jsp:forward page="updatePreReqForm.jsp"></jsp:forward>
			
		<%} %>
	
	
		<h2 style = "color:blue"><%= test %> </h2>

 		<a href="index.jsp">Back to Main Menu</a>	

</body>
</html>