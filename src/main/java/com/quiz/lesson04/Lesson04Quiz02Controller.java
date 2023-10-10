package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.domain.Realtor;

@RequestMapping("/lesson04/quiz02")
//@Rest  : json 
@Controller
public class Lesson04Quiz02Controller {
	@Autowired
	private RealtorBO realtorBO;
	// 요청 url: http://localhost:8080/lesson04/quiz02/add-realtor-view
	@GetMapping("/add-realtor-view")
	public String addRealtorView() {
		
		return "lesson04/addRealtor";
	}
	
	// 요청 url: http://localhost:8080/lesson04/quiz02/add-realtor
	@PostMapping("/add-realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) { // view 페이지로 보냄
		//Insert
		realtorBO.addRealtor(realtor);
		//받아온 id로 SELECT => Model에 집어넣음
		Realtor newRealtor = realtorBO.getRealtorById(realtor.getId());
		// model 에 담는다.
		model.addAttribute("realtor",newRealtor);
				
		// response => jsp
		
		
		return "lesson04/afterAddRealtor";
	}

}
