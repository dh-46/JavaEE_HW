<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Import tags -->
<%@ taglib tagdir="/WEB-INF/tags" prefix="cust"%>

<!-- 
	0929 Taglib-自訂標籤	 
	1. 建立標籤庫
	=> 目錄/WEB-INF/tags
	=> xxx.tag (附檔名不用.tag也可)
	=> 一個檔案一個標籤
	2.	使用方法
	=> tagdir=路徑
	3.	tag檔可寫普通文字與JSP
	-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW87_CustomTags</title>
</head>
<body>
	<h2>HW87_自訂標籤練習</h2>
	<hr>
	<h4>Tag1-Hello World</h4>
	<cust:test1/>
	<hr>
	<h4>Tag2-Hello ____ (含有參數的標籤)</h4>
	<cust:test2 user="John"/>
	<hr>
	<h4>Tag3-加減乘除</h4>
	<cust:test3 x="10" y="2">10 + 2 = ${add }</cust:test3><br>
	<cust:test3 x="10" y="2">10 - 2 = ${substract }</cust:test3><br>
	<cust:test3 x="10" y="2">10 * 2 = ${multi }</cust:test3><br>
	<cust:test3 x="10" y="2">10 / 2 = ${divide }</cust:test3><br>
	<p>在標籤範圍外變數無法使用</p>
	10 / 2 = ${divide } <br>
	<hr>
	<h4>Tag4-Tag檔就是在寫JSP啦</h4>
	<cust:test4/>
	<hr>
	<h4>寫個表格</h4>
	<table border="1" width="60%">
		<tr>
			<th>Name</th>
			<th>Price</th>
		</tr>
		<!-- 搭配for each & SQL 就可以連資料庫 	-->
		<!-- 一個標籤配一個檔案 維護上要注意標籤命名 -->
		<cust:test5 name="Camera" price="100"/>
		<cust:test5 name="Laptop" price="200"/>
	</table>
</body>
</html>