package com.javahash.spring.superclass;

public class Father {

	public Father(){
		System.out.println("father");
		System.out.println(this.name);
	}
	
	private String name="test";

	private int age=100;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}
