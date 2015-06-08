package com.javahash.spring.exception.handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.javahash.spring.exception.BusinessException;
import com.javahash.spring.exception.ParameterException;

/**
 * SimpleMappingExceptionResolver is the default implementation class of HandlerExceptionResolver.<br/>
 * Now MyExceptionHandler extends it. 
 * 
 * 注：系统不应随便抛异常，即controller不应随便让请求跳转至错误页面，因为这样影响用户体验。<br />
 * catch中也应该只是记录对应的log，而不是随便抛异常。<br />
 * 只有当出现非抛不可的异常时，才会触发，比如数据库连接失败等。<br />
 * 当然403，404，500直接被tomcat劫持，并跳转到对应页面了。
 *
 */
public class CustomExceptionHandler extends SimpleMappingExceptionResolver {

	@Override
	public ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("ex", ex);

		// 根据不同错误转向不同页面
		if (ex instanceof BusinessException) {
			return new ModelAndView("error/error-business", model);
		} else if (ex instanceof ParameterException) {
			return new ModelAndView("error/error-parameter", model);
		} else {
			return new ModelAndView("error/error", model);
		}
		
	}

}
