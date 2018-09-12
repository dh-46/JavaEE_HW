package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*	
 * 	20180909AM1 HW30_redirect
 * 	網頁轉向
 * 	=>HW29轉到HW30
 * 	=>網址列URL會換掉
 * 	
 * 	注意 redirect與dispatcher.forward的差異
 * 	=> RequestDispatcher: 請求還沒回應時處理是否forward或include
 * 	=> response.redirect: 請求處理完了決定要不要帶走
 */
@WebServlet("/HW30_redirect")
public class HW30_redirect extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		out.println("沒事啦");
	}

}
