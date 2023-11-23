package com.playlist.model.dao;

import java.util.List;

import com.playlist.model.dto.Sport;

public interface SportDao {
    // 댓글 전체 조회
    List<Sport> selectAll(String spName);

    // 댓글 상세 조회
    Sport selectOne(String spName);

}