<%@page import="tw.dh46.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = new Member();
	member.setId("01");
	member.setName("John");
%>

<!-- JSP: 盡量不寫java 以提升程式維護性 -->
<!-- 1. 	以下改用標籤語法  2.	物件變數為id所設定 -->
<!-- useBean: 1. id是必要屬性(物件的變數名稱)	2. class 物件屬於哪個類別 -->
<!-- useBean 就是產生該物件的物件實體, 設定在jsp中其id為member (建構式:無傳參數)-->
<jsp:useBean id="member2" class="tw.dh46.beans.Member"></jsp:useBean>

<!-- 
setProperty: 
	property: 物件裡的甚麼屬性
	value: 屬性的值
	name: 是指哪一個物件
-->
<jsp:setProperty property="id" name="member2" value="002"/>
<jsp:setProperty property="name" name="member2" value="Allen"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW55_Beans</title>
</head>
<body>
	<h1>HW55_JavaBeans (20180915AM1)</h1>
	<hr>
	<h4>使用百分比符號</h4>
	Hello, <%= member.getName() %>!<br>
	<hr>
	<h4>使用JSP Tags</h4>
	Hello, <jsp:getProperty property="name" name="member2" />! <br>
	Your id is <jsp:getProperty property="id" name="member2"/>
</body>
</html>