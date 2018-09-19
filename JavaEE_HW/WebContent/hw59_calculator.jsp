<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW59_加減乘除 (Using EL)</title>
</head>
<body>
	<h2>HW59_加減乘除(0915AM2: EL)</h2>
	<!-- 
		後端: 商業運用最常見
		1.	後端檔案存取(E.g.檔案上傳)
		2.	處理資料庫
		結訓專題提醒:
		1.	兩人為一組
		2.	後端(資料庫/Java):前端(Android/Web)
		3.	題目要與後端產生互動(資料存取/Opendata)
		4.	不要為了展現特定技術而選擇過難的題目
		5.	做A題目可以充分展現B技術
		6.	第三方library (AR/影像辨識)
	 -->
	<hr>
	<form method="post">
		<input type="text" name="x" value="${param.x }">
		+
		<input type="text" name="y" value="${param.y }">
		<input type="submit" value="=">
		${param.x + param.y }
	</form>
</body>
</html>