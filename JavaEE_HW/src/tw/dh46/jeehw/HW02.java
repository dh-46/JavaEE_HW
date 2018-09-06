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
 * 	Servlet implementation class HW02
 * 	20180902AM2
 * 	request: 使用者提出要求
 * 	封包: Header + Body
 * 	封包的相關資訊	=> Header => 要拿header data要知道header name
 * 	
 * 	Interface Enumeration<E>
 * 		hasMoreElements()
 * 		nextElement()
 * 	https://docs.oracle.com/javase/7/docs/api/java/util/Enumeration.html
 * 	
 * 	重點:
 * 	後端坐後端該做的事, 拿到不同的請求而做不同的回應, 形成有狀態的感覺, 運用後端資源(IO/FileSystem/DB).
 * 	但是, 任何的HTTP的要求都是無狀態, 在通訊協定中HTTP是屬無狀態的通訊協定. 每一次的要求回復都是特定獨立.
 * 	
 */
@WebServlet("/HW02")
public class HW02 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		Enumeration<String> headerNames = request.getHeaderNames();
		while (headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			String value = request.getHeader(headerName); // 利用name取得header資料
			
			writer.append("<!DOCTYPE html>");	// 讓瀏覽器知道這是HTML
			writer.append(headerName+" : "+value+"<br>");
			System.out.println(headerName+" : "+value);
		}
		writer.flush(); // 不用關閉, 會自動關閉
	}

}
