<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW83_Upload(Receive)</title>
</head>
<body>
	<h3>HW83_Upload (0916PM1)</h3>
	<hr>
	<%
		String uploadPath = pageContext.getServletContext().getInitParameter("upload-dir");
		//	out.println(uploadPath);
		
		
		
		//	看API
		//	建構式 ServletFileUpload(FileItemFactory)
		//	建立上傳的物件實體
		DiskFileItemFactory factory = new DiskFileItemFactory(8*1024*1024, new File(uploadPath));
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		//	request 隱含物件
		//	解析上傳物件成List
		int i = 1;
		List<FileItem> items= upload.parseRequest(request);
		for (FileItem item : items) {
			String name = item.getName();
			String type = item.getContentType();
			String field = item.getFieldName();
			long size = item.getSize();
			//	out.println(name+":" + type+":" + field +":" + size+"<br>");
			if (size > 0) {
				item.write(new File(uploadPath, "p" + i + ".jpg"));
				i++;
			}
		}
		//	檔案大圖不建議用BLOB丟資料庫
		out.println("Upload OK");
	%>
</body>
</html>