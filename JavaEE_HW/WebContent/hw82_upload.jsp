<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW82_Upload (0916PM1)</title>
</head>
<body>
	<h2>HW82_檔案上傳 (00:16:00)</h2>
	<hr>
	<p>使用Apache上傳API</p> 
	<ol>
		<!-- 下載所需的jar並放到lib位址 -->
		<li>Apache Upload Download: https://commons.apache.org/proper/commons-fileupload/download_fileupload.cgi</li>
		<li>Doc: https://commons.apache.org/proper/commons-fileupload/javadocs/api-release/index.html</li>
		<li>commons-upload-1.3.3</li>
		<li>Apache Commons IO: https://commons.apache.org/</li>
		<li>commons-io-2.6</li>
	</ol>
	<hr>
	<form action="hw83_upload2.jsp" method="post" enctype="multipart/form-data">
		<!-- 追加 user 文字 看 83是否可以捕捉到 -->
		User: <input type="text" name="user"><br>
		<!-- 多檔上傳 -->
		<input type="file" name="upload"><br>
		<input type="file" name="upload"><br>
		<input type=submit value="UPLOAD">
	</form>
</body>
</html>