package com.playlist.model.service;

import java.util.List;

import com.playlist.model.dto.Video;

public interface VideoService {
	//전체 영상 조회
	List<Video> readAllVideo();
	
	//장르별 영상 조회
	List<Video> readGenreVideo(String genre);
}
