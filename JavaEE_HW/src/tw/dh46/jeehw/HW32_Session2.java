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
 *	20180909AM2 HW32_Session2
 *	
 *	=> Session 存在於Request裡面 有兩招可以取出
 *	=> 注意! 不會刻意new出session物件
 *	
 *	結合HW22(檢查帳密用)
 *	hw22.html(login) ==> HW22(checkPassword) ==> HW32
 *											 ==> false (hw22.html)			
 */
@WebServlet("/HW32_Session2")
public class HW32_Session2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		/*	
		 *	取得session的第二招
		 *	request.getSession(boolean create);
		 *	=> boolean-->是否要 create 新的session物件
		 *	=> 自訂是否要建立
		 *
		 *	無傳參數
		 *	=> 針對本次連線回傳目前的session, 若無session則自動建新的.
		 *	
		 *	HW32:
		 *	=> false: 就是要拿現在的session
		 *	
		 *	瀏覽器關閉session就會結束.
		 */
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			//	沒有session物件實體: 不能登入>趕走
			//	response.sendRedirect("hw32_login.html");
			
			//	跟HW22資料庫帳號密碼結合
			response.sendRedirect("hw22_login.html");
		} else {
			//	取得屬性並強制轉型回HWMember
			HWMember member = (HWMember)session.getAttribute("member");
			out.println(member.getName() + " : " + member.getAccount());
			out.println("<hr>");
			out.println("<a href='HW32_Logout'>登出</a>");
		}
	}
}
