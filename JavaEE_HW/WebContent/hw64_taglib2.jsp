<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW64_taglib2 (例外處理)</title>
</head>
<body>
	<h2>HW64_taglib2 (c:catch)</h2>
	<hr>
		<!-- 捕捉例外 -->
		<c:catch var="errormsg">
			<%
			String num = request.getParameter("x");
			int x = Integer.parseInt(num);
			out.println(x);
			%>
		</c:catch>
		Hello, world!<br>
		<!-- 利用EL印出捕捉的例外 -->
		${errormsg }
	<hr>
</body>
</html>