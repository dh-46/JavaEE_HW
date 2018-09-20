<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!-- 先判斷是否有帶editid參數, 沒參數的不能修改 & 修改的內容不得為空 -->
<c:if test="${empty param.editid }">
	<!-- 趕走 -->
	<c:redirect url="hw69_taglibsql2.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW71_Taglib(SQL4)</title>
</head>
<body>
	<h2>HW71_Taglib(SQL4) 修改客戶資料</h2>
	<hr>
	<form>
		NAME: <input type="text" name="name"><br>
		TEL: <input type="text" name="tel"><br>
		BIRTHDAY: <input type="text" name="birthday"><br>
		<input type="submit" value="Edit">
	</form>
</body>
</html>