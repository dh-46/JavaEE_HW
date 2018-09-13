<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 4. 指定hw46是處理錯誤的頁面, 46會得到例外的物件實體, 46也要對外宣稱	 -->
<%@ page errorPage="hw46.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw45_JSP005_例外處理</title>
</head>
<body>
	<%
		//int a = 10, b = 0;
		//try {
		//	out.println(a/b);
		//} catch (Exception e) {
			//	1. 印出錯誤
			//	out.println("Error");
			//	2. 顯示Server錯誤頁面
			//	response.sendError(HttpServletResponse.SC_CONFLICT, "Server busy");
			//	3. 轉向指定的頁面
			//	response.sendRedirect("hw46.jsp");
		//}
		
		int a = 10, b = 0;
		out.println(a/b);
		
	%>
</body>
</html>