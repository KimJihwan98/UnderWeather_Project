package com.playlist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playlist.model.dao.ReviewDao;
import com.playlist.model.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	private ReviewDao reviewDao;
	
	@Autowired
	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	@Override
	public void createReview(Review review) {
		reviewDao.insertReview(review);
	}

	@Override
	public List<Review> readReviewList(String youtubeId) {
		return reviewDao.selectAll(youtubeId);
	}

	@Override
	public Review readReview(int rId) {
		return reviewDao.selectOne(rId);
	}

	@Override
	public void updateReview(Review Review) {
		reviewDao.updateReview(Review);
	}

	@Override
	public void deleteReview(int rId) {
		reviewDao.deleteReview(rId);
	}
}