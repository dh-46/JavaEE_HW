package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *	20180909AM1 HW28_Cookie2
 *	後端存取瀏覽器上的Cookie資料
 *	=> 從Request上撈 (用戶端發出的request上會夾帶cookies)
 *	
 *	Cookie: 前端搭配運作=>LocalS; 後端搭配運作=>資料庫
 *	
 *	不用太相信網路XD => 不論使用者勾選記憶帳號與否, 開發者都會拿得到
 *
 *	HW: RememberMe
 *	帳號密碼登入後會驗證資料庫
 *	如果使用者選擇rememberme, 1小時內登出後系統會自動登入
 *	密碼要加密
 *
 *	cookies是針對各自的瀏覽器, 不同的瀏覽器擁有不同的localstorage & cookies & session
 *	用戶端有可能限制cookie存取, 造成開發上的困難
 *	
 *	
 */
@WebServlet("/HW28_Cookie2")
public class HW28_Cookie2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//	回應的編碼與文件格式
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		//	輸入端的編碼控制 (確保進出的編碼一致)
		request.setCharacterEncoding("UTF-8");
		
		//	取得用戶端Cookie
		Cookie[] cookies = request.getCookies();
		
		//	把資料放到HashMap
		HashMap<String, String> cookieMap = new HashMap<>();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				String key = cookie.getName();
				String value = cookie.getValue();
				//String path = cookie.getPath(); // 取得路徑
				cookieMap.put(key, value);
			}
		}
		
		if (cookieMap.containsKey("user")) {
			out.println(cookieMap.get("user"));
		} else {
			out.println("User not found");
		}
		
		if (cookieMap.containsKey("remember")) {
			out.println(cookieMap.get("remember"));
		} else {
			out.println("remember not found");
		}
	}


}
