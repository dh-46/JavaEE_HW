<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!-- sql taglib 寫在這裡的原因
	載入前先有一道條件判斷,  確認有無參數, 有參數則執行sql -->

<!-- 真的有填入資料才會進行新增 -->
<c:if test="${!empty param.name }">
	<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/iii"
		user="root" password="root"/>
	<sql:update>
		INSERT INTO `cust` (name, tel, birthday) VALUES (?,?,?)
		<sql:param>${param.name }</sql:param>
		<sql:param>${param.tel }</sql:param>
		<sql:param>${param.birthday }</sql:param>
	</sql:update>
	
	<!-- 新增完成後跳回原表單頁 -->
	<c:redirect url="hw69_taglibsql2.jsp"/>
</c:if>
<!-- 另一種判斷方式 -->
<%-- <c:if test="${param.name != null }"></c:if> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW70_Taglib(SQL3)</title>
</head>
<body>
	<h2>HW70_Taglib(SQL3) 新增客戶資料</h2>
	<hr>
	<form>
		NAME: <input type="text" name="name"><br>
		TEL: <input type="text" name="tel"><br>
		BIRTHDAY: <input type="text" name="birthday"><br>
		<input type="submit" value="Add">
	</form>
	<!-- 
		新增資料由誰做?
		1. 當然可以交給以前寫的servlet (jsp處理畫面就好?)
		2. 這裡是拋給自己 ((表格參數是拋給自己, 	
		-->
</body>
</html>