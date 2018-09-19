<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="tw.dh46.beans.HWAPIs" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW65_taglib (流程控制)</title>
</head>
<body>
	<h2>0915PM1 HW65_taglib (流程控制)</h2>
	<hr>
	<!-- test: 條件; var: 判斷結果的變數名稱 -->
	<c:if test='${param.num != "John" }' var="result">
		裡面就可以寫HTML<br>
	</c:if>
	c:if的結果 =>  ${result }
	<hr>
	
	<!-- -------------taglib裡面的switch------------- -->
	<!-- 
		亂數產生成績值並放變數score中 
		因為是字串比較所以random出來的double值要先轉成int再轉成String
		-->
	<c:set var="score">
		${HWAPIs.toIntString(Math.random()*101) }
	</c:set>
	${score }
	
	<c:choose>
		<c:when test='${score >= "90" }'>A</c:when>
		<c:when test='${score >= "80"  }'>B</c:when>
		<c:when test='${score >= "70"  }'>C</c:when>
		<c:when test='${score >= "60"  }'>D</c:when>
		<c:otherwise>E</c:otherwise>
	</c:choose>
	
	<!-- 老師比較常用: jsp:include/forward &EL & taglib-->
</body>
</html>