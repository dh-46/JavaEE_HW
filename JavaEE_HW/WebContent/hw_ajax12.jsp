<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//	連接資料庫
	
	//	取得前端輸入的帳號
	String account = request.getParameter("account");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/iii", "root", "root");
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT count(*) as count FROM `accounts` WHERE account = '" + account + "'";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next(); //	複習: 指標移到下一筆(上一筆是標題列?)
	String count = rs.getString("count");
	// System.out.print(count);
	out.println(count);
%>