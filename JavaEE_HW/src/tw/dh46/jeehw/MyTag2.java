package tw.dh46.jeehw;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/*
 * 	0929AM1 01:15:00
 * 	自訂標籤類別2_操作標籤Body
 * 	=> 取得innerHTML的那個部分
 */

public class MyTag2 extends SimpleTagSupport{
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		
		//	取得輸出
		JspWriter out = getJspContext().getOut();
		
		
		//	取得JSPBody(回傳fragment)
		JspFragment body = getJspBody();
		
		//	透過StringWriter轉換body後輸出
		StringWriter sw = new StringWriter();
		
		//	運用sw將整個body輸出 (資料在sw上)
		body.invoke(sw);
		
		out.println("Hello, " + sw.toString().toUpperCase());
	}
}
