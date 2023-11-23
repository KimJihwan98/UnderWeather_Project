package com.playlist.model.dao;

import java.util.List;

import com.playlist.model.dto.Grass;

public interface GrassDao {
	// 잔디 등록
	void insertGrass(Grass grass);

	// 잔디 전체 조회
	List<Grass> selectAll(String userId);

	// 잔디 상세 조회
	Grass selectOne(String gId);

	// 잔디 수정
	void updateGrass(Grass grass);

	// 잔디 삭제
	void deleteGrass(String gId);
}
