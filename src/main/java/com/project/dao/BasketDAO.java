package com.project.dao;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.BasketDTO;
import com.project.dto.ShopBoardDTO;

@Component
public class BasketDAO {

	@Autowired
	private HttpSession session;
	@Autowired
	private DataSource ds;
	@Autowired
	private SqlSessionTemplate sst;
	
	public int basketInsert(ShopBoardDTO dto) {
		return sst.insert("basket.basketInsert",dto);
	}
	
	public List<BasketDTO> basketIdSelect(String id) {
		return sst.selectList("basket.basketIdSelect",id);
	}
	
	public int basketDelete(int seq) {
		return sst.delete("basket.basketDelete",seq);
	}
	
}
