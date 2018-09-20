<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Functions -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 
	後端接前端
	1.	透過呼叫Servlet/JSP輸出給前端JSON格式資料
	2.	手機問/網頁問 => 後端回應
	3.	推播: 後端將要拋出的資訊(JSON)推到google filebase, 再由google拋給用戶
	後端撈資料很重要! 如何將人家要的資料提供出去
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW81_function</title>
</head>
<body>
	<h2>hw81_0916PM1_function</h2>
	<hr>
	<ol>
		<li>functions通常與EL搭配使用</li>
		<li>記得看API https://tomcat.apache.org/taglibs/standard/apidocs/org/apache/taglibs/standard/functions/Functions.html</li>
	</ol>
	<hr>
	<!-- var 都可以指定scope 沒指定scope預設為pageContext -->
	<c:set var="var1" scope="page">
		I'm a test String.
	</c:set>
	<!-- fn+: 呼叫功能 contain (var1 是否有包含test字串) -->
	<%-- ${fn:contains(var1, "test") } --%>
	<c:if test='${fn:contains(var1, "test") }'>
		Pass
	</c:if>
	
	<!-- fn:contains替換成Java長這樣 -->
	<%-- <%
		String var2 = (String)pageContext.getAttribute("var1");
		out.println(var2.contains("test"));
	%> --%>
	
	
</body>
</html>