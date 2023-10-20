package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.BO.CompanyBO;
import com.quiz.lesson07.entity.CompanyEntity;

@RestController
@RequestMapping("/lesson07/quiz01")
public class Lesson07Quiz01RestController {
	@Autowired
	private CompanyBO companyBO;
	@RequestMapping("/save1")
	public CompanyEntity addCompany() {
		
		String name = "넥손";
		String business = "컨텐츠 게임";
		String scale="대기업";
		int headcount = 3585;
		
		return companyBO.insertCompany(name,business,scale,headcount);
		
		
	}

}
