package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *	20180909AM1 HW29_except
 *	Servlet的例外處理
 *	
 *	錯誤訊息畫面不該透漏太多資訊
 *	=> 應該都是要開發端處理過的資訊
 *	=> 解法:
 *	1. 利用 response.sendError() "指定"例外發生時回應給使用者的錯誤訊息(狀態碼)
 *	..狀態碼可以認識一下!
 *	2. 將使用者轉向到另外一個頁面: response.sendRedirect();
 *	
 */
@WebServlet("/HW29_except")
public class HW29_except extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//	回應的編碼與文件格式
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			//	輸入端的編碼控制 (確保進出的編碼一致)
			request.setCharacterEncoding("UTF-8");
			
			int a = 10, b = 0;
			
			try {
				out.println(a/b);
			} catch (Exception e) {
				//response.sendError(HttpServletResponse.SC_REQUEST_TIMEOUT, "Server Busy");
				response.sendRedirect("HW30_redirect");
			}
			
	}
}
