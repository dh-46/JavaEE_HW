package tw.dh46.jeehw;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *	20180908PM2 HW25_watermark
 *	後端將上傳的圖片上浮水印
 *	輸出畫面後同時儲存已上浮水印的圖片檔
 *	
 *	串流觀念整合!
 *	
 *	=> 對前端而言, 是可以取用來做變化
 *
 *	=>	影像應用: 防機器人的captcha驗證?
 *	
 *	Homework: 上傳圖檔後馬上加上浮水印?
 */
@WebServlet("/HW25_watermark")
public class HW25_watermark extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//	1. 設定輸出的畫面內容為影像
		response.setContentType("image/jpg");
		
		//	2. 拿到路徑
		String uploadPath = getServletContext().getInitParameter("upload-dir");
		
		//	3. 把上傳的資料透過ImageIO讀到BufferImage
		BufferedImage bimg = ImageIO.read(new File(uploadPath, "image.jpg"));
		
		//	6. 圖檔加工 
		//	6-1	建立繪圖元件
		Graphics2D g2d = bimg.createGraphics();
		
		//	6-2. 產生字體
		Font font = new Font(null, Font.BOLD+Font.ITALIC, 60);	
		
		//	字體旋轉 
		//	AffineTransform => 影像縮放變形旋轉
		AffineTransform tran = new AffineTransform();
		tran.rotate(Math.toRadians(Math.random()*30), 40, 0); //	角度換弧度radian
		Font newFont = font.deriveFont(tran);	// 轉換
		
		//	繪圖細節調整
		g2d.setFont(newFont);
		g2d.setColor(Color.RED);
		g2d.drawString("HW25_WaterMark", 100, 100);
		
		//	4. 輸出串流(到畫面)
		OutputStream out = response.getOutputStream();
		ImageIO.write(bimg, "jpg", out);
		
		//	5. 輸出完整檔案到外部(含浮水印)
		File fileOut = new File(uploadPath, "HW25.jpg");
		ImageIO.write(bimg, "jpg", fileOut);
		
		out.flush();
		out.close();
	}


}
