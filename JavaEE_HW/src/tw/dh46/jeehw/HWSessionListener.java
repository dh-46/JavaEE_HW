package tw.dh46.jeehw;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/*	20180929PM2_Session Listener
 * 	
 * 	session連線建立時觸發行為
 * 	=> 使用同一個connection 讓servlet不用一直重複建立connection
 * 	=> 實務上視情況調整範圍
 * 
 * 	傾聽器只是傾聽 無法改變其原本該走的路
 * 	=>但是 過濾器filter可以做過濾與判斷
 */

@WebListener
public class HWSessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		//	Session連線建立的時候 建立與資料庫連線
		System.out.println("Session Created");
		
		//	取得servletContext
		ServletContext servletContext = event.getSession().getServletContext();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/jdbchw", "root", "root");
			
			//	把connection放入ServletContext中
			servletContext.setAttribute("conn", conn);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		//	Session結束時 結束資料庫連線
		
	}
	
	
	//	寫錯: 以下是ServletContextListener
//	@Override
//	public void contextInitialized(ServletContextEvent sce) {
//		ServletContext servletContext = sce.getServletContext();
//		servletContext.setAttribute("key", "value");
//		
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/iii", "root", "root");
//			
//			//	把連線的物件實體放到servletContext
//			servletContext.setAttribute("conn", conn);
//		
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	@Override
//	public void contextDestroyed(ServletContextEvent sce) {
//		//	servletContext連線結束 就把資料庫連線中斷
//	}
	
}
