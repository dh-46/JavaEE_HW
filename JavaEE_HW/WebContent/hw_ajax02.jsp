<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 純文字, 回應給hw_ajax01.html -->
Hello,World!<br>

<%
	//	41:00 取得前端request中夾帶的header資訊
	Enumeration<String> keys = request.getHeaderNames();
	//	拿出enumeration裡的name
	while (keys.hasMoreElements()) {
		String key = keys.nextElement();
		out.println(key + " : " + request.getHeader(key) + "<br>");
	}
%>
<%= (int)(Math.random()*49+1) %>