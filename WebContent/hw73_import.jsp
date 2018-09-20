<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%-- <sql:setDataSource driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/mysqlhw"
	user="root" password="root"/> --%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW73_taglib (import)</title>
</head>
<body>
	<h2>HW73_taglib (import 遠端的資料)</h2>
	<hr>
	<ol>
		<li>載入遠端頁面資料 (E.g. 靜態網頁 [會呈現原始碼]/JSON)</li>
		<li>適用在讀取JSON資料</li>
	</ol>
	<hr>
	<!-- 讀回來的資料放入data中, 是EL的物件, 預設存放點是page底下的attribute -->
	<c:import var="data" url="http://data.coa.gov.tw/Service/OpenData/ODwsv/ODwsvAttractions.aspx"/>
	<%-- ${data } --%>
	<%
		// 以下動作可以寫到API中
		
		//	1. 從pageContext中取出data
		String strJSON = (String)pageContext.getAttribute("data");
		//	2. 建立LinkList<HashMap>
		LinkedList<HashMap<String,String>> data = new LinkedList<>();
		//	3. 將JSON格式的raw data轉成JSON陣列
		JSONArray root = new JSONArray(strJSON);
		//	4. 利用for迴圈將JSON陣列中的資料放入data中
		for (int i=0; i < root.length(); i++) {
			//	5. 轉成JSON物件
			JSONObject row = root.getJSONObject(i);
			//	6. 將物件屬性依序放入Hashmap中
			HashMap<String,String> map = new HashMap<>();
			map.put("Id", row.getString("ID"));
			map.put("Name", row.getString("Name"));
			map.put("Tel", row.getString("Tel"));
			map.put("Address", row.getString("Address"));
			map.put("pos", row.getString("Coordinate"));
			//	7. 將HashMap放入LinkedList中
			data.add(map);
			
			//	8. 測試是否有撈到資料
			//	out.println(map.get("Name") + ", " + map.get("Address") + "<br>");
		}
		//	9. 把資料放到pageContext中, 這樣表格才能使用.
		pageContext.setAttribute("pdata", data);
	%>
	
	<!-- 以表格呈現 -->
	<table border="1" width="100%">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>TEL</th>
			<th>ADDRESS</th>
			<th>Coordinate</th>
		</tr>
		<!-- 存取pageContext中的pdata -->
		<c:forEach var="row" items="${pdata }">
			<tr>
				<!-- 每一列裡面都是一個map -->
				<!-- 尋訪的items是HashMap, 每一個row就是一組HM -->
				<!-- 複習:HashMap&LinkedList -->
				<td>${row.Id }</td>
				<td>${row.Name }</td>
				<td>${row.Tel }</td>
				<td>${row.Address }</td>
				<td>${row.pos }</td>
			</tr>
			
			<%-- <sql:update>
				Insert into `travel` (sid, name, tel, addr, pos) values (?,?,?,?,?)
				<sql:param>${row.Id }</sql:param>
				<sql:param>${row.Name }</sql:param>
				<sql:param>${row.Tel }</sql:param>
				<sql:param>${row.Address }</sql:param>
				<sql:param>${row.pos }</sql:param>
			</sql:update> --%>
			
		</c:forEach>
	</table>
</body>
</html>