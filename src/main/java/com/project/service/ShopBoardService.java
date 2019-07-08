package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ShopBoardDAO;
import com.project.dto.ShopBoardDTO;

@Service
public class ShopBoardService {

	@Autowired
	private ShopBoardDAO sdao;

	public List<ShopBoardDTO> ShopBoardList(int currentPage) {
		return sdao.shopBoardList(currentPage);
	}
}
