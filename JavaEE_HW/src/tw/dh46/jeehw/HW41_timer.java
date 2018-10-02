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
 * 	Servlet implementation class HW41_thread
 * 	20180929PM1 Servlet有支援Timer嗎?
 * 
 * 	應用: 遠端控制伺服器的關鍵動作?
 * 	通常是針對資料庫操作
 * 
 * 	==> 另類運用:
 * 	專案客戶要求先給原始碼再付款, 可在原始碼內種類似的東西,限制核心功能, 待收款再開通XD
 */
@WebServlet("/HW41_thread")
public class HW41_timer extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Timer timer = new Timer();
		MyTask task1 = new MyTask();
		MyTask2 task2 = new MyTask2();
		
		
		//	排任務(任務物件,延遲時間,間格時間)
		timer.schedule(task1, 0, 1*1000);
		timer.schedule(task2, 0, 2*1000);
		
		//	把timer & task物件放到session中
		HttpSession session = request.getSession();
		session.setAttribute("timer", timer);
		session.setAttribute("task1", task1);
		session.setAttribute("task2", task2);
		
		//	直接印出, 但timer沒喊停仍持續在背景運作
		//	應用: 競標網站, 每一筆標是一筆資料, 如何判斷結標?
		//	每一分鐘到資料庫確認是否有資料吻合結標, 再異動資料庫

		out.println("End");
	}
	
	//	內部類別: 任務
	class MyTask extends TimerTask {
		@Override
		public void run() {
			System.out.println("1: " + (int)(Math.random()*49+1));
		}
	}
	
	class MyTask2 extends TimerTask {
		@Override
		public void run() {
			System.out.println("2: " + (int)(Math.random()*20+1));
		}
	}

}


