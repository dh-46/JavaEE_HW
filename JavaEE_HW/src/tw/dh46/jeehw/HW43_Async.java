package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 	Servlet implementation class HW43_Async
 * 	0929PM1 非同步 Async (跟41很類似)
 * 	
 * 	Executors
 * 	ExecutorService
 * 	
 * 
 * 	1. 定義非同步的任務
 * 	2. annotation要標註非同步任務
 * 	
 * 	跟執行緒有些相像?
 * 	
 * 	補充: 手機推播的延遲回應 => HW44
 * 	手機推播在背景像伺服器提出要求, 有事情伺服器再回覆
 * 	讓使用者的要求等待, 有事件時再傳回
 */
 
@WebServlet(
		urlPatterns = "/HW43_Async",
		asyncSupported=true
		)
public class HW43_Async extends HttpServlet {
	//	透過Excutors取得執行緒池 在執行緒池裡內執行(幾個thread) 讓執行緒並行執行
	private ExecutorService excutorService = Executors.newFixedThreadPool(10);
	//	宣告
	AsyncContext asyncContext;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		//	從request身上拿到AsyncContext並執行
		asyncContext = request.startAsync();
		//	交給executorService執行一個任務(Runnable Command)
		excutorService.execute(new AsyncRequest());
		
		
		//	out.println("HW43_Async OK");
		//	System.out.println("HW43_Async OK");
		
		out.println("END");
	}
	
	@Override
	public void destroy() {
		// Server摧毀前sysout
		System.out.println("Destroy");
		
		//	關閉線程
		excutorService.shutdown();
		
		super.destroy();
	}
	
	
	private class AsyncRequest implements Runnable {
		//	定義一個非同步的任務: 實作Runnable介面 (執行緒)
		@Override
		public void run() {
			// 一次性的任務 實作Run方法
			try {
				Thread.sleep(10*1000);
				
				//	使用非同步輸出
				//	以往request是處理完後馬上回應, 但這裡是延遲回應
				PrintWriter out = asyncContext.getResponse().getWriter();
				
				int rand = (int)(Math.random()*49+1);
				out.println("OK: " + rand);
				
				//	非同步任務完成
				asyncContext.complete();
			} catch (InterruptedException e) {
				System.out.println(e);
			} catch (IOException e) {
				System.out.println(e);
			};
		}
	}
}
