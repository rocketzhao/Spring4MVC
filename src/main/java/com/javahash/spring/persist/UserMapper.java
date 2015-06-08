package com.javahash.spring.persist;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javahash.spring.domain.User;

//userMapper只能传入一个参数,多个的话需要注解
public interface UserMapper {
	// value 必须与Bean 属性一致！
	User login(@Param(value = "name") String name, @Param(value = "password") String password);

	List<User> getAllUsers();
	
	User selectOne(int id);
	
	int insert(User user);
}
