package com.javahash.spring.test;

/**
 * 静态同步方法
 *
 */
public class TestA {
	static boolean isTrue;

	public static synchronized void write(boolean b) {
		isTrue = b;
	}

	public static synchronized boolean read() {
		return isTrue;
	}

	public static void main(String[] args) {
		TestA a = new TestA();
	}
}

/**
 * 实例同步方法
 */
class TestB {
	private boolean isTrue;

	public synchronized void write(boolean b) {
		isTrue = b;
	}

	public synchronized boolean read() {
		return isTrue;
	}

}

class Lock {
	private boolean isLocked = false;

	public synchronized void lock() throws InterruptedException {
		while (isLocked) {
			wait();
		}
		isLocked = true;
	}

	public synchronized void unlock() {
		isLocked = false;
		notify();
	}

}
