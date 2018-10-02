<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//	HW902: 檢查HW892的帳號密碼
	
	//	1.	條件不符的return
	//	新的session不行	=> 擋掉沒種session的
	if (session.isNew() || request.getParameter("account") == null || request.getParameter("password") == null) {
		response.sendRedirect("hw892_login.jsp");
		return;
	}
	
	
	//	檢查帳號密碼 (正常來講要串資料庫/這邊只是練習session故就單純比對而已)
	String account = request.getParameter("account");
	String password = request.getParameter("password");
	
	if (account.equals("dh46") && password.equals("12345")) {
		session.setAttribute("account", account);
		response.sendRedirect("hw912_view.jsp");
	} else {
		response.sendRedirect("hw892_login.jsp");
	}
	
	//	session 不要放太多資料, 盡量只有重要的判斷資訊, 以免影響伺服器效能
%>