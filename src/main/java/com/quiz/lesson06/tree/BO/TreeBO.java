package com.quiz.lesson06.tree.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.tree.domain.Tree;
import com.quiz.lesson06.tree.mapper.TreeMapper;

@Service
public class TreeBO {
	@Autowired
	private TreeMapper treeMapper;
	
	public List<Tree> getTreeList() {
		
		return treeMapper.selectTreeList();
	}

}
