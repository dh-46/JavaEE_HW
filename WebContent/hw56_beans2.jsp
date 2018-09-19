<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- EL (Expression Language) : ${ EL }	-->
 <!-- 補充: jQuery中的$其實是一個變數名稱 -->
 
 <!-- 
 	jsp 在伺服器的運作原理
 		=> 伺服器看到附檔名為XX 會先做處理
 		=> 例如JSP置換成servlet=>engine處理完後再傳回給用戶端
 	
 	補充: 網際網路中的傳遞都是字串, 記得雙引號或單引號處理
  -->
<%--
	JSP 註解方法
	快捷鍵: Ctrl + Shift + /
 --%>
 
<jsp:useBean id="member" class="tw.dh46.beans.Member"/>
<jsp:setProperty property="id" name="member" value="${param.id }"/>
<jsp:setProperty property="name" name="member" value="${param.name }"/>

<!-- 
JavaBean
	要有setProp才可get否則為null
	html註解僅針對html tags有效 jsp tags無效
	沒給參數的情況下 顯示空白
	參數透過網址列傳送(同get)
 -->

<!-- 建議盡量不寫百分比式的jsp => 維護性不高	-->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW56_JavaBeans2 & EL (20180915AM1)</title>
</head>
<body>
	<h1>HW56_JavaBeans2 & EL (20180915AM1)</h1>
	<hr>
	Hello, <jsp:getProperty property="name" name="member"/>!<br> 
	<!-- getProperty 其實是去呼叫該物件的getter,setter -->
	Your id is <jsp:getProperty property="id" name="member"/>. <br>
	<!-- param: EL中產生的隱含物件 -->
	<hr>
	ID: ${param.id } Name: ${param.name }
</body>
</html>