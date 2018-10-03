package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.AsyncContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 	Servlet implementation class HW44_Async2
 * 	20180929PM1 非同步的程序如何進行
 * 		
 * 	init --> service --> doGet
 * 
 * 	==> 任務加入傾聽器 了解事件的狀態
 * 
 * 	複製網址列讓他同時執行 看變化
 */
@WebServlet( 
		urlPatterns="/HW44_Async2",
		asyncSupported=true
)
public class HW44_Async2 extends HttpServlet {
	//	開立新線程
	private ExecutorService executorService = Executors.newFixedThreadPool(10);
	
	@Override
		public void init() throws ServletException {
			// init(); 一次性的行為
			super.init();
			
			System.out.println("HW44_init()");
			
			//	取得servletContext
			ServletContext servletContext = getServletContext();
			
			//	在起始的時候建立資料結構LinkedList, 將非同步的任務都放到裡面
			List<AsyncContext> asyncs = new LinkedList<>();
			//	把任務的資料結構放入servletContext中
			servletContext.setAttribute("asyncs", asyncs);
			
			//	把listener也放入servletContext中
			HWAsyncListener asyncListener = new HWAsyncListener();
			servletContext.setAttribute("asyncListener", asyncListener);
			
			//	任務跟傾聽者都放入servlectContext中, 預備任務完成
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("HW44_doGet");
		
		//	前置動作: 把init放進去的東西都拿出來
		ServletContext servletContext = getServletContext();
		List<AsyncContext> asyncs = (List<AsyncContext>)servletContext.getAttribute("asyncs");
		
		HWAsyncListener asyncListener = (HWAsyncListener)servletContext.getAttribute("asyncListener");
		
		//	真正在做的事
		//	啟動非同步任務 (做出一個單一任務)
		AsyncContext async = request.startAsync();
		//	增加傾聽器
		async.addListener(asyncListener);
		//	任務逾時10秒
		async.setTimeout(10*1000);
		
		//	把這次的任務加到list中 => 結束了資料結構仍存在?
		asyncs.add(async);
		
		System.out.println("Add a Task: AsyncRequest");
		
		//	把任務放入線程並執行
		executorService.execute(new AsyncRequest(async));
		
	}
	
	private class AsyncRequest implements Runnable {
		//	定義一個非同步的任務: 實作Runnable介面 (執行緒)
		//	前面doGet所寫的未定義任務給他
		
		private AsyncContext asyncContext;
		
		public AsyncRequest(AsyncContext asyncContext) {
			this.asyncContext = asyncContext;
		}
		
		@Override
		public void run() {
			// 一次性的任務 實作Run方法
			try {
				Thread.sleep(10*1000);
				
				//	使用非同步輸出
				//	以往request是處理完後馬上回應, 但這裡是延遲回應
				PrintWriter out = asyncContext.getResponse().getWriter();
				
				int rand = (int)(Math.random()*49+1);
				out.println("HW44_Ok: " + rand);
				
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
