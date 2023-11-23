package com.playlist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.playlist.model.dao.UserDao;
import com.playlist.model.dto.User;

@Service
public class UserServiceImpl implements UserService{
	private UserDao userDao;
	
    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }
    
    @Override
	@Transactional
	public int signup(User user) {
		return userDao.insert(user);
	}

    @Override
    public User login(User user) {
    	User tmp = userDao.select(user.getUserId());
		//tmp가 실제 User 정보 일수도 있고 / null 넘어왔다.
		if(tmp != null && tmp.getPassword().equals(user.getPassword()))
			return tmp;
		return null;
    }

    @Override
	public List<User> selectAll() {
		return userDao.selectAll();
	}
}