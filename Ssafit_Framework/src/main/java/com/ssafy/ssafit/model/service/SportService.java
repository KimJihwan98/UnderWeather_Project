package com.ssafy.ssafit.model.service;

import java.util.List;

import com.ssafy.ssafit.model.dto.Review;

public interface SportService {

	// 댓글 전체 조회
	List<Review> readReviewList(String youtubeId);

}
