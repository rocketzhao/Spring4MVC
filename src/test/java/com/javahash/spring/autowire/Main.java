package com.javahash.spring.autowire;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("spring/beans-autowire.xml");
		Person person = (Person) ctx.getBean("person");
		System.out.println(person);
	}

}