package com.quiz.lesson06.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson06.domain.Url;

@Repository
public interface UrlMapper {
	public void insertUser(String name, String address);
	
	public List<Url> selectUrl();
}
