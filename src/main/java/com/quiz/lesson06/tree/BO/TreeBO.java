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
	public void addTree(String name, String date, int day, int headcount, String phoneNumber) {
		treeMapper.insertTree(name, date, day, headcount, phoneNumber);
	}
	
	// output : treeeList -> null or tree
	public Tree getTree(String name, String phoneNumber) {
		List<Tree> treeList =  treeMapper.selectTree(name, phoneNumber);
		// mybatis 는 원소가 없으면 []를 리턴한다.
		// 리스트가 비어있으면 null 이 아닌 []
		if(treeList.isEmpty()) {
			return null;
		} 
		
		// 리스트가 비어있지 않으면 마지막 객체 리턴
		return treeList.get(treeList.size() - 1);
	}
}
