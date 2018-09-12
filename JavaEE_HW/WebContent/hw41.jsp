<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW41_JSP002 (變數使用範圍)</title>
</head>
<body>
	<h1>HW41_JSP002</h1>
	<hr>
	<p>
		%!: 代表static<br>
		當b列設為static後, 重新整理時b++成功.<br>
		JSP會變成servlet的物件實體, a是該物件的屬性, 但是每次reload都會重新宣告a=10;<br>
		但是b已經宣告static屬性, 屬於該類別(整體性的), 所以每次reload都會b++成功.
	</p>
	<% int a = 10; %>
	<%! int b = 10; %>
	a = <%= a++ %><br>
	b = <%= b++ %><br>
</body>
</html>