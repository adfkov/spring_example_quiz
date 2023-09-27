package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.domain.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz04Controller {
	@Autowired
	private SellerBO sellerBO;
	// 1번 문제
	// http://localhost/lesson04/quiz01/add-seller-view
	@GetMapping("/add-seller-view")
	public String addSellerView() {
		
		return "lesson04/addSeller";
	}
	
	// 1번 문제: 판매자 db에 추가 => 입력 성공 페이지로 이동
	@PostMapping("/add-seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam(value="temperature", required=false) Double temperature) {
		
		// db insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/afterAddSeller";
		
	}
	
	// 2번문제: 최신 가입자 한명 출력 페이지
	// http://localhost/lesson04/quiz01/seller-info
	@GetMapping("/seller-info")
	public String sellerInfo(Model model
			,@RequestParam(value="id", required=false) Integer id) {
		// select 할 때 seller 객체 필요
		Seller seller = null;
		if(id == null) {
			seller = sellerBO.getLatestSeller();
		}
		else {
			seller = sellerBO.getLatestSellerById(id);
		}
		model.addAttribute("seller", seller);
		return "/lesson04/sellerInfo";
	}
	
}
