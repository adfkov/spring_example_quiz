package com.quiz.lesson05.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.quiz.lesson05.delivery.BO.DeliveryBO;
import com.quiz.lesson05.delivery.domain.Store;

//@RequestMapping("/lesson05/delivery")
@Controller
public class DeliveryController {
	@Autowired
	private DeliveryBO deliveryBO;
	
	@GetMapping("/lesson05/delivery")
		
	public String getStore(
			Model model) {
		// request: x
		// response: Store 객체
		List<Store> storeList = deliveryBO.getStores();
		model.addAttribute("stores", storeList);
		
		return "delivery/delivery";
		
	}
	
}
