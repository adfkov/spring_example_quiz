package com.quiz.lesson06.tree.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.tree.domain.Tree;

@Repository
public interface TreeMapper {
	public List<Tree> selectTreeList();

	public void deleteTreeById(int id);
	
	public void insertTree(
			@Param("name") String name, 
			@Param("date") String date, 
			@Param("day")int day,
			@Param("headcount")int headcount, 
			@Param("phoneNumber")String phoneNumber);
	
	public List<Tree> selectTree(
			@Param("name")String name
			,@Param("phoneNumber") String phoneNumber);
}
