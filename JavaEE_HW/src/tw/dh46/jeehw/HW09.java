package tw.dh46.jeehw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 	Servlet implementation class HW09
 * 	20180902PM2 前端資料處理
 * 	
 * 	多個值的表單處理
 * 	
 */
@WebServlet("/HW09")
public class HW09 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gender = request.getParameter("gender");
		System.out.println(gender);
//		String hobby = request.getParameter("hobby");
//		System.out.println(hobby);
		
		//	接收多選值
		String[] hobbies = request.getParameterValues("hobby");
		for (String hobby: hobbies) {
			System.out.println(hobby);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
