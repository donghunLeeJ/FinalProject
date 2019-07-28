package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.OrderDAO;
import com.project.dto.MemberDTO;
import com.project.dto.OrderDTO;
import com.project.paging.BuyPaging;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;
	@Autowired
	private BuyPaging bp;

	public void orderInsert(OrderDTO odto) {
		dao.orderInsert(odto);
	}
	public List<OrderDTO> orderSelect(OrderDTO odto) {
		System.out.println("1");
		return dao.orderSelect(odto);
	}

	public List<OrderDTO> myOrderList(String id) {
		return dao.myOrderList(id);
	}

	public List<OrderDTO> sellOrderList(int seq) {
		return dao.sellOrderList(seq);

	}

	public int orderCount() {
		return dao.orderCount();
	}

	public List<String> Page(int page, int count) {
		return bp.myPaging(page, count);
	}

	public List<OrderDTO> orderTenList(int page, String member_email) {
		return bp.selectOrder(page, member_email);
	}

	public int deliveryOk(OrderDTO dto) {
		return dao.deliveryOk(dto);
	}
}
