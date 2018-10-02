package tw.dh46.jeehw;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/*
 * 	0929AM1 01:30:54
 * 	自訂標籤類別
 * 	帶入參數&操作Body
 * 	
 */


public class MyTag3 extends SimpleTagSupport{
	//	若把標籤看成一個物件, 其屬性就是物件的屬性
	
	//	存取修飾設為private => 要透過getter/setter
	private String itemName;
	private String price;
	private StringWriter sw;
	
	
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		//	輸出在這裡面
		
		JspWriter out = getJspContext().getOut();
		
		//	測試一下拿到的東西 (了解外面的值如何傳入)
		//	out.println( itemName + " : " + price);
		
		//	操作Body-Content
		sw = new StringWriter();
		getJspBody().invoke(sw);
		
		//	寫出
		out.write(itemName + " : " + price + " => " + sw.toString() + "<br>");
		
		//	有body-content&參數	=> 就可以操作更多邏輯運算!
	}
	
	//	setter
	public void setitemName(String itemName) {
		this.itemName = itemName;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
}
