package tw.dh46.jeehw;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

/*	20180929PM2 傾聽器_RequestListener
 * 	傾聽器:
 * 	=>	Web容器上的傾聽 (全體性)
 * 	=>	事件觸發後做的事
 * 	=>	常用於系統管理面 (同時間的上站人數...etc)
 * 	=>	只要寫在servlet上就可以
 * 
 * 	RequestListener
 * 	==> 適合蒐集用戶端要求的相關資訊
 * 	==> 對伺服器的任何Request都會捕捉
 */

//	傾聽器一定要加上下面的Annotation!!
//@WebListener
public class HWRequestListener implements ServletRequestListener{
	
	@Override
	public void requestInitialized(ServletRequestEvent event) {
		System.out.println("Request coming...");
		ServletRequest request = event.getServletRequest();
		//	從request上取得相關資訊
		String ip = request.getRemoteAddr();
		int port = request.getLocalPort();
		System.out.println("Remote ip: " + ip + " : " + port);
	}
	
	@Override
	public void requestDestroyed(ServletRequestEvent event) {
		System.out.println("Request ended");
	}

	
	
}
