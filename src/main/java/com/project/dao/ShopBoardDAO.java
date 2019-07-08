package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.ShopBoardDTO;

@Repository
public class ShopBoardDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public List<ShopBoardDTO> shopBoardList(int currentPage) {
	
		return sst.selectList("ShopBoardDAO.boardList", currentPage);
	}

	public int totalCount() {
	return sst.selectOne("ShopBoardDAO.totalCount");
	}

}
