package com.playlist.model.service;

import java.util.List;

import com.playlist.model.dto.Grass;

public interface GrassService {
	// 잔디 등록
	void createGrass(Grass grass);

	// 잔디 전체 조회
	List<Grass> readGrassList(String userId);

	// 잔디 상세 조회
	Grass readGrass(String gId);

	// 잔디 수정
	void updateGrass(Grass grass);

	// 잔디 삭제
	void deleteGrass(String gId);
}
