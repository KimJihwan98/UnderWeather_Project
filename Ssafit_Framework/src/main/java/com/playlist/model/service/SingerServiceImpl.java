package com.playlist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playlist.model.dao.SingerDao;
import com.playlist.model.dto.Singer;
import com.playlist.model.dto.Review;

@Service
public class SingerServiceImpl implements SingerService {
	private SingerDao singerDao;
	
//	@Autowired
//	public void setReviewDao(ReviewDao reviewDao) {
//		this.reviewDao = reviewDao;
//	}
//	
	@Override
	public void registSinger(Singer singer) {//상품 등록
		singerDao.registSinger(singer);
	}

	@Override
	public List<Singer> singerList(String youtubeId){//상품 조회
		return singerDao.singerList(youtubeId);
	}

	@Override
	public void deleteSinger(String sId) {//상품 삭제
		singerDao.deleteSinger(sId);
	}

}