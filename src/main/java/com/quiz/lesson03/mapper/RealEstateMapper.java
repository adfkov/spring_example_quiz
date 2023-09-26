package com.quiz.lesson03.mapper;

import java.util.List;

//import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.domain.RealEstate;

@Repository
public interface RealEstateMapper {
	
	public RealEstate getRealEstateById(int id);

	public List<RealEstate> selectRealEstateListByRentPrice(@Param("rentPrice1")int rentPrice); 
	// 하나이면 맵으로 할 필요 없다. @Param 쓰면 xml에서 map으로 타입을 써야함

	public List<RealEstate> selectRealEstateListByRentPriceAndArea(
			@Param("price") int price12331, 
			@Param("area") int area234342);
	// 맵으로 만들어준다.
	
	public int insertRealEstate(RealEstate realEstate);
	
	public int insertRealEstateByField(
			@Param("realtorId") int realtorId,
			@Param("address")String address,
			@Param("area")int area ,
			@Param("type")String type , 
			@Param("price")int price , 
			@Param("rentPrice")Integer rentPrice);
	
	public int changeRealEstateById(
			@Param("id") int id,
			@Param("type") String type,
			@Param("price") int price
			);
	public int deleteRealEstate(int id);
	
	
}	

