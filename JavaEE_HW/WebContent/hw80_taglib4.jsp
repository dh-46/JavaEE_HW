<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW80_Prepared Statement</title>
</head>
<body>
	<!-- taglib 與 Java差異
		1. Java連線時會拿到一個connection, 但taglib沒有?
			=> taglib永遠使用執行sql語法時最近的連線來當連線物件
			=> 如果要細部控制, 利用dataSource的var來操作/指定該連線物件實體
				==> 實務上很少會這樣 (同一個app同一時間兩個連線物件實體)
		 -->
		 
	<c:catch var="errorMsg">
		<!-- 資料庫連線 
			driver第一次執行時必須載入!!
			載入過後, 如果伺服器沒有重啟可不用再載入	-->
		<sql:setDataSource driver="com.mysql.jdbc.Driver" 
			url="jdbc:mysql://localhost/iii" 
			user="root" password="root"/>
		<!-- 執行增刪修(update) Prepared Statement
		第一行寫增刪修
		以後寫param
		-->
		<sql:update var="update">
			INSERT INTO `cust` (name, tel, birthday) VALUES (?,?,?)
			<sql:param>TaglibSQL</sql:param>
			<sql:param>0912345678</sql:param>
			<sql:param>2018-09-20</sql:param>
		</sql:update>
		<!-- sql:update 會回傳更新異動的筆數	 -->
		${update }<br>
		<c:if test="${update >= 1 }">UPDATE SUCCESS! </c:if>
	</c:catch>
	<c:if test="${errorMsg != null }">ERROR!</c:if>	
</body>
</html>