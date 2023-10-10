package com.quiz.lesson04.mapper;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.domain.Realtor;

@Repository
public interface RealtorMapper {
	public void insertRealtor(Realtor realtor); // map으로 감쌀 필요없음

	public Realtor selectRealtorById(int id);
	
}
