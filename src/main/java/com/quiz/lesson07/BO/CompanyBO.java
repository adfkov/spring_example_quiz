package com.quiz.lesson07.BO;

import java.time.ZonedDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson07.entity.CompanyEntity;
import com.quiz.lesson07.repository.CompanyRepository;

@Service
public class CompanyBO {
	@Autowired
	private CompanyRepository companyRepository;
	
	public CompanyEntity insertCompany(String name,String business,String scale, int headcount) {

		
		CompanyEntity company = CompanyEntity.builder()
				.name(name)
				.business(business)
				.scale(scale)
				.headcount(headcount)
				.createdAt(ZonedDateTime.now())
				.build();
			return companyRepository.save(company);
				
//		public StudentEntity addStudent(String name, String phoneNumber, String email, String dreamJob) {
//			StudentEntity student = StudentEntity.builder()
//					.name(name)
//					.phoneNumber(phoneNumber)
//					.email(email)
//					.dreamJob(dreamJob)
//					.createdAt(ZonedDateTime.now()) // @UpdateTimestamp 있으면 생략 가능
//					.build();
//			return studentRepository.save(student); // insert 문을 만든다.
//			
		
	}
	
	
}
