<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw46_JSP006 (處理hw45的例外)</title>
</head>
<body>
	I'm 46. <br>
	Error:
	<%
		out.println(exception);
	%>
</body>
</html>