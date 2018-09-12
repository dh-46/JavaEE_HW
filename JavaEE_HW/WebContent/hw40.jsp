<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW40_JSP</title>
</head>
<body>
	<h1>HW40_JSP001</h1>
	<hr>
	<p>透過百分比標籤相夾, 裡面可以寫JSP. (BTW asp裡面也是用百分比) <br> 
		瀏覽器第一次讀到百分比會丟給後端引擎轉換,然後以servlet編譯, 
		第二次後端則是直接取用以編譯的部分執行再回傳結果<br>
		快速顯示某個變數值, 百分比符號後加上 =  .<br>
		指令: 百分比符號後加上@ . <br>
		%@page : 代表頁面屬性. <br>
	</p>
	<% 
		int a = 10, b = 3;
		out.println(a/b);
		int lottery = (int)(Math.random()*49+1);
	%>
	<br>
	樂透號碼: <% out.println(lottery); %> <br>
	樂透號碼: <%= lottery %> <br> <!-- 簡寫方法 -->
	<!-- 印出伺服器時間, 注意上面也需要import java.util-->
	<%= "目前伺服器時間: " + Calendar.getInstance().get(Calendar.HOUR_OF_DAY) + ":" + Calendar.getInstance().get(Calendar.MINUTE) %>
</body>
</html>