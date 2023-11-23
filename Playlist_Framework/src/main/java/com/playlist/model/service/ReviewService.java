package com.playlist.model.service;

import java.util.List;

import com.playlist.model.dto.Review;

public interface ReviewService {
	// 댓글 등록
	void createReview(Review review);

	// 댓글 전체 조회
	List<Review> readReviewList(String youtubeId);

	// 댓글 상세 조회
	Review readReview(int rId);

	// 댓글 수정
	void updateReview(Review Review);

	// 댓글 삭제
	void deleteReview(int rId);
}
