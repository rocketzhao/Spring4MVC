package com.javahash.spring.superclass;

public class Son extends Father {
	
	public Son(){
		super();
	}

	public static void main(String[] args){
		Son s = new Son();
		System.out.println(s.getName());
	}
}
