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

	public List<OrderDTO> myOrderList(String id){

		return sst.selectList("OrderDAO.myOrderList",id);
	}
}
