package com.playlist.model.service;

import java.util.List;

import com.playlist.model.dto.User;

public interface UserService {
	int signup(User user);

	User login(User user);
	
	List<User> selectAll();
}
