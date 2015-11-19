package com.javahash.spring.test;

public class TestRunnable implements Runnable{

	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName());
	}

	public static void main(String[] args) {
		System.out.println(Thread.currentThread().getName());
		TestRunnable t = new TestRunnable();
		Thread tt = new Thread(t);
		tt.setName("TestRunnable");
		tt.start();
	}

	
}
