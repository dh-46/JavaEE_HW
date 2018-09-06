package tw.dh46.jeehw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *	Servlet implementation class HW03
 *	20180902AM2 00:26:04
 *	servlet 運作方式與流程
 *
 *	
 */
@WebServlet("/HW03")
public class HW03 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 由service來判斷執行doGet or doPost
		//super.service(req, resp); // 會由service判斷, 呼叫 doGet
		System.out.println("service()"); // 第一次重啟時被呼叫
		doGet(req, resp);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet"); // 有service時重啟自動沒出現, service註解後再重啟有自動出現
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doGet(request, response); 	// 事情都交給doGet做, 模擬php功能
	}

}
