<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!-- 1.	先判斷是否有帶editid參數, 沒參數的不能修改 & 修改的內容不得為空 
	因應隱藏欄位ID , 條件修改成 非空的ID-->
<c:if test="${empty param.editid and empty param.id}">
	<!-- 趕走 -->
	<c:redirect url="hw69_taglibsql2.jsp"/>
</c:if>

<!-- 2.	建立資料庫連線 -->
<sql:setDataSource driver="com.mysql.jdbc.Driver" 
	url="jdbc:mysql://localhost/iii"
	user="root" password="root"/>

<!-- 4.	送出後執行=>也就是有沒有收到param.id -->
<c:if test="${!empty param.id }">
	<sql:update>
		UPDATE `cust` SET name=?, tel=?, birthday=? where id=?
		<sql:param>${param.name }</sql:param>
		<sql:param>${param.tel }</sql:param>
		<sql:param>${param.birthday }</sql:param>
		<sql:param>${param.id }</sql:param>
	</sql:update>
	<!-- 5.	更新完後跳轉回去 -->
	<c:redirect url="hw69_taglibsql2.jsp"/>
</c:if>

<!-- 3. 載入要編輯的資料 -->
<sql:query var="result">
	select * from `cust` where id = ?
	<sql:param>${param.editid }</sql:param>
</sql:query>


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
		<!-- 按下編輯送出後, 因為沒有使用session, 瀏覽器並不知道要送出的資料ID. 
			使用隱藏欄位紀錄ID -->
		<input type="hidden" name="id" value="${result.rows[0].id }">
		<!-- result回傳的是result set, 要先取到那一列才可以拿到該欄位 -->
		NAME: <input type="text" name="name" value="${result.rows[0].name }"><br>
		TEL: <input type="text" name="tel" value="${result.rows[0].tel }"><br>
		BIRTHDAY: <input type="text" name="birthday" value="${result.rows[0].birthday }"><br>
		<input type="submit" value="Edit">
	</form>
</body>
</html>