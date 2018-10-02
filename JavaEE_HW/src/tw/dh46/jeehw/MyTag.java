package tw.dh46.jeehw;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/*	0929AM1 00:55:30
 * 	自訂標籤
 * 	1. 	要繼承SimpleTagSupport
 * 	2.	override doTag方法
 * 	3. 	寫需要的邏輯
 * 	4. 	寫好後要到WEB-INF裡建立.tld檔	=> taglib的定義檔
 */

public class MyTag extends SimpleTagSupport{

	@Override
	public void doTag() throws JspException, IOException {
		//	這裡的super不能拿掉
		super.doTag();
		
		//	之前寫JSP 有隱含物件/Servlet 有傳入的參數, 但普通類別沒有, 需要自己拿(下面三行)
		
		//	1. 取得JspContext物件實體
		JspContext context = getJspContext();
		//	2.取得輸出
		JspWriter out = context.getOut();
		out.print("HELLO");
		//	之後實務上可以連續呼叫不用特別給變數名稱
	}
	
}
