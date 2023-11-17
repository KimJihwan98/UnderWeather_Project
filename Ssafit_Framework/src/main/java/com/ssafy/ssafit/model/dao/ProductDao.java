package com.ssafy.ssafit.model.dao;

import java.util.List;

import com.ssafy.ssafit.model.dto.Product;

public interface ProductDao {
	// 상품 등록
	void registProduct(Product product);

	// 상품 조회
	List<Product> productList(String youtubeId);

	// 상품 삭제
	void deleteProduct(String pId);

}
