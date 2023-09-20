package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson01Quiz03Controller {
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03() {
		// @ResponseBody 어노테이션이 없을 때 String을 리턴하면
		// ViewResolver로 동작
		return "lesson01/quiz03";
	}
}
