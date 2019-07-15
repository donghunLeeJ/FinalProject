package com.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.OrderDTO;

@Component
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public int orderInsert(OrderDTO dto) {

		return sst.insert("OrderDAO.insert", dto);
	}
}
