<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW_RememberMe(帳號登入)</title>
</head>
<body>
	<h2>HW_RememberMe(帳號登入)</h2>
	<hr>
	<form action="HW_RememberMe" method="get">
		Account: <input type="text" name="account">
		Password: <input type="password" name="password">
		<input type="submit" value="Login">
		Remember Me <input type="checkbox" name="remember" value="true" checked>
	</form>
</body>
</html>