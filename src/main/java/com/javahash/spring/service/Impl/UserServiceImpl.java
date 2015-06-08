package com.javahash.spring.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javahash.spring.domain.User;
import com.javahash.spring.persist.UserMapper;
import com.javahash.spring.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Transactional
	public User login(String name, String password) {
		User user_login = userMapper.login(name, password);
		return user_login;
	}

	@Transactional
	public List<User> getAllUsers() {
		List<User> users = userMapper.getAllUsers();
		return users;
	}

	public User getUserInfo(int id) {
		User user = userMapper.selectOne(id);
		return user;
	}

}
