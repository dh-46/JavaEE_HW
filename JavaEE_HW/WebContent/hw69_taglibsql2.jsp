<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW69_taglib (SQL2)</title>
</head>
<body>
	<h2>HW69_客戶資料表</h2>
	<hr>
	<a href="hw70_taglibsql3.jsp"><button>新增</button></a>
	<hr>
	<!-- 連接資料庫 -->
	<sql:setDataSource driver="com.mysql.jdbc.Driver" 
		url="jdbc:mysql://localhost/iii" user="root" password="root"/>
		
	<c:if test="${!empty param.delid }">
		<sql:update>
			DELETE FROM `cust` WHERE id = ?
			<sql:param>${param.delid }</sql:param>
		</sql:update>
	</c:if>
		
	<sql:query var="result">
		select * from `cust`
	</sql:query>
	
	<table border="1" width="100%">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>TEL</th>
			<th>BIRTHDAY</th>
			<!-- 追加刪除與修改功能 -->
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<!-- result.rows 回傳 SortedMap -->
		<c:forEach items="${result.rows }" var="row">
			<tr>
				<td>${row.id }</td>
				<td>${row.name }</td>
				<td>${row.tel }</td>
				<td>${row.birthday }</td>
				<!-- 修改可以使用AJAX, 但這裡使用頁面切換 -->
				<td><a href="hw71_sqledit.jsp?editid=${row.id }"><button>修改</button></a></td>
				<!-- 刪除: 自己處理 (刪除完再去查最新資料) -->
				<td>
					<a href="?delid=${row.id }">
						<button onclick='return ask("${row.name}");'>刪除</button>
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- JS for 刪除提示
		JS Review: onclick return true/false;
		BTW confirm 好像沒學過...	 -->
	<script type="text/javascript">
		function ask(name) {
			var isDelete = confirm("Do you really want to delete " + name + " ?");
			return isDelete;
		}
	</script>
</body>
</html>