package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 *	20180909AM2 HW31_Session
 *	Session
 *	=> 存在於Servlet
 *	
 *	Servlet有四種層級存取 (由小到大排列)
 * 	1.	Page Conext: 層級最小
 * 	2.	Request: 頁面之間
 * 	3.	Session: 多次Request
 * 	4.	Application: 全server
 * 	=> 四者都有attribute 屬性設定
 * 	=> 注意! 與getParameter(get/post取得的)無關!!
 * 	
 * 	這個範例模擬會員登入成功後要做的事情
 */
@WebServlet("/HW31_Session")
public class HW31_Session extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		//	透過request取得session
		HttpSession session = request.getSession();
		
		HWMember member = new HWMember("John", 30, "john123");
		
		//	儲存HWmember物件到session中 (value: Object)
		//	儲存物件的好處=> 純字串資料比較亂
		session.setAttribute("member", member);
		
		out.println("Session Added");
		
		
		//	session 其他方法
		//	session停留的時間設定(若有新request到server, 會重新計時. 沒有request==前端沒動作)
		//	值設為0則永不timeout, 除非使用者關閉瀏覽器.
		//	session.setMaxInactiveInterval(30);
		//	session.getLastAccessedTime(); // 取得最後存取時間
		//	session.isNew(); //判斷是否為新的session
	}
}
