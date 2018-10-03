package tw.dh46.jeehw;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.annotation.WebListener;

/*	20180929PM2 傾聽器_Request Attribute Listener
 * 	1.	實作ServletRequestAttributeListener
 * 	2.	一樣要加上Annotation才可使用
 * 	3.	是針對Attribute
 * 	
 * 	Request只有作用在自己本身跟forward/include出去的範圍
 */

//	@WebListener
public class HWRequestAttrListener implements ServletRequestAttributeListener{

	@Override
	public void attributeAdded(ServletRequestAttributeEvent event) {
		//	抓屬性的名稱與值
		String key = event.getName();
		String value = (String)event.getValue();
		System.out.println("add => " + key + " : " + value);
	}

	@Override
	public void attributeRemoved(ServletRequestAttributeEvent event) {
			//	抓屬性的名稱與值
			String key = event.getName();
			String value = (String)event.getValue();
			System.out.println("remove => " + key + " : " + value);
	}

	@Override
	public void attributeReplaced(ServletRequestAttributeEvent event) {
			//	抓屬性的名稱與值
			String key = event.getName();
			//	這邊value是boolean值
			Object value = event.getValue();
			System.out.println("Replaced => " + key + " : " + value);
	}
	
}
