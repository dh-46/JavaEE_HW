<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw53_JSP_tags:forward</title>
</head>
<body>
	<h2>hw53_JSP_tags:forward</h2>
	<hr>
	<ol>
		<li>jsp:forward</li>
		<li>從application中(最大層級)取得</li>
	</ol>
	<hr>
	<jsp:forward page="hw54_forward.jsp">
		<jsp:param value="12" name="x"/>
		<jsp:param value="21" name="y"/>
	</jsp:forward>
</body>
</html>