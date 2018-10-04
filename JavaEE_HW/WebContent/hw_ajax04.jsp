<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 回應給hw_ajax03.html -->

<%
	//	注意! 資料傳遞回傳的都是字串
	String initX = request.getParameter("x");
	String initY = request.getParameter("y");
	//out.println(initX + initY);
	
	
	//	try catch 處理例外
	try {
		//	轉型成double值運算
		double x = Double.parseDouble(initX);
		double y = Double.parseDouble(initY);
		
		//	回傳的東西越乾淨越好
		double result = x + y;
		out.println(result);
	} catch (Exception e) {
		out.println("Error");
	}
	
	
%>