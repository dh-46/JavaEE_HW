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
 *	20180909AM2 HW32_Logout
 *	HW32 登出
 *	將登入的session失效
 */
@WebServlet("/HW32_Logout")
public class HW32_Logout extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			//	將登入的session失效
			session.invalidate(); 
		}
		
		out.println("登出成功!<br>");
		out.println("<a href='hw22_login.html'>重新登入</a>");
	}


}
