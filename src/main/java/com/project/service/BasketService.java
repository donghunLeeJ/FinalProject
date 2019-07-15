package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.BasketDAO;
import com.project.dto.BasketDTO;
@Service
public class BasketService {
	
	@Autowired
	private BasketDAO dao;
	
	public int basketInsert(BasketDTO dto) {
		return dao.basketInsert(dto);
	}
	
	public BasketDTO basketIdSelect(int seq) {
		return dao.basketIdSelect(seq);
	}
}
