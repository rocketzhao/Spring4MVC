package com.javahash.spring.prototype;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	public static void main(String[] args){
		ClassPathXmlApplicationContext bf = new ClassPathXmlApplicationContext("spring/testprototype.xml");
		System.out.println(bf.getBean("testA"));
	}
	
}
