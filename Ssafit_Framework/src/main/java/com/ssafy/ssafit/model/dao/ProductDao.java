package com.ssafy.ssafit.model.dao;

import java.util.List;

import com.ssafy.ssafit.model.dto.Review;

public interface ProductDao {
	// 댓글 등록
	void insertReview(Review review);

	// 댓글 전체 조회
	List<Review> selectAll(String youtubeId);

	// 댓글 상세 조회
	Review selectOne(int id);

	// 댓글 수정
	void updateReview(Review review);

	// 댓글 삭제
	void deleteReview(int id);

	// 조회수 증가
	void updateViewCnt(int id);
}
