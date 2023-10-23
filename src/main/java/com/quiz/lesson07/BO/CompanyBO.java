package com.quiz.lesson07.BO;

import java.time.ZonedDateTime;
import java.util.Optional;

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
			return companyRepository.save(
					company);

		
	}
	
	public CompanyEntity updateCompany(int id, String scale, int headCount) {
		CompanyEntity company = companyRepository.findById(id).orElse(null);
		if(company != null) {
			company = company.toBuilder()
			.scale(scale)
			.headcount(headCount)
			.build();
			
			company = companyRepository.save(company);
		}
		return company;
	} 
	
	public void deleteCompany(int id) {
//		CompanyEntity company = companyRepository.findById(id).orElse(null);
//		if(company != null) {
//			companyRepository.delete(company);
//		}
		Optional<CompanyEntity> companyOptional = companyRepository.findById(id);
				companyOptional.ifPresent(c -> companyRepository.delete(c));
	}
	
	
}
