<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW90_getSession (0929AM2)</title>
</head>
<body>
<%
	if (session.getAttribute("Key1") == null) {
		response.sendRedirect("hw89_session.jsp");
		return;
	}
	//	將session中的值取出
	String key1 = (String)session.getAttribute("Key1");
	String key2 = (String)session.getAttribute("Key2");
	String key3 = (String)session.getAttribute("Key3");
	
	out.println(key1 +  " : " + key2 + " : " + key3);
	
	//	與Servlet的差別	=> JSP有隱含物件, servlet要自己抓
%>
</body>
</html>