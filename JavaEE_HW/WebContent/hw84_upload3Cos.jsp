<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW84_Upload (0916PM1)</title>
</head>
<body>
	<h2>HW84_檔案上傳 (Oreilly)</h2>
	<hr>
	<p>使用oreilly上傳API (Cos.jar)</p>
	<ol>
		<!-- 下載所需的jar並放到lib位址 -->
		<li>http://www.servlets.com/cos/javadoc/com/oreilly/servlet/MultipartRequest.html</li>
		<li>使用 MultipartRequest</li>
	</ol>
	<hr>
	<form action="hw85_upload4Cos.jsp" method="post" enctype="multipart/form-data">
		<!-- 追加 user 文字 看 84是否可以捕捉到 -->
		User: <input type="text" name="user"><br>
		<!-- 多檔上傳 -->
		<input type="file" name="upload1"><br>
		<input type="file" name="upload2"><br>
		<input type=submit value="UPLOAD">
	</form>
</body>
</html>