package com.javahash.spring.test;

public class TestThread extends Thread{

	@Override
	public void run(){
		System.out.println(Thread.currentThread().getName());
	}
	
	public static void main(String[] args) {
		TestThread t = new TestThread();
		t.setName("TestThread");
		t.start();
	}

}
