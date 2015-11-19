package com.javahash.spring.test;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;


@SuppressWarnings("deprecation")
public class BeanFactoryTest {

	public BeanFactoryTest(){
	}
	
	public BeanFactoryTest(String test,String work){
		System.out.println(work);
	}
	
	@Test
	public void Test(){
//		ApplicationContext bf = new ClassPathXmlApplicationContext("spring/beanFactoryTest.xml");
		BeanFactory bf = new XmlBeanFactory(new ClassPathResource("spring/beanFactoryTest.xml"));
		MyTestBean mt = (MyTestBean) bf.getBean("myTestBean");
		System.out.println(mt.toString());
	}
	
}
