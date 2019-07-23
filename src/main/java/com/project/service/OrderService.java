package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.OrderDAO;
import com.project.dto.OrderDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;

	public void orderInsert(OrderDTO odto) {
		dao.orderInsert(odto);
	}

	public List<OrderDTO> myOrderList(String id) {
		return dao.myOrderList(id);
	}


	public List<OrderDTO> sellOrderList(int seq) {
		return dao.sellOrderList(seq);

	}
}
