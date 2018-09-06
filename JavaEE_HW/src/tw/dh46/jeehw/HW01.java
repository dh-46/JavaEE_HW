package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *	Servlet implementation class HW01
 *	20180902AM1
 *	Servlet 介紹
 *	1. 一樣有屬性方法建構式
 * 	2.annotation: 提醒編譯器做特定事情裡面還可下參數
 * 	3.HW01類別繼承httpServlet
 * 	4.serialVersionUID = 1L; => 版本控制用
 * 	5.@see => 意思是參考 for javadoc
 * 	6.doGet/doPost方法
 * 		doPost預設呼叫 doGet方法 (不要用可以砍)
 * 	7.建構式super也可以砍(複習:物件導向預設就是會呼叫父類別的無傳參數建構式)
 * 	
 * 	8.啟動server
 * 		console紅字為伺服器log
 * 	9.reload: 客戶端向伺服器索取新的資料 
 * 		(伺服器servlet是對全世界營業的物件實體,只有一個,建構式只跑一次/ 除非又重新編譯,)
 * 		doGet是別人呼叫過來的(reload的時候)
 * 	10.https://tomcat.apache.org/tomcat-7.0-doc/servletapi/index.html
 * 		javax.servlet.http
 * 			javax.servlet.http.HttpServlet (=>抽象類別業界多實作)
 * 				doGet, if the servlet supports HTTP GET requests (網址列90%是這個)
 * 				doPost, for HTTP POST requests
 * 				doPut, for HTTP PUT requests
 * 				doDelete, for HTTP DELETE requests
 * 		Interface HttpServletRequest
 * 		=> 在HW01的時候已經被實作該物件實體(請看參數)
 * 	11.HttpServletResponse => .getWriter (java.io)
 * 	12.HTML/JS每次的要求都是獨立的,本身是無狀態的, 是後端程式讓前端處在有狀態的模式.
 * 	
 */
@WebServlet("/HW01")
public class HW01 extends HttpServlet {
//	private static final long serialVersionUID = 1L;
    
	private static int a;
	private int b;
    public HW01() {
        System.out.println("HW01");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		PrintWriter pw = response.getWriter();
		pw.append("<h1>JavaEE_HW01</h1><br>");
		pw.append("<hr><br>");
		pw.append("<h3>20180906 Review</h3>");
		pw.append("a= " + a++ + "<br>");
		pw.append("b= " + b++ + "<br>");	// 兩個數字跳一樣 : 因為servlet只有一個物件實體, 不管是否為static
		pw.flush(); // pw是輸出, 建議記憶體要衝出
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
