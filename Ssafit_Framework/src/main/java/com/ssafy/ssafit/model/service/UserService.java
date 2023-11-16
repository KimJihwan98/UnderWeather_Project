package com.ssafy.ssafit.model.service;

import java.util.List;

import com.ssafy.ssafit.model.dto.User;

public interface UserService {
	int signup(User user);

	User login(User user);
	
	List<User> selectAll();
}
