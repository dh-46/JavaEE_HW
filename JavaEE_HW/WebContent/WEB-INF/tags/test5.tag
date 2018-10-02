<%@	tag import="java.util.HashMap"%>

<!-- 動態屬性 -->
<%@ tag dynamic-attributes="product" %>

<%
	//	把動態的參數資料放到Map(key, value)中
	//	取得該頁面的產品 attribute 再把資料放到Map中
	HashMap<String, String> ps = (HashMap<String, String>)jspContext.getAttribute("product");
	
	out.println("<tr>");
		
		//	外面attribute沒寫會是null, 所以要檢查
		if (ps.containsKey("name")) {
			//	這裡的name是指外面有一個attribute叫name
			out.println("<td>" + ps.get("name") + "</td>");
		}
		
		if (ps.containsKey("price")) {
			out.println("<td>" + ps.get("price") + "</td>");
		}
		
		
	out.println("</tr>");
%>