package com.ssafy.ssafit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ssafit.model.dto.User;
import com.ssafy.ssafit.model.service.UserService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins="*", allowedHeaders = "*")
@RestController
@RequestMapping("/api")
public class GrassRestController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/User/list")
	@ApiOperation(value = "등록된 모든 사용자 정보를 반환한다.", response = User.class)
	public ResponseEntity<?> selectAll() {
		try {
			List<User> users = userService.selectAll();
			if (users != null && users.size() > 0) {
				return new ResponseEntity<List<User>>(users, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	@PostMapping("/User/signup")
	public ResponseEntity<?> signup(User user) {
		int result = userService.signup(user);
		
		return new ResponseEntity<Integer>(result, HttpStatus.CREATED);
	}
	
	@PostMapping("/User/login")
	public ResponseEntity<?> login(User user, HttpSession session) {
		System.out.println(user);
		User tmp = userService.login(user);
		
		//로그인 실패 (잘못했어)
		if(tmp == null)
			return new ResponseEntity<Void>(HttpStatus.UNAUTHORIZED);
		
		session.setAttribute("loginUser", tmp.getName());
		return new ResponseEntity<String>(tmp.getName(), HttpStatus.OK);
	}
	
	
	@GetMapping("/User/logout")
	public ResponseEntity<?> logout(HttpSession session) {
//		session.removeAttribute("loginUser");
		session.invalidate();
		
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
