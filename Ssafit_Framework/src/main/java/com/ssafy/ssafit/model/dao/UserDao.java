package com.ssafy.ssafit.model.dao;

import java.util.List;

import com.ssafy.ssafit.model.dto.User;

public interface UserDao {
	int insert(User user);
	
	User select(String userId);
	
	List<User> selectAll();
}
