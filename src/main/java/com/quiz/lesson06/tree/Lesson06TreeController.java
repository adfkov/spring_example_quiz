package com.quiz.lesson06.tree;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson06.tree.BO.TreeBO;
import com.quiz.lesson06.tree.domain.Tree;

@Controller
@RequestMapping("/lesson06")
public class Lesson06TreeController {
	@Autowired
	private TreeBO treeBO;
	
	@GetMapping("/quiz03/1")
	public String quiz03(Model model) {
		List<Tree> treeList = treeBO.getTreeList();
		
		model.addAttribute("treeList", treeList);
		
		return "lesson06/list";
	}
	
	

}
