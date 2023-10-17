package com.quiz.lesson06.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.domain.Url;

@Repository
public interface UrlMapper {
	public void insertUser(@Param("name")String name, @Param("url") String url);
	
	public List<Url> selectUrl();
}
