package com.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.dto.Tl_BoardDTO;

public class Tl_BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public int write(Tl_BoardDTO dto) {
		return sst.insert("Tl_BoardDAO.tl_board_insert",dto);
	}
}
