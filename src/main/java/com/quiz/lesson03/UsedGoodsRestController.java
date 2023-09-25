package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.domain.RealEstate;

@RequestMapping("/lesson03/quiz01")

@RestController // 빈 등록
public class UsedGoodsRestController {
	
	@Autowired // 
	private RealEstateBO realEstateBO;
	// 요청 주소: http://localhost:8080/lesson03/quiz01/1
	@RequestMapping("/1")
	public RealEstate quiz01(
			@RequestParam(value="id", required=true) int id)
	 {
		// 아래 쪽 bo에게
		return realEstateBO.getRealEstateById(id);
	 }
	
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2(
			@RequestParam("rent_price") int rentPrice) {
				
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	
	}
	
	
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3(
			@RequestParam(value="price") int price,
			@RequestParam(value="area") int area
			) {
				
		return realEstateBO.getRealEstateListByRentPriceAndArea(price, area);
	
	}
		
	}
