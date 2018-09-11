package tw.dh46.jeehw;

/*	20180908PM1 for HW22.servlet
 * 	密碼驗證
 */

public class HW_PWCheck {
	public static boolean checkPassword(String psrc, String password) {
		boolean isCorrect = false;
		
		if (psrc.startsWith("$2a$10$")) {
			isCorrect = BCrypt.checkpw(password, psrc);
		}
		
		return isCorrect;
	}
}
