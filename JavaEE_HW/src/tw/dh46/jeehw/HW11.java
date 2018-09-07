package tw.dh46.jeehw;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 * 	Servlet implementation class HW11
 * 	20180902PM2 檔案上傳 00:22:47
 * 	處理hw10.html中的上傳檔案
 * 	
 * 	1.	權限的觀念
 * 	2.	檔案目錄的設定(C:\Users\Daniel\git\JavaEE_Lab\JavaEE_Lab\WebContent\Upload)
 * 		==> 資料夾對外營業
 * 		建立&設定xml檔案: WEB-INF/web.xml
 * 	3.	annotation for 	@MultipartConfig
 * 
 */
@WebServlet("/HW11")
@MultipartConfig // 上傳檔案用的annotation
public class HW11 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 之後會教如何redirect使用者 (因為使用者不該用doGet, 這隻程式應該是只有for doPost)
	}
	
	// 處理檔案只能使用doPost
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//	取得web.xml中的context參數
		ServletContext context = getServletContext();
		String uploadPath = context.getInitParameter("upload-dir"); // InitParameter=>就是初始化的參數
		System.out.println("上傳路徑: " + uploadPath);
		
		//	取得上傳檔案的相關物件實體
		Part upload = request.getPart("uploadPic");
		//	取得相關資料
		Collection<String> headerNames = upload.getHeaderNames();
		for (String header: headerNames) {
			String value = upload.getHeader(header);
			System.out.println(header +": " + value);
			// 印出上傳檔案的格式與資訊
			// content-disposition: form-data; name="uploadPic"; filename="12.PNG"
			// content-type: image/png
		}
		System.out.println("----------");
		//	檔案大小
		long size = upload.getSize();
		System.out.println("Size: " + size/1024 + " KB");
		
		//	上傳檔案名稱
		String fileName = upload.getSubmittedFileName();
		System.out.println("File Name: " + fileName);
		
		String status = "";
		
		try {
			// 建立串接/串流
			InputStream ins = upload.getInputStream();
			BufferedInputStream bin = new BufferedInputStream(ins);
			
			// 讀到暫存
			byte[] buf = bin.readAllBytes();
			// 關閉串流
			bin.close();
			
			FileOutputStream fout = new FileOutputStream(new File(uploadPath, fileName));
			
			// 寫出檔案
			fout.write(buf);
			fout.flush();
			fout.close();
			
			status = "Upload Success!";
			
			PrintWriter writer = response.getWriter();
			writer.append("Status: " + status);
		} catch (Exception e) {
			System.out.println(e);
			status = e.toString();
		}
		
		
	}

}
