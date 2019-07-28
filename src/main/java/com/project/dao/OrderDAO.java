package com.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.OrderDTO;

@Component
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public int orderInsert(OrderDTO dto) {
		System.out.println(dto.toString());
		return sst.insert("OrderDAO.orderInsert", dto);
	}

	public List<OrderDTO> myOrderList(String id) {

		return sst.selectList("OrderDAO.myOrderList", id);
	}

	public List<OrderDTO> sellOrderList(int seq) {
		return sst.selectList("OrderDAO.sellOrderList", seq);
	}

	public List<OrderDTO> popup(int seqq) {
		return sst.selectList("OrderDAO.popup", seqq);
	}

	public int orderCount() {
		return sst.selectOne("OrderDAO.orderCount");
	}

	public int deliveryOk(OrderDTO dto) {
		return sst.update("OrderDAO.deliveryOk", dto);
	}
}
