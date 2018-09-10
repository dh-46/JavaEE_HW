package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 	Servlet implementation class HW13
 * 	20180908AM1 Dispatcher
 * 	=>	被include到HW12中
 */
@WebServlet("/HW13")
public class HW13 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		//	HW12夾帶參數Name給HW13
		String name = request.getParameter("name");
		
		out.println("Hello, I'm HW13." + name);
	}

}
