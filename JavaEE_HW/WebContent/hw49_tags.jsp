<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw49_JSP_tags</title>
</head>
<body>
	<h2>hw49_JSP標籤語法</h2>
	<hr>
	<ol>
		<li>jsp:include -> 有頭有尾, 無尾自我了結XD. 位址後不可以用?帶參數; 用jsp:param帶參數</li>
		<li>不是新的功能只是語法上的簡化, 自訂標籤 : 方便好寫.</li>
		<li></li>
	</ol>
	<hr>
	<jsp:include page="hw50.jsp">
		<jsp:param value="john" name="name"/>
		<jsp:param value="49" name="age"/>
	</jsp:include>
	
</body>
</html>