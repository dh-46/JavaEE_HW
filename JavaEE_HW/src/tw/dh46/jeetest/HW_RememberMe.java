package tw.dh46.jeetest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*	
 *	20180909Homework HW_RememberMe
 *
 *	製作簡易登入系統
 *	使用者勾選RememberMe, 登出後24小時內可自動登入.
 *	用戶登入後, 伺服端將資料儲存到cookie
 *	用戶登出, cookies記憶, 使用者下次進入的時候自動登入
 *	
 *	1. 登入後有勾就產生物件儲存在cookie
 *	2. 下次登入的時候如果有cookie而且沒過期, 取出物件中的帳號密碼自動登入	
 *
 *	登入畫面: hw_login.jsp (javascript)
 *	密碼驗證: java.class
 *	控制: 資料庫連線/跳轉  HW_RememberMe
 */
@WebServlet("/HW_RememberMe")
public class HW_RememberMe extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		out.println("Hello" + account + " " + password + " " + remember );
		
		
	}
}
