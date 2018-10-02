<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 先檢查是否帶有HW902種的session.attribute("account"), 沒有也沒必要繼續	 -->
<%
	if (session.getAttribute("account") == null) {
		response.sendRedirect("hw892_login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW912_0929AM2 Login View</title>
</head>
<body>
	<h2>DH Corporation</h2>
	<hr>
	<!-- 注意attribute會由範圍小抓到大!!	這邊抓到的是sessionScope的	 -->
	<!-- 如何指定層級複習: sessionScope.account (pageScope/requestScope/ sessionScope/ applicationScope => hw62_data)	-->
	Welcome, ${account };
	<a href="hw91_logout.jsp">Logout Link</a>
</body>
</html>