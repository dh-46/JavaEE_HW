<%@page import="tw.dh46.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 百分比@ import改寫成jsp標籤jsp:directive (不鼓勵這樣寫)-->

<%-- <jsp:directive.page import="tw.dh46.beans.Member"/>  --%>

<%
	Member member = new Member("James", "007");
%>

<%-- JSTL: Java Scriptlet Tag Library 
	老師個人不推薦 XD 
--%>
<%-- JSP 宣告 --%>
<jsp:declaration>
	int i;
	String name;
</jsp:declaration>

<%-- JSP 邏輯運算 --%>
<jsp:scriptlet>
	i = 10;
	name = "iii";
</jsp:scriptlet>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW57: JSTL Tags (20180918AM1)</title>
</head>
<body>
	<h1>HW57: JSTL Tags (標籤函式庫)</h1>
	<hr>
	Welcome, <%= member.getName() %>!
	<hr>
	Member = <jsp:expression>member</jsp:expression>
	<hr>
	i = <jsp:expression>i</jsp:expression>
	<hr>
	name = <jsp:expression>name</jsp:expression>
	<!-- Expression 相較之下直接寫百分比好像更不錯? 但是仍要了解其用法 -->
</body>
</html>