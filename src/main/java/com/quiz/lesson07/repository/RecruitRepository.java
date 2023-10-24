package com.quiz.lesson07.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson07.entity.RecruitEntity;

@Repository
public interface RecruitRepository extends JpaRepository<RecruitEntity, Integer>{
	// Spring Data JPA
	// findById
	
	// JPQL=> 엔티티에게 조회 / param 안해도 됨
	public List<RecruitEntity> findByCompanyId(int companyId);
	public List<RecruitEntity> findByPositionAndType(String position,String type);

	public List<RecruitEntity> findByTypeOrSalaryGreaterThanEqual(String type,int salary);
	public List<RecruitEntity> findTop3ByTypeOrderBySalaryDesc(String type);
	public List<RecruitEntity> findByRegionAndSalaryBetween(String region, int salaryStart, int salaryEnd); // 이름은 아무거나 해도 됨
	
	
	@Query(value = "select * from `interview`"
			+ " where `deadline` > :deadline "
			+ "and `type` =:type"
			+ " and `salary` >= :salary "
			+ "order by salary desc", nativeQuery = true)
	public List<RecruitEntity> findByDeadlineAndSalaryGreaterThanEqualAndTypeOrderBySalaryDesc(
			@Param("deadline") LocalDate deadline 
			, @Param("salary") int salary
			, @Param("type")String type);
	//@Param("deadline") LocalDate deadline
}
