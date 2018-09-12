package tw.dh46.jeehw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *	20180909AM1 HW27_Cookie
 *	認識網頁Cookie: 建立Cookie
 *	
 *	網頁操作是無狀態, 每一次的請求都是單一事件. (請求回來就忘了)
 *	如何保留上一次的資訊? (記得特定用戶的資訊)
 *	1. 用戶端儲存: 用戶個人資訊
 *	2. 伺服端儲存: 針對該用戶與Server間本次連線的資訊(關鍵性資料), 一旦連線結束就成一個區段Session.
 *	伺服端通常不會儲存太多資料 => 避免對伺服器造成負擔
 *	
 *	前端撈得到後端建立的Cookie, 但其操作僅活在用戶端瀏覽器
 *	那後端撈得到瀏覽器建立的Cookie嗎? => HW28
 *
 *	Cookie應用:
 *	1. 網站記住我功能(RememberMe)
 *	2. 
 */

@WebServlet("/HW27_Cookie")
public class HW27_Cookie extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		//	建立Cookie物件: 帶入key&value
		Cookie cookieRemember = new Cookie("remember", "true");
		//	.setMaxAge: cookie 存活時間 (秒為單位)
		cookieRemember.setMaxAge(1*60);	
		// 加上cookie
		response.addCookie(cookieRemember); 
		
		//	建立Cookie物件: 帶入key&value
		Cookie cookieRemember2 = new Cookie("user", "abc");
		// .setMaxAge: cookie 存活時間 (秒為單位)
		cookieRemember2.setMaxAge(1 * 60);
		// 加上cookie
		response.addCookie(cookieRemember2);

		//	建立Cookie物件: 帶入key&value
		Cookie cookieRemember3 = new Cookie("code", "123456789");
		// .setMaxAge: cookie 存活時間 (秒為單位)
		cookieRemember3.setMaxAge(1 * 60);
		// 加上cookie
		response.addCookie(cookieRemember3);
		
	}


}
