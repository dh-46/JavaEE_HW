package tw.dh46.jeehw;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 	Servlet implementation class HW45_forSessionL
 * 	0929PM2 for SessionListener連線資料庫
 * 	
 * 	實務上可視情況將連線做在不同層級
 */
@WebServlet("/HW45_forSessionL")
public class HW45_forSessionL extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		
		HttpSession session = request.getSession();
		System.out.println("Session ID: " + session.getId());
		
		//	把Listener放到servletContext中的connection拿出來用
		ServletContext servletContext = request.getServletContext();
		
		
		try {
			Connection conn = (Connection)servletContext.getAttribute("conn");
			Statement stmt = conn.createStatement();
			
			stmt.executeUpdate("INSERT INTO `cust` (name, tel, birthday) VALUES ('Tom', '0800080080','2018-10-03')");
			System.out.println("Insert OK");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
