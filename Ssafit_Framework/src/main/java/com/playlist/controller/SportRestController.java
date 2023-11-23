package com.playlist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.playlist.model.dto.Sport;
import com.playlist.model.service.SportService;

@CrossOrigin(origins="*", allowedHeaders = "*")
@RestController
@RequestMapping("/api")
public class SportRestController {
    @Autowired
    private SportService sportService;
    
    @GetMapping("/Sport")
    public ResponseEntity<?> list(String spName) {
        List<Sport> list = sportService.selectAll(spName);
        if (list == null || list.size() == 0)
            return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
        return new ResponseEntity<List<Sport>>(list, HttpStatus.OK);
    }

    @GetMapping("/Sport/{spName}")
    public ResponseEntity<?> detail(@PathVariable String spName) {
        Sport Sport = sportService.selectOne(spName);
        return new ResponseEntity<Sport>(Sport, HttpStatus.OK);
    }
    
}