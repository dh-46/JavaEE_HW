package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *	Servlet implementation class HW40_thread
 *	20180929PM1 Thread
 *	Servlet中的執行緒
 */
@WebServlet("/HW40_thread")
public class HW40_thread extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int a = 0;
		//	寫個無窮迴圈
		while( true ) {
			a = (int)(Math.random()*20+1);
			
			//	在Console顯示
			System.out.println(a);
			
			//	印出網頁
			out.println(a);
			
			//	設定斷點
			if (a == 18) {
				out.println("Over!");
				break;
			} else {
				//	每間格一秒印一次
				try {
					Thread.sleep(1*1000);
				} catch (Exception e) {
					System.out.println(e);
				}
			}
			
		}
		
		/*	重點:
		 * 	Console會每一秒輸出數字
		 * 	但是網頁會一直處於載入中, 待全部跑完後再一次印出. (使用者端一直在等候回應)
		 * 	
		 * 	=> 網頁的載入是一次性的
		 * 
		 */
	}

}
