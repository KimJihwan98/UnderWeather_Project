package com.ssafy.ssafit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.ReviewDao;
import com.ssafy.ssafit.model.dto.Review;

@Service
public class SportServiceImpl implements ReviewService {
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
	public Review readReview(int id) {
		return reviewDao.selectOne(id);
	}

	@Override
	public void updateReview(Review Review) {
		reviewDao.updateReview(Review);
	}

	@Override
	public void deleteReview(int id) {
		reviewDao.deleteReview(id);
	}
}