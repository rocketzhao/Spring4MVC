package com.javahash.spring.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javahash.spring.exception.BusinessException;
import com.javahash.spring.exception.ParameterException;

@Controller
@RequestMapping(value = "/test")
public class TestController extends BaseController {

	@RequestMapping(value = "/controller", method = RequestMethod.GET)
	public void controller(HttpServletResponse response, Integer id) throws Exception {
		switch (id) {
		case 1:
			throw new BusinessException("10", "controller10");
		case 2:
			throw new BusinessException("20", "controller20");
		case 3:
			throw new BusinessException("30", "controller30");
		case 4:
			throw new BusinessException("40", "controller40");
		case 5:
			throw new BusinessException("50", "controller50");
		default:
			throw new ParameterException("Controller Parameter Error");
		}
	}

}
