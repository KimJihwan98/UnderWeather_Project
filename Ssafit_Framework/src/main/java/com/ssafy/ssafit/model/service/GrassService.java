package com.ssafy.ssafit.model.service;

import java.util.List;

import com.ssafy.ssafit.model.dto.Review;

public interface GrassService {
	// 댓글 등록
	void createReview(Review review);

	// 댓글 전체 조회
	List<Review> readReviewList(String youtubeId);

	// 댓글 상세 조회
	Review readReview(int id);

	// 댓글 수정
	void updateReview(Review Review);

	// 댓글 삭제
	void deleteReview(int id);
}
