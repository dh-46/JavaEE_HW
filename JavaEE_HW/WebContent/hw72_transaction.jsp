<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW72_Taglib (SQL-Transaction)</title>
</head>
<body>
	<h2>HW72_Taglib (SQL-Transaction)</h2>
	<hr>
	<sql:setDataSource driver="com.mysql.jdbc.Driver" 
		url="jdbc:mysql://localhost/iii"
		user="root" password="root"/>
	
	<c:catch var="errorMsg">
		<!-- 一次性的交易行為, 交易內的任意行為失敗則全部rollback -->
		<sql:transaction>
			<sql:update var="updateN">
				INSERT INTO `cust` (name, tel, birthday) VALUES (?,?,?)
				<sql:param>Kevin1213</sql:param>
				<sql:param>0123456</sql:param>
				<sql:param></sql:param>
			</sql:update>
			
			<!-- 取得最近一次Insert的ID (需緊接著Insert command執行)-->
			<sql:query var="lastId">
				select last_insert_id() AS newid;
			</sql:query>
		</sql:transaction>
		
		<!-- 如果交易成功, 回傳筆數會大於零 -->
		<c:if test="${updateN > 0 }">
			LastID => ${lastId.rows[0].newid }
		</c:if>
	</c:catch>
	${errorMsg }
</body>
</html>