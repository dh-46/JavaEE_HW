<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW91_SessionLogout</title>
</head>
<body>
<%
	//	讓session失效
	session.invalidate();
	
	//response.sendRedirect("hw89_session.jsp");
	
	//	配合HW892/912/902
	response.sendRedirect("hw892_login.jsp");
%>
</body>
</html>