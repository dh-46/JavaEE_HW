<%@page import="tw.dh46.jeehw.HWMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw51_JSP_存取物件</title>
</head>
<body>
	<h2>hw51_JSP_%物件存取</h2>
	<hr>
	<ol>
		<li>在本頁面產生HWMember物件實體</li>
		<li>把產生的物件放到application中(最大層級)</li>
	</ol>
	<hr>
	<%
		//	物件目前是區域變數
		HWMember member = new HWMember("John", 18, "john123");
		//	把這個頁面產生的物件實體放到application中. (記得application的層級是最大的)
		application.setAttribute("member", member);
	%>
	
</body>
</html>