package com.ssafy.ssafit.model.dao;

import java.util.List;

import com.ssafy.ssafit.model.dto.Video;

public interface VideoDao {
	//흥미 영상
	List<Video> selectInterestViewFitViedo();
	
	//파트별 영상
	List<Video> selectPartFitViedo(String part);
	
	//조회수 증가
	void updateViewCnt(String youtubeId);
}
