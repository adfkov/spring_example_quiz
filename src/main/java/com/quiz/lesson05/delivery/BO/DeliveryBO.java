package com.quiz.lesson05.delivery.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.delivery.domain.Store;
import com.quiz.lesson05.delivery.mapper.DeliveryMapper;

@Service
public class DeliveryBO {
	@Autowired
	private DeliveryMapper deliveryMapper;
	
	public List<Store> getStores() {
		return deliveryMapper.selectStores();
	}

}
