package com.quiz.lesson06.tree.BO;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson06.tree.domain.Tree;
import com.quiz.lesson06.tree.mapper.TreeMapper;

@Service
public class TreeBO {
	@Autowired
	private TreeMapper treeMapper;
	
	public List<Tree> getTreeList() {
		
		return treeMapper.selectTreeList();
	}
	
	public void deleteTreeById(int id) {
		treeMapper.deleteTreeById(id);
	}
//	
//	@RequestParam("name") String name
//	,@RequestParam("date") Date date
//	,@RequestParam("day") int day
//	,@RequestParam("headcount") int headcount
//	,@RequestParam("phoneNumber") String phoneNumber
	public void addTree(String name, Date date, int day, int headcount, String phoneNumber) {
		treeMapper.insertTree(name, date, day, headcount, phoneNumber);
	}
}
