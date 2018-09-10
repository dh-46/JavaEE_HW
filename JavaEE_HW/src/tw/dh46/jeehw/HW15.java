package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *	20180908AM1 HW15 01:26:00
 *	Dispatcher-forward
 *	
 *	=> 整個內容forward HW16, 但使用者看到的依然是HW15
 * 	
 * 	NOTE:
 * 	大部分在玩的都是request的變化
 * 	response=>基本上就只是輸出
 */
@WebServlet("/HW15")
public class HW15 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		RequestDispatcher dispatcher1 = request.getRequestDispatcher("HW16");
		
		out.println("<h2>Dispatcher--Forward (HW15) </h2>");
		
		String name = request.getParameter("name");
		
		if ( name == null) {
			dispatcher1.forward(request, response);
		} else {
			out.println("Hello, " + name);
		}
		
		out.flush();
	}


}
