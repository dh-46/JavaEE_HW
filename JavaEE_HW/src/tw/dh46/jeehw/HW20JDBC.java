package tw.dh46.jeehw;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 	20180908AM2 HW20JDBC
 * 	JDBC Servlet
 * 	載入mySQL JDBC Driver
 * 	在Servlet中
 * 	外部的JDBC Driver要放在WebContent\WEB-INF\lib
 * 	而非像JavaSE是使用BuildPath的方式
 * 	=> 其實以前SE是在專案下建立lib資料夾再把外部檔案放入
 */
@WebServlet("/HW20JDBC")
public class HW20JDBC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("OK");
		} catch (ClassNotFoundException e) {
			System.out.println(e.toString());
		}
		
	}

}
