package tw.dh46.jeehw;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*	
 *	20180909AM2 HW33_Servlet
 *	細看Servlet運作方式
 *	
 *	@WebServlet("/HW33_Servlet") URLPattern
 */

@WebServlet(
			urlPatterns = {
					//	對外宣告的網址設定
					"/HW33_Servlet","/iii/google"
					},
			initParams = {
					//	init參數: 適合開發階段的初始設定
					@WebInitParam(name="x", value="10"),
					@WebInitParam(name="y", value="3")
			}
		)

public class HW33_Servlet extends HttpServlet {
	private ServletConfig servletConfig;
	private ServletContext servletContext;
	
	public HW33_Servlet() {
		super();
		System.out.println("HW33() 建構式");
	}
	
	@Override
	public void init() throws ServletException {
		//	複習只要不是建構式super可以不放第一行
		/*	啟動時跟建構式有點像? 差別在於建構式只能從物件導向去處理變數屬性, 
		 * 	但init可取得初始化的動作/取得servlet相關屬性
		 * 	servlet的屬性資料如果每次都透過get等方法=>多做(因為資料是固定的?)
		 * 	寫在建構式(java物件)無法存取?
		 * 	透過init取得重要的資訊
		 */
		
		servletConfig = getServletConfig();
		servletContext = getServletContext();
		
		// 在init就取得這個參數/往後get or post就不用再另取得
		String uploadPath = servletContext.getInitParameter("upload-dir");
		System.out.println("UploadPath: " + uploadPath);
		
//		Enumeration<String> configPNames = servletConfig.getInitParameterNames();
//		while (configPNames.hasMoreElements()) {
//			System.out.println(configPNames.nextElement());
//		}
		
		String x = servletConfig.getInitParameter("x");
		String y = servletConfig.getInitParameter("y");
		System.out.println(x + y);
		
		String rootPath = servletContext.getRealPath("/"); // 根目錄的真實路徑
		System.out.println("root: " + rootPath);
		
		
		Set<String> resourcePath = servletContext.getResourcePaths("/");
		for (String path: resourcePath) {
			System.out.println(path);
		}
		
		System.out.println("init()");
		super.init();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service()");
		super.service(req, resp);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
	}

}
