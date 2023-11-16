package com.ssafy.ssafit.model.service;

import java.util.List;

import com.ssafy.ssafit.model.dto.Video;

public interface VideoService {
	//인기 많은 영상 조회
	List<Video> readInterestViewFitViedo();
	
	//부위별 영상 조회
	List<Video> readPartFitViedo(String part);
}
