package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 	Servlet implementation class HW42_timer
 * 	0929PM1 結束41的Timer/TimerTask (週期任務)
 *	
 *	
 *	瀏覽器等伺服器端回應	=> 同步(照步數啦)
 *	
 *	
 */
@WebServlet("/HW42_timer")
public class HW42_timer extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
//		//	取得HW41的Timer物件 然後在結束他
//		HttpSession session = request.getSession();
//		Timer timer = (Timer)session.getAttribute("timer");
//		timer.cancel();	//	結束timer
//		timer.purge();	//	移除該timer所有task
//		timer = null;
//		
//		//	session失效
//		session.invalidate();
		
		//	如果是改成移除個別task呢?
		/*	
		 * 	複習一下: 內部類別的存取修飾字
		 * 	=> task1 & task2 都是內部類別 
		 * 		沒有加上存取修飾
		 * 		==>相同package OK
		 */
		
		HttpSession session = request.getSession();
		HW41_timer.MyTask task1 = (HW41_timer.MyTask)session.getAttribute("task1");
		HW41_timer.MyTask2 task2 = (HW41_timer.MyTask2)session.getAttribute("task2");
		
		if (task1 == null && task2 != null) {
			task2.cancel();
			task2 = null;
			session.removeAttribute("task2");
		} else if (task1 != null){
			task1.cancel();
			task1 = null;
			session.removeAttribute("task1");
		} else {
			out.println("No more tasks!");
			session.invalidate();
		}
		
	}

}
