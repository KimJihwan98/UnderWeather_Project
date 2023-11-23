package com.playlist.model.dao;

import java.util.List;

import com.playlist.model.dto.Review;
import com.playlist.model.dto.Video;

public interface VideoDao {
	//전체 영상
	List<Video> selectAllVideo();
	
	//장르별 영상
	List<Video> selectGenreVideo(String genre);
	
	//조회수 증가
	void updateViewCnt(String youtubeId);
	
	void insertVideo(Video video);
}
