package com.quiz.lesson05.delivery.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.delivery.domain.Store;

@Repository
public interface DeliveryMapper {
	public List<Store> selectStores();
}
