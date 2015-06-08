package com.javahash.spring.service.Impl;

import org.springframework.stereotype.Service;

import com.javahash.spring.exception.BusinessException;
import com.javahash.spring.exception.ParameterException;
import com.javahash.spring.service.TestService;

@Service
public class TestServiceImpl extends BaseServiceImpl implements TestService {
	
	public void exception(Integer id) throws Exception {
		switch (id) {
		case 1:
			throw new BusinessException("11", "service11");
		case 2:
			throw new BusinessException("21", "service21");
		case 3:
			throw new BusinessException("31", "service31");
		case 4:
			throw new BusinessException("41", "service41");
		case 5:
			throw new BusinessException("51", "service51");
		default:
			throw new ParameterException("Service Parameter Error");
		}
	}
	
}
