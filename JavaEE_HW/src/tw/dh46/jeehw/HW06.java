package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *	Servlet implementation class HW06
 *	20180902PM1	參數傳遞練習
 *	加加計算機
 *	
 *	=>	送出後結果跳到另一個畫面
 *	=>	與期待的有點不相符: 原畫面更新
 *		==>	讓他自己呼叫自己 HW07
 */
@WebServlet("/HW06")
public class HW06 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		int intX = 0;
		int intY = 0;
		
		try {
			intX = Integer.parseInt(x);
			// 預防輸入值不是數字, 所以要try catch
		} catch (NumberFormatException e) {
			System.out.println(e);
		}
		
		try {
			intY = Integer.parseInt(y);
		} catch (NumberFormatException e) {
			System.out.println(e);
		}
		
		
		int ans = intX + intY;
		
		response.setContentType("text/html; charset=UTF8");
		PrintWriter writer = response.getWriter();
		writer.append(x+" + "+y+" = "+ans);
		writer.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
