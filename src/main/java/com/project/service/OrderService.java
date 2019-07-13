package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.OrderDAO;
import com.project.dto.OrderDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;
	
	public int orderInsert(OrderDTO dto) {
		
		return dao.orderInsert(dto);
	}
}
