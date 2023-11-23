package com.playlist.model.dao;

import java.util.List;

import com.playlist.model.dto.User;

public interface UserDao {
	int insert(User user);
	
	User select(String userId);
	
	List<User> selectAll();
}
