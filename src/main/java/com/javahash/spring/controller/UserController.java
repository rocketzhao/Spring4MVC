package com.javahash.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javahash.spring.domain.User;
import com.javahash.spring.service.UserService;

@Controller
public class UserController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@RequestMapping("/user/login")
	public String login(HttpServletRequest request, Model model) {
		
		System.out.println("-------清除权限session开始-------");
		RemoveSession.removeRightSession(request);
		System.out.println("-------清除权限session结束-------");
		
		/**
		 * 若已经登录，则直接返回主页
		 */
		if ((String) request.getSession().getAttribute("login") != null
				&& ((String) request.getSession().getAttribute("login"))
						.equals("alreadyLogin")) {
			return "main";
		}
		
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		logger.info(name + " + " + password);
		User user_login = userService.login(name, password);

		if (user_login == null) {
			logger.error("Error login!");
			return "fail";
		} else {
			/**
			 * 登录成功后，将信息存放至session
			 */
			request.getSession().setAttribute("login", "alreadyLogin");
			request.getSession().setAttribute("userName", name);
			logger.info(user_login.toString());
			model.addAttribute("user", user_login);
			return "main";
		}
	}

	@RequestMapping("/user/list")
	public String getAllUsers(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		logger.info(users.toString());
		return "list";
	}

	@RequestMapping(value = "/user/getUserInfo/{id}", method = RequestMethod.POST)
	@ResponseBody
	public User getUserInfo(HttpServletRequest request, @PathVariable int id) {
		User user = userService.getUserInfo(id);
		return user;
	}

}
