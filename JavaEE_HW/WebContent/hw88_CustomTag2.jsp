<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/mytags.tld" prefix="dh"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW88_自訂標籤"類別"</title>
</head>
<body>
	<h3>HW88_自訂標籤"類別"</h3>
	<hr>
	<h4>MyTag1: Body-Content=empty</h4>
	<!-- 已經限定body empty 所以不能寫, 寫了會拋例外	 -->
	<dh:HelloDH/>
	<hr>
	<!-- body-content=scriptless 不能寫JSP% 也不能寫Javascript-->
	<h4>MyTag2: Body裡的字都被轉成大寫</h4>
	456自訂標籤是inline; 
	<dh:MyTag2>Yeahhhh!</dh:MyTag2>
	123
	<hr>
	<h4>MyTag3: 帶入參數</h4>
	<dh:MyTag3 itemName="Camera" price="100">I'm body1</dh:MyTag3>
	<dh:MyTag3 itemName="PC" price="150">I'm body2</dh:MyTag3>
</body>
</html>