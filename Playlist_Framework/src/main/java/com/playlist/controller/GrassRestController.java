package com.playlist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.playlist.model.dto.Grass;
import com.playlist.model.service.GrassService;

import springfox.documentation.annotations.ApiIgnore;

@CrossOrigin(origins="*", allowedHeaders = "*")
@RestController
@RequestMapping("/api")
public class GrassRestController {
	@Autowired
	private GrassService grassService;

	@GetMapping("/Grass")
	public ResponseEntity<?> list(String userId) {
		List<Grass> list = grassService.readGrassList(userId);
		if (list == null || list.size() == 0)
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<Grass>>(list, HttpStatus.OK);
	}

	@GetMapping("/Grass/{id}")
	public ResponseEntity<?> detail(@PathVariable String gId) {
		Grass Grass = grassService.readGrass(gId);
		return new ResponseEntity<Grass>(Grass, HttpStatus.OK);
	}

	@PostMapping("/Grass")
	public ResponseEntity<?> write(@RequestBody Grass Grass) {
		grassService.createGrass(Grass);
		return new ResponseEntity<Grass>(Grass, HttpStatus.CREATED);
	}

	@DeleteMapping("/Grass/{id}")
	public ResponseEntity<?> delete(@PathVariable String gId) {
		grassService.deleteGrass(gId);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@ApiIgnore
	@PutMapping("/Grass") // JSON 형태의 데이터로 넘어왔을 떄 처리하고 싶은데?
	public ResponseEntity<?> update(@RequestBody Grass Grass) {
		grassService.updateGrass(Grass);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
