package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.BasketDAO;
import com.project.dto.BasketDTO;
import com.project.dto.ShopBoardDTO;
@Service
public class BasketService {
	
	@Autowired
	private BasketDAO dao;
	
	public int basketInsert(ShopBoardDTO dto) {
		return dao.basketInsert(dto);
	}
	
	public List<BasketDTO> basketIdSelect(String id) {
		return dao.basketIdSelect(id);
	}
	
	public int basketDelete(int basket_seq) {
		return dao.basketDelete(basket_seq);
	}
	
	public BasketDTO basketListBuy(String basket_seq){
		return dao.basketListBuy(basket_seq);
	}
	public int resetBasket(String id){
		return dao.resetBasket(id);
	}
	
}
