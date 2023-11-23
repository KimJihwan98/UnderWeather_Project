package com.playlist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.playlist.model.dto.Video;
import com.playlist.model.service.VideoService;

@CrossOrigin(origins="*", allowedHeaders = "*")
@RestController
@RequestMapping("/api")
public class VideoRestController {
	@Autowired
	VideoService videoService;
	
	@GetMapping("/Video/read")
	public ResponseEntity<?> selectAllVideo() {
		List<Video> videos = videoService.readAllVideo();
		return new ResponseEntity<List<Video>>(videos, HttpStatus.OK);
	}
	
	@GetMapping("/Video/genre")
	public ResponseEntity<?> selectGenreVideo(String genre) {
		List<Video> videos = videoService.readGenreVideo(genre);
		return new ResponseEntity<List<Video>>(videos, HttpStatus.OK);
	}
}
