package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.domain.RealEstate;
import com.quiz.lesson03.mapper.RealEstateMapper;

@Service // BO -> SERVICE 하면 SPRING BEAN 이 됨
public class RealEstateBO {
	// INPUT : id(정수)
	// output: RealEstate
	@Autowired
	private RealEstateMapper realEstateMapper; // 일 시킨다.
	
	public RealEstate getRealEstateById(int id) { // id로 단건을 가져온다
		// 레포지트리에게 시킬 것
		return realEstateMapper.getRealEstateById(id);
	}
	
	//input : rentPrice
	//output: List<RealEstate>
	
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		
		return realEstateMapper.selectRealEstateListByRentPrice(rentPrice);
	}
	
	public List<RealEstate> getRealEstateListByRentPriceAndArea(int price , int area) {
		
		return realEstateMapper.selectRealEstateListByRentPriceAndArea(price, area);
	}
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateMapper.insertRealEstate(realEstate);
	}
	
//	addRealEstateByField("썅떼빌리버 오피스텔 814호", 45, "월세" , 100000, 120);
	public int addRealEstateByField(int realtorId , String address, int area , String type , int price , Integer rentPrice) {
		return realEstateMapper.insertRealEstateByField(realtorId,address, area, type, price, rentPrice);
	}
}

// controller -> bo -> mapper ->