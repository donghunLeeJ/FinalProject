package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.ShopBoardDTO;
import com.project.paging.ShopPaging;
import com.project.service.ShopBoardService;

@Controller
@RequestMapping("/shopboard")
public class ShopBoardController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ShopBoardService sService;

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ShopPaging sPaging;
	
	@RequestMapping("/shopBoardGo")
	public String ShopBoardGo(String page) {
		int currentPage = Integer.parseInt(page);
		sPaging.sPaging(currentPage);
		List<ShopBoardDTO> boardList =  sService.ShopBoardList(currentPage);
		request.setAttribute("boardList", boardList);
		
		return "shopBoard/shopBoard";
	}

}