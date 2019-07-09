package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dao.Tl_BoardDAO;
import com.project.dto.Tl_BoardDTO;

@Component
public class TimeLineService {
	
	@Autowired
	Tl_BoardDAO dao;
	
	public void write(Tl_BoardDTO dto) {
		dao.write(dto);
	}
}
