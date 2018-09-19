<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW67_JDBC</title>
</head>
<body>
	<!-- 上面有使用errorPage了, 所以c:catch不一定要做. -->
	<c:catch var="errormsg">
		<%
			//	JSP 可不寫Class.forName
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jdbchw", "root", "root");
			Statement stmt = conn.createStatement();
			
			String sql = " INSERT INTO `cust` (name, tel, birthday) VALUES ('John', '0123456789', '1999-11-12') ";
			stmt.execute(sql);
			out.println("OK");
		%>	
	</c:catch>
	<c:if test="${errormsg != null }">ERROR</c:if>
</body>
</html>