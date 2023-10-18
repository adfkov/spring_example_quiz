package com.quiz.lesson06.tree.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson06.tree.domain.Tree;

@Repository
public interface TreeMapper {
	public List<Tree> selectTreeList();
	
}
