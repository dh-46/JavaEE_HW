<%@page import="tw.dh46.beans.HWAPIs"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] names = { "John", "Allen", "Ben", "Tom", "Lisa", "Connie" };
	//	透過setAttribute 方法, 將物件放入request屬性中, 並給予Key名稱
	request.setAttribute("usernames", names);

	LinkedList<String> list = new LinkedList<>();
	list.add("111");
	list.add("222");
	list.add("333");
	list.add("444");
	list.add("555");
	request.setAttribute("list", list);

	HashMap<String, String> map = new HashMap<>();
	map.put("name", "John");
	map.put("age", "18");
	map.put("gender", "male");
	request.setAttribute("map", map);
	
	//	不同層級存取
	//	存取優先權: 先找最近的 page --> req --> ses --> app
	pageContext.setAttribute("var1", 111);
	request.setAttribute("var1", 222);
	//	為甚麼session註解後仍顯示333: 因為沒有刪掉session他就一直都在XD
	//	砍掉session: 下指令/關閉瀏覽器重啟
	session.setAttribute("var1", 333);
	application.setAttribute("var1", 444);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw62_資料結構</title>
</head>
<body>
	<h2>20180915AM2 hw62_資料結構</h2>
	<hr>
	<ol>
		<li>網頁中處理的資料結構都是以物件方式處理</li>
		<li>誰可以存取端看資料放在四階層中的哪個等級</li>
		<li>Attribute是屬性, 不要與參數(Parameter)搞混了</li>
	</ol>
	<hr>
	<!-- 資料結構使用[]存取 -->
	<!-- EL中直接呼叫該屬性名稱 -->
	User Name 1 = ${usernames[0] } <br>
	User Name 2 = ${usernames[1] } <br>
	User Name 3 = ${usernames[2] } <br>
	<br>
	<!-- LinkList 本質上與陣列類似 所以取用方法相同 -->
	List 1 = ${list[0] }<br>
	List 2 = ${list[1] }<br>
	<!-- param.i 讓使用者可以透過帶參數i(i=2&key=gender)存取特定值 -->
	List 3 = ${list[param.i] }<br>
	<br>
	<!-- Map key值為唯一 可以當屬性 -->
	Map name = ${map.name } <br>
	Map age = ${map["age"] } <br>
	<!-- param.key 讓使用者可以透過帶參數key(i=2&key=gender)存取特定值 -->
	Map gender = ${map[param.key] } <br>
	<hr>
	var1 : ${var1 } (四個層級變數名稱都相同的情況下,會優先找最低層級的)<br>
	<br>
	加上xxxScop. 指定存取特定層級的變數<br>
	Page var1: ${pageScope.var1 } <br>
	Request var1: ${requestScope.var1 } <br>
	Session var1: ${sessionScope.var1 } <br>
	Application var1: ${applicationScope.var1 } <br>
	<hr>
	%百分比方法呼叫Java Static方法<br>
	Lottery: <%= HWAPIs.lottery() %><br>
	<br>
	EL直接呼叫Java Static方法<br>
	Lottery: ${HWAPIs.lottery() }<br>
	<br>
	Say Hi: ${HWAPIs.sayHi("John") }<br>
	Say Hi (帶參數 name=allen): ${HWAPIs.sayHi(param.name) }<br>
	<hr>
	EL 參數基本運算/比較<br>
	數字比較: ${param.x } > ${param.y } => ${param.x > param.y }<br>
	數字比較: ${param.x} > 3 => ${param.x > 3 }<br>
	字串比較(因為傳入的參數永遠都是字串): ${(param.x == "10")? "Yes" : "No" }<br>
</body>
</html>