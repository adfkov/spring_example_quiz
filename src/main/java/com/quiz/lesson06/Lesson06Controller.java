package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@PostMapping("/quiz01/add-bookmark")
	@ResponseBody
	public String addBookmark(
			@RequestParam("name") String name,
			@RequestParam("address") String address
			) {
		urlBO.addUrl(name, address);
		return "성공";
	}
	
	// 즐겨찾기 목록
	@GetMapping("/quiz01/bookmark-list-view")
	public String bookmarkListView(Model model) {
		List<Url> urlList = urlBO.getUrl();
		model.addAttribute("urlList", urlList);
		
		return "lesson06/bookmarkList";
	}
	
}
