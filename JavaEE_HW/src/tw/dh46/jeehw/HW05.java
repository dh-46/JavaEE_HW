package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 	Servlet implementation class HW05
 * 	20180902AM2 
 * 	前端網頁HW04 對應到後端 HW05
 * 	=> 體會前端資料傳送到後端
 * 
 * 	1.	先將Get&Post各放入一個sysout => 啟動後觀察前端點選登入後, console的變化
 * 	2.	前端調整傳遞方式(post/get)	=> 資料的傳遞方式是前端決定
 * 	3.	get方法會在網址列顯示參數/Post方法不會顯示參數
 * 	4.	後端service會判斷使用何種方法
 * 	5.	兩個方法統一讓自訂的doTask()處理
 * 	6.	前端
 */
@WebServlet("/HW05")
public class HW05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doTask(request, response, "get");	// 都讓doTask做
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doTask(request, response, "post"); 
		// 都讓doTask做(追加String參數 讓人知道是哪一個, 但其實資訊就在Header裡)
	}
	
	private void doTask(HttpServletRequest request, HttpServletResponse response, String taskname) throws ServletException, IOException{
		// System.out.println("doTask" + taskname);
		
		// 讓網頁在不同瀏覽器的預設表現統一化 
		// 讓瀏覽器知道資料類型(務必在writer前先做)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		Enumeration<String> params = request.getParameterNames();	// 抓取所有參數名稱
		while (params.hasMoreElements()) {
			String param = params.nextElement();
			String value = request.getParameter(param); // 取得每個參數 (若有隱藏欄位也可撈出, 建議都可撈一下!)
			String nvalue = new String(value.getBytes("ISO8859-1"), "UTF8"); //	轉換編碼
			writer.append(param+": "+ nvalue + " ( "+ value+ " )"+"<br>");
			
			/*	收到的中文字輸出後有亂碼	=>解決方案?
			 *	
			 *	先知道=>網路傳輸預設編碼是ISO8859-1 
			 *	
			 *	把輸入的資料轉換成byte陣列(設定為原始編碼)
			 *	再轉成需要的編碼字串
			 */
			
		}
		
		// 輸出
		writer.append("<h1>歡迎登入本系統</h1>");
		writer.flush();
		
	}
}
