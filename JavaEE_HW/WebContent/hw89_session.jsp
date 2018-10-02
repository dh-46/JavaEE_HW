<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW89_Session (0929AM2)</title>
</head>
<body>
	<%
		String sessionId = session.getId();
		out.print("Session ID: " + sessionId + "<br>");
		//	同一瀏覽器每次連線配發的sessionID是相同的
		//	不同瀏覽器拿到的就不同
		
		//	Session物件實體是否為新產生的
		//	瀏覽器關掉後重新連線的第一次會是true, 之後reload都是false =>
		//	可用於判別用戶是否為第一次上線
		out.print("Session Is New?: " + session.isNew());
		
		//	session帶的資料
		session.setAttribute("Key1", "Value1");
		session.setAttribute("Key2", "Value2");
	%>
</body>
</html>