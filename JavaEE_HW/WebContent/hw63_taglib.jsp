<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 匯入下載的taglib -->
<!-- prefix 慣例: core=>c -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	//	給x值
	pageContext.setAttribute("x", 123);
%>

<!-- 帶入JavaBean -->
<jsp:useBean id="member1" class="tw.dh46.beans.Member"/>
<jsp:useBean id="member2" class="tw.dh46.beans.Member"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW63_taglib (標籤庫)</title>
</head>
<body>
	<h2>HW63_taglib (c:set)</h2>
	<hr>
	<ol>
		<!-- https://tomcat.apache.org/download-taglibs.cgi 
			三個檔案 compat/jstel/spec .jar
			-->
		<li>需下載標籤庫的jar</li>
		<li></li>
	</ol>
	<hr>
	
	<!-- c:out 輸出 => 有頭有尾, 沒內容就自我了結 -->
	<c:out value="Hello World"/><br>
	<c:out value="Hello World2"/><br>
	<!-- 結合EL => 表現邏輯 -->
	<c:out value="${x }" default="no value"/><br>
	<!-- 是字串用物件判斷 -->
	${x != null ? x : "no value" }<br>
	<hr>
	
	<!-- 用標籤語法set給單一值(字串類別): 變數名稱, 值, 存活範圍-->
	<!-- = pageContext.setAttribute("var1", 1234); -->
	<c:set var="var1" scope="page" value="1234"/>
	Var1: ${var1 }<br>
	<c:set var="var2">987</c:set>
	Var2: ${var2 }
	<hr>
	利用標籤庫set設定物件的屬性值<br>
	<!-- c:set target="該物件" property="該物件屬性名稱"-->
	<c:set target="${member1 }" property="id">007</c:set>
	<c:set target="${member1 }" property="name">James</c:set>
	
	<c:set target="${member2 }" property="id">008</c:set>
	<c:set target="${member2 }" property="name">Tony</c:set>
	
	${member1.name }<br>
	${member2.name }<br>
	
	<hr>
	c:remove 移除單一變數值<br>
	<c:remove var="var1"/>
	Var1: <c:out value="${var1 }" default="no value"/>	
	
	
</body>
</html>