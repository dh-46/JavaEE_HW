<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String account = request.getParameter("account");
	String password = request.getParameter("password");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW_Ajax13</title>
</head>
<body>
	<h3>I'm Ajax13!</h3>
	Account: <%= account %><br>
	Password: <%= password %>
</body>
</html>