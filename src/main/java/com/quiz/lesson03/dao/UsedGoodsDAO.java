package com.quiz.lesson03.dao;

import java.util.List;

import com.quiz.lesson03.quiz01.model.UsedGoods;

public interface UsedGoodsDAO {
	public List<UsedGoods> selectUsedGoodsList(int id);
	
}
