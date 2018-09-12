<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//這裡面做的都是區域變數
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	String op = request.getParameter("op");
	String result = "";
	String select = "1"; //	沒有先給值的話 selected那裏會出現nullpointerException
	
	int intX = 0; 	// 因為是區域變數所以要先初始化
	int intY = 0;
	int answer = 0;
	
	
	if ( x != null && y != null) {
		try {
			intX = Integer.parseInt(x);
			intY = Integer.parseInt(y);
			
			switch (op) {
			default:
				select = "1";
				break;
			case "1":
				answer = intX + intY;
				result = "" + answer;
				select = "1";
				break;
			case "2":
				answer = intX - intY;
				result = "" + answer;
				select = "2";
				break;
			case "3":
				answer = intX * intY;
				result = "" + answer;
				select = "3";
				break;
			case "4":
				select = "4";
				try {
					answer = intX / intY;
					result = "" + answer;
				} catch (Exception e) {
					result = "無法除以零";
				}
				break;
			}
		} catch (Exception e) {
			intX = 0;
			intY = 0;
			out.println("Illegal Input: " + e + "<hr>");
		}
	} else {
		intX = 0;
		intY = 0;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW43_JSP004(四則運算)</title>
</head>
<body>
	<h2>加減乘除計算機(JSP.version)</h2>
	<hr>
	<form>
		<input type="text" name="x" value="<%= intX %>">
		<select name="op">
			<option value="1" <%= select.equals("1")?"selected":"" %> >+</option>
			<option value="2" <%= select.equals("2")?"selected":"" %> >-</option>
			<option value="3" <%= select.equals("3")?"selected":"" %> >x</option>
			<option value="4" <%= select.equals("4")?"selected":"" %> >/</option>
		</select>
		<input type="text" name="y" value="<%= intY %>">
		<input type="submit" value="=">
		<%= result %>
	</form>
</body>
</html>