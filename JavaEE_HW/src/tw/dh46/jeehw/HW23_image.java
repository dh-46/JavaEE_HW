package tw.dh46.jeehw;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *	20180908PM2 HW23_image
 *	後端動態產生圖(資料庫的值來異動圖片)
 */
@WebServlet("/HW23_image")
public class HW23_image extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//	1.宣告輸出內容為影像資料 (畫面裡面無法輸出文字, 只能專做影像)
		response.setContentType("image/jpeg");
		
		//	7. 變數算出百分比-->長條圖變化
		//	float rate = 70;
		//	8. 當rate是參數值
		String strRate = request.getParameter("rate");
		float rate = 50;
		try {
			rate = Float.parseFloat(strRate);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		//	2.建立繪圖元件
		BufferedImage bimg = new BufferedImage(400, 20, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = bimg.createGraphics();
		//	加第一層 3.
		g2d.setColor(Color.YELLOW);	//	設定顏色
		g2d.fillRect(0, 0, bimg.getWidth(), bimg.getHeight());	// 填滿顏色
		//	6. 加第二層 
		g2d.setColor(Color.RED);
		g2d.fillRect(0, 0, (int)(bimg.getWidth()*(rate/100)), bimg.getHeight());
		
		//	4. 取得output Stream <重點>
		OutputStream out = response.getOutputStream();
		
		//	5. 輸出串流 <將bimg與out結合>
		ImageIO.write(bimg, "jpeg", out);
		out.flush();
		out.close();
		
	}

}
