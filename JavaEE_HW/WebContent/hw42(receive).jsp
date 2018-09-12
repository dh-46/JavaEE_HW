<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw42_JSP003(receive)</title>
</head>
<body>
	Welcome, <%= name %> !
</body>
</html>