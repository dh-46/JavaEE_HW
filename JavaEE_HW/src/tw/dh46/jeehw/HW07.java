package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *	Servlet implementation class HW07
 *	20180902PM1	參數傳遞練習v2 
 *	加加計算機v2 (自己呼叫自己)
 *	
 *	讓畫面更新時不是跳轉而是直接更新
 * 	增強Lab06
 * 	如何與前端互動
 * 
 * 	網路上傳遞的資料訊息	=> 字串!
 */
@WebServlet("/HW07")
public class HW07 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String result = ""; // 最後顯示結果的字串
		String option = request.getParameter("option");
		int intX = 0;
		int intY = 0;
		boolean isInit = true;
		
		try {
			intX = Integer.parseInt(x);
			isInit = false;
			// 預防輸入值不是數字, 所以要try catch
		} catch (NumberFormatException e) {
			System.out.println(e);
			x="";
		}
		
		try {
			intY = Integer.parseInt(y);
			isInit = false;
		} catch (NumberFormatException e) {
			System.out.println(e);
			y="";
		}
		
		if (!isInit) {
			int ans = 0;
			switch (option) {
			case "1":
				ans = intX + intY;
				break;
			case "2":
				ans = intX - intY;
				break;
			case "3":
				ans = intX * intY;
				break;
			case "4":
				try {
					ans = (int)(intX / intY);
				} catch (Exception e) {
					System.out.println(e);
					ans = 0;
					result = "無法除以 ";
				}
				break;
			default:
				System.out.println("ERROR");
				break;
			}
			result += ans;
		} else {
			option = "";
		}
		
		response.setContentType("text/html; charset=UTF8");
		PrintWriter writer = response.getWriter();
		//	載入畫面
		writer.append("<h2>加減乘除計算機(參數傳遞練習v2)</h2>");
		writer.append("<hr>");
		writer.append("<form action='HW07'>");
		// 透過變數x 讓計算完成時數字仍保留在欄位上
		writer.append("<input type='text' name='x' value="+ x +">");	
		writer.append(" <select name='option'>");
		// 三元運算式: 當option是誰就該項被選擇 (動態的改變)
		writer.append("<option value='1'" + (option.equals("1")?"selected":"") + ">+</option>");	
		writer.append("<option value='2'" + (option.equals("2")?"selected":"") + ">-</option>");
		writer.append("<option value='3'" + (option.equals("3")?"selected":"") + ">x</option>");
		writer.append("<option value='4'" + (option.equals("4")?"selected":"") + ">/</option>");
		writer.append("</select> ");
		// 透過變數y 讓計算完成時數字仍保留在欄位上
		writer.append("<input type='text' name='y' value="+ y +">");
		writer.append("  <input type='submit' value='='>");
		writer.append("  "+ result);
		writer.append("</form>");
		
		writer.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
