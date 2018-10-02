<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW92_Request</title>
</head>
<body>
<h3>HW93_Request屬性範圍</h3>
<hr>
<%
	//	因為是sendRedirect 所以拿不到那個request
	//	request.getAttribute("test1");
	//	pageContext.setAttribute("test1", 100);
	session.setAttribute("test1", 200);	//	session要invalid或關閉瀏覽器才會消失
	application.setAttribute("test1", 300);
	
	//	結論: 注意各屬性的使用範圍, 以免使用錯誤!!
%>
default: ${test1 }<br>
page: ${pageScope.test1 }<br>
Request: ${requestScope.test1 }<br>
Session: ${sessionScope.test1 }<br>
Application: ${applicationScope.test1 }<br>

</body>
</html>