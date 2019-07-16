package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.OrderDAO;
import com.project.dto.OrderDTO;
import com.project.dto.OrderListDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;
	
	public void orderInsert(OrderDTO odto) {
		dao.orderInsert(odto);
	}
}
