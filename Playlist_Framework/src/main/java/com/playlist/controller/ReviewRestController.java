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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.playlist.model.dto.Review;
import com.playlist.model.service.ReviewService;

import springfox.documentation.annotations.ApiIgnore;

@CrossOrigin(origins="*", allowedHeaders = "*")
@RestController
@RequestMapping("/api")
public class ReviewRestController {
	@Autowired
	private ReviewService reviewService;

	@GetMapping("/Review")
	public ResponseEntity<?> list(String youtubeId) {
		List<Review> list = reviewService.readReviewList(youtubeId);
		if (list == null || list.size() == 0)
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<Review>>(list, HttpStatus.OK);
	}

	@GetMapping("/Review/{rId}")
	public ResponseEntity<?> detail(@PathVariable int rId) {
		Review Review = reviewService.readReview(rId);
		return new ResponseEntity<Review>(Review, HttpStatus.OK);
	}

	@PostMapping("/Review")
	public ResponseEntity<?> write(@RequestBody Review Review) {
		System.out.println(Review);
		reviewService.createReview(Review);
		return new ResponseEntity<Review>(Review, HttpStatus.CREATED);
	}

	@DeleteMapping("/Review/{rId}")
	public ResponseEntity<?> delete(@PathVariable int rId) {
		reviewService.deleteReview(rId);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@ApiIgnore
	@PutMapping("/Review") // JSON 형태의 데이터로 넘어왔을 떄 처리하고 싶은데?
	public ResponseEntity<?> update(@RequestBody Review Review) {
		reviewService.updateReview(Review);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
