package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.BO.CompanyBO;
import com.quiz.lesson07.entity.CompanyEntity;

@RestController
@RequestMapping("/lesson07/quiz01")
public class Lesson07Quiz01RestController {
	// http://localhost/lesson07/quiz01/save1
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
	// http://localhost/lesson07/quiz01/save2
	@GetMapping("/save2")
	public CompanyEntity save2() {
		return companyBO.insertCompany("버블팡", "여신 금융업", "대기업", 6834);
	}

	// http://localhost/lesson07/quiz01/save3
	@GetMapping("/save3")
	public CompanyEntity save3() {
		CompanyEntity company = companyBO.updateCompany(8, "중소기업", 34);
		return company;
	}
	// http://localhost/lesson07/quiz01/save4
	@GetMapping("/save4")
	public String save4() {
		companyBO.deleteCompany(8);
		return "삭제 완료";
	}
	
	
	
}
