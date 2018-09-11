package tw.dh46.jeehw;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 	20180908PM1 HW22_PWCheck
 * 	延續HW21 => 如何進行帳號密碼比對
 * 	
 * 	=>將功能邏輯寫到java class檔中讓servlet呼叫
 * 	==>不用處理太多邏輯
 */
@WebServlet("/HW22_PWCheck")
public class HW22_PWCheck extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//	測試加鹽方法&驗證是否密碼相同
//		String p1 = "123456";
//		String p3 = "123456";
//		String p2 = BCrypt.hashpw(p1, BCrypt.gensalt());
//		System.out.println("p1: " + p1);
//		System.out.println("p2: " + p2);
//		System.out.println(BCrypt.checkpw(p3, p2));
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//	1. 拿到參數
		//	2. 到資料庫拿該帳號的資料 (登入失敗: 沒有此帳號)
		//	3. 比對該帳號的密碼與輸入的密碼 (登入失敗: 密碼不符) => 寫成API
		//	4. 回傳登入成功
		
		/*	寫成獨立API的好處:
		 * 	1. 之後在開發上可再重複使用, 形成自己的工具包.
		 * 	2. 維護性較高
		 * 	3. 讓servlet程式精簡, 不用處理太多邏輯
		 */
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		Properties prop = new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbchw", prop);
			
			String sql = "SELECT account, password, realname FROM `accounts` WHERE account=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, account);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String src = rs.getString("password");
				if (HW_PWCheck.checkPassword(src, password)) {
					String realname = rs.getString("realname");
					out.println(realname + " 歡迎回來!");
				} else {
					out.println("登入失敗: 請重新確認帳號與密碼。");
				}
				
			} else {
				out.println("登入失敗: 請重新確認帳號與密碼。");
			}
		} catch (Exception e) {
			out.println("登入失敗: " + e.toString());
		}
		
	}

}
