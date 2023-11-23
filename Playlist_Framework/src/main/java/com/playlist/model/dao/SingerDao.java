package com.playlist.model.dao;

import java.util.List;

import com.playlist.model.dto.Singer;

public interface SingerDao {
	// 상품 등록
	void registSinger(Singer singer);

	// 상품 조회
	List<Singer> singerList(String youtubeId);

	// 상품 삭제
	void deleteSinger(String pId);

}
