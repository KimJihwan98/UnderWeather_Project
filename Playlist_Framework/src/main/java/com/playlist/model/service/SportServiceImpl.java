package com.playlist.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playlist.model.dao.SportDao;
import com.playlist.model.dto.Sport;

@Service
public class SportServiceImpl implements SportService {
    private SportDao sportDao;
    
    @Autowired
    public void setSportDao(SportDao sportDao) {
        this.sportDao = sportDao;
    }
    

    @Override
    public List<Sport> selectAll(String spName) {
        return sportDao.selectAll(spName);
    }

    @Override
    public Sport selectOne(String spName) {
        return sportDao.selectOne(spName);
    }

    
}