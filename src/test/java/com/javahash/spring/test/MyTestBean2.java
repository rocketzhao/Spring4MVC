package com.javahash.spring.test;

public class MyTestBean2 {

	private String name;

	/*public MyTestBean2(String name) {
		this.name = name;
	}*/

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MyTestBean2 [name=" + name + "]";
	}

}
