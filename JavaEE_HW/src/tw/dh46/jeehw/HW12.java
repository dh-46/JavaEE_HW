package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 	Servlet implementation class HW12
 * 	RequestDispatcher include (分派/分支)
 * 	
 * 	要知道中心點是哪個程式	=> 例如在範例中 對使用者而言存取的是HW12
 * 	HW13/hw14.html => 都是分支
 */

@WebServlet("/HW12")	// HW12可以換成其他文字(也可以騙瀏覽器, 例如把它改成***.php)
public class HW12 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>JavaEE_HW 0908AM1</h1>");
		out.println("<hr>");
		out.println("<p>認識RequestDispatcher & include</p>");
		out.println("<hr>");
		
		//	把HW13 include 到 HW12 中 [分支]
		//	在HW13中只要處理邏輯就好, 輸出的部分不管她 (12的setContentType也有影響到include的13)
		//	1. 透過夾帶參數name確認HW13是否有收到 "HW13?name=John"
		//	RequestDispatcher dispatcher1 = request.getRequestDispatcher("HW13?name=John");
		
		//	2. 如果dipatcher中沒有帶參數, 並在HW12接收name參數, 而實際參數輸入是在HW12的網址列, 結果為何?
		//	RequestDispatcher dispatcher1 = request.getRequestDispatcher("HW13");
		
		//	3. 若回到1.的情況, 同樣有帶參數, 顯示的會是HW12網址列傳的, 還是disp-傳入的參數?
		//	再次測試看看Url中的參數lab12/13各自接收的狀況
		//	=>	dispatcher1中URL的修改影響到的是lab13
		
		
		String name = request.getParameter("name");
		
		
		RequestDispatcher dispatcher1 = request.getRequestDispatcher("HW13?name=Tony");
		
		// add Lab13 (可獨立邏輯出來, )
		/*
		 *	Lab12的參數物件 (request, response)透過dispatcher傳給Lab13 
		 * 	=>	相同的物件實體傳遞
		 * 	=>	參數的傳遞
		 */
		dispatcher1.include(request, response);	// request 交給HW13 
		
		out.println("Hello, I'm HW12 " + name);
		
		out.println("<hr>");
		
		RequestDispatcher dispatcher2 = request.getRequestDispatcher("hw14.html");
		
		dispatcher2.include(request, response);
		
		out.println("<hr>");
		
		out.flush();
	}

}
