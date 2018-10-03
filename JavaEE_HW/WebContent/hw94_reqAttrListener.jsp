<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>HW94</title>
</head>
<body>
	<%
		request.setAttribute("HW94" + (int)(Math.random()*49+1), "OK");
		request.setAttribute("name", "HW94");
	%>
</body>
</html>