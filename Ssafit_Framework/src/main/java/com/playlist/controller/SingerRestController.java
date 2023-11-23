package com.playlist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.playlist.model.dto.Singer;
import com.playlist.model.service.SingerService;

@CrossOrigin(origins="*", allowedHeaders = "*")
@RestController
@RequestMapping("/api")
public class SingerRestController {
	@Autowired
	private SingerService singerService;
	
	@GetMapping("/singer") // R : 상품 조회
	public ResponseEntity<?> singerList(String youtubeId) {
		List<Singer> list = singerService.singerList(youtubeId);
		if (list == null || list.size() == 0)
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<Singer>>(list, HttpStatus.OK);
	}

	
	@PostMapping("/singer") // C: 상품 등록
	public ResponseEntity<?> registSinger(@RequestBody Singer singer) {
		System.out.println(singer);
		singerService.registSinger(singer);
		return new ResponseEntity<Singer>(singer, HttpStatus.CREATED);
	}
	
	@DeleteMapping("/singer/{pId}")
	public ResponseEntity<?> deleteSinger(@PathVariable String pId) {
		singerService.deleteSinger(pId);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	

}
