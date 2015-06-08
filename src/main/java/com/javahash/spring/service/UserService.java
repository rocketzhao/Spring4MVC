package com.javahash.spring.service;

import java.util.List;

import com.javahash.spring.domain.User;


public interface UserService extends BaseService {

	public User login(String name, String password);

	public List<User> getAllUsers();
	
	public User getUserInfo(int id);
	
}
