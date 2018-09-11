package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *	20180908PM1 HW21_SignUp
 *	建立簡易會員註冊畫面
 *	並與MAMP資料庫連接
 *	Servlet-->mySQL Server
 *	
 */
@WebServlet("/HW21_SignUp")
public class HW21_SignUp extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		//		開發階段開啟doGet轉至doPost做
		//		開發完成後將doGet裡的doPost註解	=> 讓使用者無法使用doGet
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		
		//	確認可以收到資料
		out.println("Account: " + account);
		out.println("Password: " + password);
		out.println("Real Name: " + realname);
		out.println("<hr>");
		
		//	密碼編碼: BCrypt
		String password2 = BCrypt.hashpw(password, BCrypt.gensalt());
		out.println("Hashed Password: " + password2 + "<br>");
		out.println("Hashed Length: " + password2.length());
		
		//	比對密碼是否正確的方法
		//	boolean isCorrect = BCrypt.checkpw(password, password2);
		//	out.println("T/F: " + isCorrect);
		
		createAccount(account, password2, realname);
	}
	
	private void createAccount(String account, String password, String realname) {
		//	將接收的帳號資料存入資料庫中
		
		
		try {
			//	1. 連接資料庫(JDBC)
			// JAVA 專案裡面可以不加Class.forName/ 但是JavaEE載入一定要加上
			Class.forName("com.mysql.jdbc.Driver");
			Properties prop = new Properties();
			
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbchw", prop);
			
			//	2. 操作資料庫
			String sql = "INSERT INTO `accounts` (account, password, realname) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, account);
			pstmt.setString(2, password);
			pstmt.setString(3, realname);
			pstmt.executeUpdate();
			
			System.out.println("Insert OK");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}

}
