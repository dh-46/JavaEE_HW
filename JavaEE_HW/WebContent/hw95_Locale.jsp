<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 載入格式化Taglib-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW95_Locale 區域化/多國語系</title>
</head>
<body>
	<h2>HW95_Locale 區域化/多國語系 (0930AM1)</h2>
	<hr>
	<%
		// Java寫法:
		//	從request物件實體上拿到locale物件
		Locale locale = request.getLocale();
	%>
	<!-- 偵測用戶瀏覽器的預設語系/ 也可透過偵測用戶ip的方式知道用戶可能使用哪種語系 -->
	Country: <%= locale.getCountry() %><br>
	Country: <%= locale.getDisplayCountry() %><br>
	Languages:  <%= locale.getLanguage() %><br>
	<p>當調整Google瀏覽器的語系設定調整成英文語系, 偵測到的內容也會改變。<br>透過偵測到的預設語系調整給使用者觀看的語言</p>
	<hr>
	<h3>多國語系設定</h3>
	<!-- 
		建立多國語系包
		1.	建立 WEB-INF/classes
		2.	在該目錄下建立新增 res_en_US.properties (前綴檔名res可自訂, 但後面en_US為語言國別, 須按照標準設定)
		3.	語系包通常是網頁做完後最後處理的事情
		4.	開發時建議以英文語系為主, 開發近完成後再加上中文語系包
		5.	zh_TW/en_US: 這類簡寫可查表 (i18N)
		
		設定語系的value可以從locale.getDisplayLanguage()/.getCountry() 取得
	 -->
	 <!-- 設定會隨語系變更的內容 	-->
	 <!-- 設定區域 -->
	 <fmt:setLocale value='<%= locale.getLanguage() + "_" + locale.getCountry() %>'/>
	 <!-- 綁定前綴 -->
	 <fmt:setBundle basename="lan"/>
	 <h4><fmt:message key="companyName"/></h4>
	 <p><fmt:message key="hello"/>, <fmt:message key="world"/></p>
	 <!-- 英文語系 -->
	 <fmt:setLocale value="en_US"/>
	 <fmt:setBundle basename="lan"/>
	 <h4><fmt:message key="companyName"/></h4>
	 <p><fmt:message key="hello"/>, <fmt:message key="world"/></p> 
	 <hr>
	 <h3>日期時間格式&時區設定</h3>
	 現在時間: 
	 <%
	 	Date now = new Date();
	 	out.println(now + "<br>");
	 	
	 	//	複習: 放到pageContext中成為屬性, EL才可以存取
	 	pageContext.setAttribute("time", now);
	 %>
	 <!-- 設定時區: value值要查表 -->
	 <fmt:setTimeZone value="Asia/Tokyo"/>
	 <!-- 針對抓到的時間設定格式 -->
	 <!-- formatDate: value=時間/ type=both,time,date/  dateStyle=long/short-->
	 Tokyo(both): <fmt:formatDate value="${time }" type="both" dateStyle="long"/><br>
	 
	 <fmt:setTimeZone value="Europe/London"/>
	 London(Date): <fmt:formatDate value="${time }" type="date" dateStyle="short"/><br>
	 
	 <fmt:setTimeZone value="America/Los_Angeles"/>
	 LA (time): <fmt:formatDate value="${time }" type="time" dateStyle="long"/><br>
	 
	 <fmt:setTimeZone value="America/Los_Angeles"/>
	 LA (both+pattern): <fmt:formatDate value="${time }" type="both" dateStyle="long" pattern="yyyy-MM-dd HH:mm:ss"/><br>
	 
	 <hr>
	 <h3>貨幣數字_12345.6789 不同格式變化</h3>
	 1. Default: <fmt:formatNumber value="12345.6789"/><br>
	 <!-- maxFractionDigits: 設定小數最大值 (四捨五入)	 -->
	 2. maxFractionDigits: 設定小數最大值 (四捨五入) <fmt:formatNumber value="12345.6789" maxFractionDigits="2"/><br>
	 3.	groupingUsed: 用逗號分位 <fmt:formatNumber value="12345.6789" maxFractionDigits="2" groupingUsed="true"/><br>
	 4. maxIntegerDigits: 整數最大位數 <fmt:formatNumber value="1234567.1234" maxFractionDigits="2" groupingUsed="group" maxIntegerDigits="4"/><br>
	 5.	CurrencyCode: 貨幣碼(ISO 4217) <fmt:formatNumber value="1234567.1234" maxFractionDigits="2" type="currency" currencyCode="TWD" /><br>
	 6.	CurrencyCode: 貨幣碼(ISO 4217) 歐洲 <fmt:formatNumber value="1234567.1234" maxFractionDigits="2" type="currency" currencyCode="EUR" groupingUsed="true"/><br>
	 7.	Percent: 百分比 <fmt:formatNumber value="0.25" type="percent"/> 
</body>
</html>