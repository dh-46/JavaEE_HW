<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw61_表單互動(處理hw60)</title>
</head>
<body>
	<h2>20180915AM2 hw61_表單互動(隱含物件)</h2>
	<hr>
	<h3>隱含物件的四階層等級</h3>
	<ol>
		<li>Page: 這一頁裡面</li>
		<li>Request: 頁與頁之間</li>
		<li>Session: 多次(一連串)的連線</li>
		<li>Application: 全體</li>
	</ol>
	<hr>
	<%
		//	利用Java認識基本觀念以銜接後續EL
		//	隱含物件: request, out
		String method = request.getMethod();	// 判斷來源為get/post
		out.println("Method: " + method + "<br>");
		
		//	PageContext 目前的這一頁
		//	getRequest => 拿到的是ServletRequest
		//	以前servlet拿到的是HttpServletRequest
		//	HttpServletRequest --> ServletRequest(父類別)
		HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
		out.println("PageContext_Method: " + req.getMethod() + "<br>");
		
		//	兩個隱含物件是否是同一個物件實體
		out.println(request == req);
		out.println("<br>");
		
		//	remoteAddr 用戶端ip => 可以用來處理/過濾用戶端
		String ip = request.getRemoteAddr();
		out.println("遠端用戶的IP: " + ip + "<br>");
		
		//	取得get方法中網址列問號後的query string
		//	只有get方法哦!
		String query = request.getQueryString();
		out.println("Query String: " + query + "<br>");
	%>
	<!-- 
		pageContext是隱含物件
		因為方法中有寫getXX/setXX(拿出該物件實體的屬性), 
		所以EL中可以.直接呼叫該方法的物件實體 
	-->
	Method = ${pageContext.request.method }<br>
	RemoteAddr = ${pageContext.request.remoteAddr }<br>
	QueryString = ${pageContext.request.queryString }<br>
	
	
</body>
</html>