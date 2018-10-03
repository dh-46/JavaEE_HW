package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.AsyncContext;
import javax.servlet.AsyncEvent;
import javax.servlet.AsyncListener;

/*	
 * 	20180929PM1	非同步的傾聽器
 * 	1:01:28
 * 	實作AsyncListener
 * 	
 * 	每次使用者reload都會觸發doGet
 * 	doGet每次呼叫的點是service再分get/post
 * 	init則是一次性的呼叫
 * 
 * 	
 */

public class HWAsyncListener implements AsyncListener{

	@Override
	public void onComplete(AsyncEvent event) throws IOException {
		//	事件發生觸發
		System.out.println("Complete");
		
		//	事情完成後會做甚麼事
		
		//	從event物件取得這次AsyncContext (是誰的event)
		AsyncContext asyncContext = event.getAsyncContext();
		PrintWriter out = asyncContext.getResponse().getWriter();
		
		//	取得hw44_init的資料陣列
		List<AsyncContext> asyncs = (List<AsyncContext>)asyncContext.getRequest().getServletContext().getAttribute("asyncs");
		
		//	第幾個任務
		int i = asyncs.indexOf(asyncContext);
		
		//	移除這次所拿到的asyncContext
		// asyncs.remove(asyncContext);
		
		out.println(i + " : " + (int)(Math.random()*49+100));
		
	}

	@Override
	public void onError(AsyncEvent event) throws IOException {
		System.out.println("Error");
		AsyncContext asyncContext = event.getAsyncContext();
		//		取得hw44_init的資料陣列
		List<AsyncContext> asyncs = (List<AsyncContext>)asyncContext.getRequest().getServletContext().getAttribute("asyncs");
		
		
		//	移除這次所拿到的asyncContext
		asyncs.remove(asyncContext);
		
		
	}

	@Override
	public void onStartAsync(AsyncEvent event) throws IOException {
		System.out.println("StartAsync");
	}

	@Override
	public void onTimeout(AsyncEvent event) throws IOException {
		System.out.println("Timeout");
		
		
		AsyncContext asyncContext = event.getAsyncContext();
		//		取得hw44_init的資料陣列
		List<AsyncContext> asyncs = (List<AsyncContext>)asyncContext.getRequest().getServletContext().getAttribute("asyncs");
			
		//	移除這次所拿到的asyncContext
		asyncs.remove(asyncContext);
	}
	
}
