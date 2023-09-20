package com.quiz.quiz01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class QuizController {
	@ResponseBody
	@RequestMapping("/quiz1")
	public String quiz01() {
		return "Hello world!";
	}
}
