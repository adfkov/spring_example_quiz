package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.domain.Seller;
import com.quiz.lesson04.mapper.SellerMapper;

@Service
public class SellerBO {
	@Autowired
	private SellerMapper sellerMapper;
	
	// input : 3개 파라미터
	// output: 성공한 행의 개수
	public void addSeller(String nickname, String profileImageUrl, Double temperature) {
		sellerMapper.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	//input: x
	// output: seller(최신 가입자 1명)
	
	public Seller getLatestSeller() {
		
		return sellerMapper.selectLatestSeller();
	}	
	
	public Seller getLatestSellerById(int id) { // bo 입장에서는 id가 null 일 수 없음
		
		return sellerMapper.selectLatestSellerById(id);
	}
	
	
	
}
