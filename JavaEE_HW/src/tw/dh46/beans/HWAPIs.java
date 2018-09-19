package tw.dh46.beans;

public class HWAPIs {
	public static String lottery() {
		int lottery = (int)(Math.random()*49+1);
		return lottery+ "";
	}
	
	public static String sayHi(String name) {
		return "Hi " + name;
	}
	
	public static String toIntString(double v) {
		Double d = v;
		return d.intValue() + "";
	}
}
