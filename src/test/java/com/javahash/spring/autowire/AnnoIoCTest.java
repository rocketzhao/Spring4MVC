package com.javahash.spring.autowire;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AnnoIoCTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		String[] locations = { "spring/beans.xml" };
		ApplicationContext ctx = new ClassPathXmlApplicationContext(locations);
		Boss boss = (Boss) ctx.getBean("boss");
		System.out.println(boss);
	}
}
