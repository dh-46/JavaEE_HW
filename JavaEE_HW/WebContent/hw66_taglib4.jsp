<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	//	產生練習用的陣列
	String[] names = {"Brad", "Tony", "John", "Sam", "Kevin"};
	pageContext.setAttribute("names", names);
	
	for (String name : names) {
		//out.println(name + "<br>");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW66_taglib4 (loop)</title>
</head>
<body>
	<h2>0915PM1 HW66_taglib4 (loop)</h2>
	<hr>
	<!-- var=尋訪出的 items: 尋訪的對象; varStatus: 含當次迴圈的屬性; begin-->
	<c:forEach var="name" items="${names }" varStatus="status">
		Name: ${name } 
		Index: ${status.index } <br>
	</c:forEach>
	
	<hr>
	<h4>動態表格</h4>
	<table border="1" width="50%">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Count</th>
			<th>First</th>
			<th>Last</th>
		</tr>
		<!-- count: 迴圈次數, step: 一次跨幾格; begin/end:開始結束位置 -->
		<c:forEach var="name" items="${names }" varStatus="status2" begin="0" end="4" step="1">
			<tr bgcolor='
				<c:choose>
					<c:when test="${status2.first }">pink</c:when>
					<c:when test="${status2.last }">yellow</c:when>
					<c:otherwise>lightgray</c:otherwise>
				</c:choose>
			'>
			
			<%-- <c:if test="${status.count % 2 == 0 }"><tr bgcolor='yellow'></c:if>
			<c:if test="${status.count % 2 != 0 }"><tr bgcolor='pink'></c:if> --%>
			
				<td>${status2.index }</td>
				<td>${name }</td>
				<td>${status2.count }</td>
				<td>${status2.first }</td>
				<td>${status2.last }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>