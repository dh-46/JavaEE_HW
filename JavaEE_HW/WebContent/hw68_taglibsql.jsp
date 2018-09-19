<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW68_taglib (sql)</title>
</head>
<body>
	<!-- 載入驅動程式: 等於Class.forName -->
	<!-- 第一次伺服器啟動時必須載入, 後續可不用再載入一次 -->
	<sql:setDataSource driver="com.mysql.jdbc.Driver" 
		url="jdbc:mysql://localhost/jdbchw" user="root" password="root"/>
	
	<!-- var="ResultSet的變數名稱" -->
	<!-- query得到的resultset會擺在var變數中 -->
	<sql:query var="resultSet" sql="SELECT * FROM `gifts` "></sql:query>
	
	
	<!-- HW: 每頁十筆資料 並有前後頁功能 
		1. 先取得所有資料
		2. 利用所有資料取得總資料筆數
		3. 下另一道sql取得10筆資料並以這個回傳的result顯示於表格
		4. limit 起始頁以變數控制
		5. 前後頁功能
			-->
	
	<!-- HW1. 取得有幾筆資料數 算每頁10筆 -->
	<c:set var="count" value="${resultSet.rowCount }"/>
	<!-- HW2. 起始頁變數 (第一頁從0開始, 第二頁從10 開始...)-->
	<c:set var="start" value="${(param.page-1) *10 }"/>
	<!-- HW3. 一開始沒參數怎麼做 -->
	<c:set var="start" value="${start < 0? 0 : start }"/>
	
	<!-- 另一種sql寫法 -->
	<!-- limit '起始index', '筆數' -->
	<sql:query var="result">
		SELECT * FROM `gifts` limit ${start },10;
	</sql:query>
	
	<!-- API中 getRowCount方法 => getter/setter -->
	<%-- ${resultSet.rowCount } --%>
	<!-- getcolumnNames return String[] -->
	<%-- ${resultSet.columnNames[0] } --%>
	
	
	<!-- --------------------------- -->
	<h2>HW68_Taglib (SQL)</h2>
	<hr>
	<a href='
		?page=
		<c:choose>
			<c:when test="${param.page <= 1 }">1</c:when>
			<c:otherwise>${(param.page == null)? 1 : (param.page - 1)}</c:otherwise>
		</c:choose>
	'>上一頁</a>
	
	${param.page == null? 1 : param.page } 
	
	<a href='?page=
		<c:choose>
			<c:when test="${param.page == 22 }">22</c:when>
			<c:otherwise>${(param.page == null)? 2 : (param.page + 1)}</c:otherwise>
		</c:choose>
	'>下一頁</a>
	
	
	<table border="1" width="100%">
		<tr>
			<th width="5%">編號</th>
			<th width="20%">名稱</th>
			<th width="15%">地址</th>
			<th width="60%">特色</th>
		</tr>
		<!-- rs.rows 傳回sortedMap陣列 (sortedmap: 一組key,value) -->
		<c:forEach var="row" items="${result.rows }">
			<tr>
				<td>${row.id }</td>
				<td>${row.name }</td>
				<td>${row.place }</td>
				<td>${row.feature }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>