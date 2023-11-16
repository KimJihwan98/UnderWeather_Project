package com.ssafy.ssafit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.VideoDao;
import com.ssafy.ssafit.model.dto.Video;

@Service
public class VideoServiceImpl implements VideoService{
	private VideoDao videoDao;
	
	@Autowired
	public void setVideoDao(VideoDao videoDao) {
		this.videoDao = videoDao;
	}
	
	@Override
	public List<Video> readInterestViewFitViedo() {
		return videoDao.selectInterestViewFitViedo();
	}

	@Override
	public List<Video> readPartFitViedo(String part) {
		return videoDao.selectPartFitViedo(part);
	}
}
