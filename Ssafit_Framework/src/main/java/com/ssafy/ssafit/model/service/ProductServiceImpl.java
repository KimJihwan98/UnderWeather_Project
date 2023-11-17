package com.ssafy.ssafit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.ProductDao;
import com.ssafy.ssafit.model.dto.Product;
import com.ssafy.ssafit.model.dto.Review;

@Service
public class ProductServiceImpl implements ProductService {
	private ProductDao productDao;
	
//	@Autowired
//	public void setReviewDao(ReviewDao reviewDao) {
//		this.reviewDao = reviewDao;
//	}
//	
	@Override
	public void registProduct(Product product) {//상품 등록
		productDao.registProduct(product);
	}

	@Override
	public List<Product> productList(String youtubeId){//상품 조회
		return productDao.productList(youtubeId);
	}

	@Override
	public void deleteProduct(String pId) {//상품 삭제
		productDao.deleteProduct(pId);
	}

}