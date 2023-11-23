package com.playlist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playlist.model.dao.VideoDao;
import com.playlist.model.dto.Review;
import com.playlist.model.dto.Video;

@Service
public class VideoServiceImpl implements VideoService{
	private VideoDao videoDao;
	
	@Autowired
	public void setVideoDao(VideoDao videoDao) {
		this.videoDao = videoDao;
	}
	
	@Override
	public List<Video> readAllVideo() {
		return videoDao.selectAllVideo();
	}

	@Override
	public List<Video> readGenreVideo(String genre) {
		return videoDao.selectGenreVideo(genre);
	}
	
	@Override
	public void createVideo(Video video) {
		videoDao.insertVideo(video);
	}
}
