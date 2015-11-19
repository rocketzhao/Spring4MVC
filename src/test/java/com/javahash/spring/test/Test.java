package com.javahash.spring.test;


public class Test {

	private Test(){
		
	}
	
	final static int b = 0;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		final int a = 0;
		System.out.println(b);
//		final B b = new B();
//		System.out.println(b.i);
	}
	
	class B{
		public B(){
			
		}
		
		public int i = 1;
		
		public String test(){
			Test t = new Test();
			final int x = 0;
			return "";
		}
	}

}


