package com.ssafy.ssafit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.GrassDao;
import com.ssafy.ssafit.model.dto.Grass;

@Service
public class GrassServiceImpl implements GrassService {
	private GrassDao grassDao;
	
	@Autowired
	public void setGrassDao(GrassDao grassDao) {
		this.grassDao = grassDao;
	}
	
	@Override
	public void createGrass(Grass grass) {
		grassDao.insertGrass(grass);
	}

	@Override
	public List<Grass> readGrassList(String userId) {
		return grassDao.selectAll(userId);
	}

	@Override
	public Grass readGrass(String gId) {
		return grassDao.selectOne(gId);
	}

	@Override
	public void updateGrass(Grass Grass) {
		grassDao.updateGrass(Grass);
	}

	@Override
	public void deleteGrass(String gId) {
		grassDao.deleteGrass(gId);
	}
}