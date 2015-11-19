package com.javahash.spring.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ACTest {

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		//ApplicationContext
		ApplicationContext ac = new ClassPathXmlApplicationContext("spring/beanFactoryTest.xml");
		MyTestBean t = (MyTestBean) ac.getBean("myTestBean");
		System.out.println(t.getTestStr());

	}

}
