package com.javahash.spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javahash.spring.domain.User;
import com.javahash.spring.service.UserService;

@Controller
public class HelloWorldController {
	
	private static final Logger logger = LoggerFactory.getLogger(HelloWorldController.class);

	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/hello.html")
	public String hello(@RequestParam(value = "name", required = false, defaultValue = "World") String name, 
			Model model) {
		model.addAttribute("name", name);
		return "helloworld";
	}
	
	@RequestMapping("/list")
	public String getAllUsers(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		logger.info(users.toString());
		return "list";
	}

}