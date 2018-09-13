<%@page import="tw.dh46.jeehw.HWMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw52_JSP_存取物件</title>
</head>
<body>
	<h2>hw52_JSP_%物件存取</h2>
	<hr>
	<ol>
		<li>取得hw51頁面產生的HWMember物件實體</li>
		<li>從application中(最大層級)取得</li>
	</ol>
	<hr>
	<%	
		//	從application 取得 member物件實體
		HWMember member = (HWMember)application.getAttribute("member");
		out.println(member.getName() + " : " + member.getAccount());
	%>
</body>
</html>