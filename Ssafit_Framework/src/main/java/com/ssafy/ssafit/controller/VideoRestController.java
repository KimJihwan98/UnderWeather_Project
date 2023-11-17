package com.ssafy.ssafit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ssafit.model.dto.Video;
import com.ssafy.ssafit.model.service.VideoService;

@CrossOrigin(origins="*", allowedHeaders = "*")
@RestController
@RequestMapping("/api")
public class VideoRestController {
	@Autowired
	VideoService videoService;
	
	@GetMapping("/Video/interest")
	public ResponseEntity<?> selectInterestVideo() {
		List<Video> videos = videoService.readInterestViewFitViedo();
		return new ResponseEntity<List<Video>>(videos, HttpStatus.OK);
	}
	
	@GetMapping("/Video/part")
	public ResponseEntity<?> selectPartVideo(String part) {
		List<Video> videos = videoService.readPartFitViedo(part);
		return new ResponseEntity<List<Video>>(videos, HttpStatus.OK);
	}
}
