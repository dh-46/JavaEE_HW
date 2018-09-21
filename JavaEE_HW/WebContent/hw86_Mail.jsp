<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
	電子郵件的發送要看要求為如何
	1. 請求Gmail發信 (要有Gmail帳號)
	2. 透過第三方發信 (要有該伺服器的帳號密碼)
	檔案: javax.mail.jar
	=>SMTP(發信), IMAP(收信, 線上閱讀要保持連線), and POP3(收信, 離線閱讀[下載下來看]) protocol providers
	
	**SMTP 原理
	=> 一連串的通訊動作構成一個session (非一次性)
	=> port: 25
	
	
	應用: 網站發送驗證信給用戶
 -->
 
 <!-- 
 **PUTTY 試玩hinet mail server
	=> 下載putty連線hinet mail server
	=> telnet port 25 (ms7.hinet.net)
	=> 連線成功session開始
	=> 回應數字(SMTP回傳碼: 220 連線成功)
	=> helo ms7.hinet.net
	=> mail from: xxxx@gmail.com ( return 250)
	=> rcpt to: xxxx$gmail.com (return )
	=> data
	=> 信件內容.
	=> subject: xxxxxx.
	=> quit
 	
 	[指令都是四個英文字 ]
 	
 	HW: 
 	1.	把telnet mailing寫成Java API
 	=> Server Socket & socket
 	=> SMTP本身是TCP (用ServerS 對 Socket)
 	=> 先用socket連接ms7.... port 25 
 	=> 過關後送字串指令(1. 可以等回應 2.或不等回應用執行緒連續發送指令)
 	=> thread sleep 500 再送下一句 * repeat直到打信件內容
 	=> 信件內容寫完
 	=> 結束
 	
 	2.	圖形驗證器 API
 	
 	3.	資料庫驗證(密碼加密) JSP版本
 	
 	4.	檔案上傳API
 	
 	5.	專題題目規劃...
  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW86_Mail ()</title>
</head>
<body>
	<%
		//	運用Google發信需要gmail帳號密碼
		final String username = "xxxx@gmail.com";
		final String password = "";
		
		//	2. 建構props (連線用的)
		Properties props = new Properties();
		//	注意: 參數資料須查google線上的設定
		//	https://support.google.com/mail/answer/7104828
		//	props.put("mail.smtp.auth", "true");	//	a. 授權
		//	props.put("mail.smtp.host", "smtp.gmail.com");	//	主機位址
		//	props.put("mail.smtp.post", "587");		//	TLS port
		//	props.put("mail.smtp.starttls.enable", "true");		// TLS 設定
		
		
		//	6. Google 驗證失敗 => 改用hinet server
		props.put("mail.smtp.host", "ms7.hinet.net");	//	hinet主機位址
		
		//	3. Authenticator 抽象類別 
		//	實作getPasswordAuthentication方法 會傳回 PasswordAuthentication
		Authenticator auth = new Authenticator(){
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(username, password);
			}
		};
		
		
		//	1. 呼叫javax.mail.Session static方法取得物件實體
		//		=> authenticator: 授權機制 (Gmail需要)
		//		有些mail server不用: 像是部分學校 => 易被當成垃圾信轉運站(跳板)
		//	**javax.mail.Session 注意變數命名不要重複 session 目前是代表隱含物件
		//	Session session2 = Session.getInstance(props, auth);
		Session session3 = Session.getInstance(props);
		
		try {
			//	4. 發送內容與對象 00:39:43
			//	MIME 格式: 可夾帶檔案(html/附件) [Newer]
			//	Telnet : 傳統純文字 [Old one]
			//	4-1. 建立Message物件實體 (選MIME)
			Message message = new MimeMessage(session3);
			//	4-2. send from
			message.setFrom(new InternetAddress("sender@gmail.com"));
			//	4-3. send to (單數給單人, 複數寄多人)
			message.setRecipient(RecipientType.TO, new InternetAddress("danielhuang.work@gmail.com"));
			//	4-4. 信件內容
			message.setText("Hello from DH\n");
			//	4-5. 信件主旨
			message.setSubject("Hello!");
			//	5. 寄出
			Transport.send(message);
			
			
			out.println("Mail Sent!");
		} catch (Exception e) {
			out.println("Error: " + e.toString());
		}
		
		
	%>
</body>
</html>