package com.ssafy.ssafit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.ssafy.ssafit.model.dto.Product;
import com.ssafy.ssafit.model.dto.Review;
import com.ssafy.ssafit.model.service.ProductService;

import io.swagger.annotations.ApiOperation;
import springfox.documentation.annotations.ApiIgnore;

@CrossOrigin(origins="*", allowedHeaders = "*")
@RestController
@RequestMapping("/api")
public class ProductRestController {
	@Autowired
	private ProductService productService;
	
	@GetMapping("/Product") // R : 상품 조회
	public ResponseEntity<?> productList(String youtubeId) {
		List<Product> list = productService.productList(youtubeId);
		if (list == null || list.size() == 0)
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<Product>>(list, HttpStatus.OK);
	}

	
	@PostMapping("/Product") // C: 상품 등록
	public ResponseEntity<?> registProduct(@RequestBody Product product) {
		System.out.println(product);
		productService.registProduct(product);
		return new ResponseEntity<Product>(product, HttpStatus.CREATED);
	}
	
	@DeleteMapping("/Product/{pId}")
	public ResponseEntity<?> deleteProduct(@PathVariable String pId) {
		productService.deleteProduct(pId);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	

}
