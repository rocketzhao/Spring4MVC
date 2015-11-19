package com.javahash.spring.test;

import org.springframework.beans.factory.annotation.Autowired;
public class MyTestBean {

	private String testStr="testStr";

	@Autowired
	private MyTestBean2 myTestBean2;
	
	public String getTestStr() {
		return testStr;
	}

	public void setTestStr(String testStr) {
		this.testStr = testStr;
	}

	public MyTestBean2 getMyTestBean2() {
		return myTestBean2;
	}
	
	public void setMyTestBean2(MyTestBean2 myTestBean2) {
		this.myTestBean2 = myTestBean2;
	}

	@Override
	public String toString() {
		return "MyTestBean [testStr=" + testStr + ", myTestBean2="
				+ myTestBean2 + "]";
	}
	
}
