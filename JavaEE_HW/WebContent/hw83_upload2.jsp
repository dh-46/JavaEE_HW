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
	<h3>HW83_Upload (0916PM1 Apache 00:27:56)</h3>
	<hr>
	<%
		String uploadPath = pageContext.getServletContext().getInitParameter("upload-dir");
		//	out.println(uploadPath);
		
		
		
		//	看API Apache
		//	建構式 ServletFileUpload(FileItemFactory)
		//	DiskFileItemFactory(最大值:8*1024*1024[8MB],File); 
		//	複習一下檔案計算格式: http://www.wu.ece.ufl.edu/links/dataRate/DataMeasurementChart.html
		//	建立上傳的物件實體
		DiskFileItemFactory factory = new DiskFileItemFactory(8*1024*1024, new File(uploadPath));
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		//	request 隱含物件
		//	解析上傳物件成List
		int i = 1;
		List<FileItem> items= upload.parseRequest(request);
		
		for (FileItem item : items) {
			//	檔案資訊
			String name = item.getName();
			String type = item.getContentType();
			String field = item.getFieldName();
			long size = item.getSize();
			
			//	抓文字資料
			String s = item.getString();
			
			//	out.println(name+":" + type+":" + field +":" + size+ ":" + s +"<br>");
			
			if (name == null) {
				//	如果上傳的是字串, 則印出.
				out.println(field + ":" + s + "<br>");
			} else {
				if (size > 0) {
					//	寫出檔案
					//	實務上 i 可以置換成資料庫中取得的lastId.
					item.write(new File(uploadPath, "p" + i + ".jpg"));
					i++;
				}
			}
			
			
		}
		
		//	檔案大圖不建議用BLOB丟資料庫
		out.println("Upload OK");
		
		//	圖片上傳另一招: 影像轉換成Base64 String再上傳, 伺服器收到再解碼轉換回圖片
	%>
</body>
</html>