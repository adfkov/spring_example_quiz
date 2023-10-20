package com.quiz.lesson06.tree;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.tree.BO.TreeBO;
import com.quiz.lesson06.tree.domain.Tree;

@Controller
@RequestMapping("/lesson06")
public class Lesson06TreeController {
	@Autowired
	private TreeBO treeBO;
	// http://localhost/lesson06/quiz03/1
	@GetMapping("/quiz03/1")
	public String quiz03(Model model) {
		List<Tree> treeList = treeBO.getTreeList();
		
		model.addAttribute("treeList", treeList);
		
		return "lesson06/list";
	}
	
	@GetMapping("/quiz03/reserve")
	public String quiz03_reserve() {
		
		return "lesson06/reserve";
	}
	
	// 예약 삭제 기능 -> ajax 가 하는 기능
	@DeleteMapping("/quiz03/delete-tree")
	@ResponseBody
	public Map<String, Object> deleteTree( // map으로 리턴해서 json으로 만들기
			@RequestParam("id") int id) {
		treeBO.deleteTreeById(id);
		Map<String, Object> result = new HashMap<>();
		
		result.put("code", 200);
		result.put("result", "success");
		return result;
		
	}
	// 예약 추가 insert -> ajax 요청
	@PostMapping("/quiz03/add-tree")
	@ResponseBody
	public Map<String, Object> addTree( 
			@RequestParam("name") String name
			,@RequestParam("date") String date
			,@RequestParam("day") int day
			,@RequestParam("headcount") int headcount
			,@RequestParam("phoneNumber") String phoneNumber
			) {
		// DB INSERT
		treeBO.addTree(name, date, day, headcount, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "success");
		
		return result; // JSON String
		
			
		}
	
	// 예약 확인 초기 페이지
	@GetMapping("/quiz03/view-tree")
	public String viewTree() {
		
		return "lesson06/tree";
	}
	
	// 예약 확인 AJAX가 요청
	@PostMapping("/quiz03/find-tree")
	@ResponseBody // model을 사용할 수 없다. model은 return값이 jsp로 갈 때만 사용할 수 있다. responsebody가 있을 때는 view로 갈 수 없기 때문에..
	public Map<String, Object> find_tree(
			@RequestParam("name") String name
			,@RequestParam("phoneNumber") String phoneNumber
			) {
		//db 조회
		Tree bookingTree = treeBO.getTree(name, phoneNumber);
//		model.addAttribute("bookingTree",bookingTree);
		
		
		// {"code": 200, "result": tree}
		// {"code": 200, "result": {"id": 1  , "name":....}
		Map<String, Object> result = new HashMap<>();
		if(bookingTree == null) {
			result.put("code", 400);
			result.put("error_message", "데이터가 존재하지 않습니다.");
		} else {
			result.put("code", 200);
			result.put("result", bookingTree);			
		}

		return result;
	}
}
