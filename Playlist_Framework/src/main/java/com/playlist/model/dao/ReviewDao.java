package com.playlist.model.dao;

import java.util.List;

import com.playlist.model.dto.Review;

public interface ReviewDao {
	// 댓글 등록
	void insertReview(Review review);

	// 댓글 전체 조회
	List<Review> selectAll(String youtubeId);

	// 댓글 상세 조회
	Review selectOne(int rId);

	// 댓글 수정
	void updateReview(Review review);

	// 댓글 삭제
	void deleteReview(int rId);

	// 조회수 증가
	void updateViewCnt(int rId);
}
