<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw58: EL $</title>
</head>
<body>
	<h2>HW58: EL (加減乘除取餘數)</h2>
	<!-- 網頁參數(不論數字或字串)傳遞都是字串 -->
	<!-- 前面字串相加 後面為數學相加 
		(預設會自動轉換成數字運算,
			因此如果參數輸入文字後面會有NumberformatException)-->
	<!-- 運算不論整數或浮點數會自行轉換 -->	
	<hr>
	${param.x } + ${param.y } = ${param.x + param.y }
	<hr>
	${param.x } - ${param.y } = ${param.x - param.y }
	<hr>
	${param.x } * ${param.y } = ${param.x * param.y }
	<hr>
	${param.x } / ${param.y } = ${param.x / param.y }
	<hr>
	${param.x } % ${param.y } = ${param.x % param.y }
</body>
</html>