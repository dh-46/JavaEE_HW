<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW85_Upload(Receive)</title>
</head>
<body>
	<h3>HW85_Upload (0916PM1 Oreilly)</h3>
	<hr>
	<%	
		//	取得上傳的檔案路徑
		String uploadPath = pageContext.getServletContext().getInitParameter("upload-dir");
		//	out.println(uploadPath);
		
		//	上傳使用 MultipartRequest(隱含物件:request, 儲存路徑, 上傳大小限制, 編碼格式)
		//	上傳寫完了 XD
		MultipartRequest mreq = new MultipartRequest(request, uploadPath, 64*1024*1024, "UTF-8");
		//	實務上會先上傳到某個上傳區位置, 再做檔案整理
		
		//	撈出檔案參數
		
		//	1. 檔案上傳的資訊
		Enumeration<String> items = mreq.getFileNames();
		//	傳回 the names of all the uploaded files as an Enumeration of Strings.
		while (items.hasMoreElements()) {
			//	其實是取回欄位名稱
			//	但是84的多檔上傳name都是upload => 故只會傳回最後一個檔案的名稱
			//	=> 更改頁面的name : upload1, upload2
			String field = items.nextElement();
			File file = mreq.getFile(field);
			if (file != null) {
				out.println( field + " : " + file.getName() + "<br>");
			}
			
		}
		
		//	2. 文字欄位的資訊
		//	印出上傳的文字
		String value = mreq.getParameter("user");
		out.println("User: " + value);
	%>
</body>
</html>