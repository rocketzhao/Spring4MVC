package com.javahash.spring.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

/**
 * 国际化控制器:<br />
 * 通过Session只能对当前的会话有效，Cookie则对Cookie有效期内的会话都有效。<br />
 * 在使用Cookie的时候，需要设置Cookie的过期时间，否则关闭浏览器之后，Cookie即失效了，没有达到目的。<br />
 * 当然，也可以保存用户的语言设置信息到数据库，用户登录之后即可将语言改变成用户设置的语言。<br />
 */
@Controller
@RequestMapping("/internal")
public class LanguageController {

	@Autowired
	CookieLocaleResolver resolver;

	// @Autowired SessionLocaleResolver resolver;

	/**
	 * 语言切换
	 */
	@RequestMapping("language")
	public ModelAndView language(HttpServletRequest request, HttpServletResponse response, String language) {

		language = language.toLowerCase();
		if (language == null || language.equals("")) {
			return new ModelAndView("redirect:/");
		} else {
			if (language.equals("zh_cn")) {
				resolver.setLocale(request, response, Locale.CHINA);
			} else if (language.equals("en")) {
				resolver.setLocale(request, response, Locale.ENGLISH);
			} else {
				resolver.setLocale(request, response, Locale.CHINA);
			}
		}

		return new ModelAndView("redirect:/");
	}

	/**
	 * 演示一些消息
	 */
	@RequestMapping("something")
	public void something() {
		System.out.println("something");
	}

	/**
	 * 换页面
	 */
	@RequestMapping("welcome")
	public void welcome() {
		System.out.println("welcome");
	}

}
