package tw.dh46.jeehw;

/*	
 *	20180909AM2 for HW31
 * 
 */

public class HWMember {
	private String name;
	private int age;
	private String account;
	public HWMember(String name, int age, String account) {
		this.account = account;
		this.age = age;
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getAccount() {
		return account;
	}
}
