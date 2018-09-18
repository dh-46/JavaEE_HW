package tw.dh46.beans;

import java.io.Serializable;

/*
 *	20180915AM1
 *	JavaBeans
 *	
 *	// 最嚴謹的方式, 原則上JavaBeans要吻合以下條件, 但是目前實務上須看開發的要求做調整
 *	1.	必須是 public class
 * 	(*)2.	implements Serializable	(新的版本可以不做, 但建議仍做序列化)
 * 	(*)3.	all fields not public => private (實現封裝) [屬性如果設成public仍可以執行, 但有安全性疑慮]
 * 	4.	default constructor 預設建構式(無傳參數建構式)
 * 	5.	會有 getter & setter => getXXX()/setXXX()
 */

public class Member implements Serializable{

//	public class Member {
	//	屬性名稱全小寫(Java原本規範)
	//	scope: private => 實現封裝
	private String id, name;
	
	//	一定要有預設無傳參數建構式 ((但也可以有其他的
	public Member() {

	}
	
	public Member(String name, String id) {
		this.name = name;
		this.id = id;
	}
	
	//	setter方法
	public void setId(String id) {
		this.id = id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	//	getter方法
	public String getId() {
		return this.id;
	}
	
	public String getName() {
		return this.name;
	}
	
	//	其他方法
	@Override
	public String toString() {
		return name + id;
	}
	
}
