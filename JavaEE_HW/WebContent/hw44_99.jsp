<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW44_JSP005 (九九乘法表)</title>
</head>
<body>
	<h2>HW44_JSP005 (九九乘法表)</h2>
	<hr>
	<table border="2">
		<% 
			for (int j = 0; j <=3; j++) {
				out.println("<tr>");
				for (int k=2; k <= 5; k++) {
					out.println("<td bgcolor='" + ((j+k)%2!=0?"pink":"yellow") + "'>");
					for (int i=1; i <=9; i++) {
						int newk = k+(j*4);
						int r = newk * i;
						out.println(newk +" x " + i + " = " + r + "<br>");
					}
					out.println("</td>");
				}
				out.println("</tr>");
			}
		%>
	</table>
</body>
</html>