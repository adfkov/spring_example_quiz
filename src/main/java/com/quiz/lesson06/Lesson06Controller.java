package com.quiz.lesson06;

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

import com.quiz.lesson06.BO.UrlBO;
import com.quiz.lesson06.domain.Url;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	@Autowired
	private UrlBO urlBO;
	
	// 즐겨찾기 추가 : http://localhost/lesson06/quiz01/add-bookmark-view
	@GetMapping("/quiz01/add-bookmark-view")
	public String addBookmarkView() {
		return "lesson06/addBookmark";
	}
	
	@ResponseBody
	@PostMapping("/quiz01/add-bookmark")
	public Map<String, Object> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		urlBO.addUrl(name, url);
	
		// 응답값 : JSON String
//		{
//			"code":1,
//			"result":"success"
//		}
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "success");
		return result;
		
	} // data: 
	 
	// 즐겨찾기 목록 http://localhost/lesson06/quiz01/bookmark-list-view
	@GetMapping("/quiz01/bookmark-list-view")
	public String bookmarkListView(Model model) {
		List<Url> urlList = urlBO.getUrl();
		model.addAttribute("urlList", urlList);
		
		return "lesson06/bookmarkList";
	}
	
	
	// -------QUIZ 02 시작--------------
	// URL 중복확인 - AJAX 요청
	@ResponseBody
	@PostMapping("/quiz02/is-duplicated-url")
	public Map<String, Object> isDuplicatedUrl(
			@RequestParam("url") String url) {
		// db 조회
		Url urll = urlBO.getUrlByUrl(url);		
		
		// 응답 값
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("is_duplication", false); // 넣고 시작
		if(urll != null) {
			result.put("is_duplication", true); // 넣고 시작
		}
		return result;
	}
	
	// 삭제 기능 - AJAX 호출 : 버튼을 누를 때 이므로
	@ResponseBody
	@DeleteMapping("/quiz02/delete-bookmark")
	public Map<String, Object> deleteBookMark(
			@RequestParam("id") int id) {
		//db delete
		urlBO.deleteBookmarkById(id);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "성공");
		
		return result;
		
	}
	
}
