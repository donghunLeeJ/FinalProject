package com.project.dao;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.BasketDTO;
@Component
public class BasketDAO {

	@Autowired
	private HttpSession session;
	@Autowired
	private DataSource ds;
	@Autowired
	private SqlSessionTemplate sst;
	
	public int basketInsert(BasketDTO dto) {
		return sst.insert("basket.basketInsert",dto);
	}
	
	public BasketDTO basketIdSelect(int basket_seq) {
		return sst.selectOne("basket.basketIdSelect",basket_seq);
	}
}
