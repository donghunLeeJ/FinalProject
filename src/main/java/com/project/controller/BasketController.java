package com.project.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.BasketDAO;
import com.project.dto.BasketDTO;
import com.project.service.BasketService;



@Controller
@RequestMapping("/Basket")
public class BasketController {
	
	@Autowired
	private BasketDAO dao;
	@Autowired
	private BasketService bservice;
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/basketInsert")
	public String basketInsert(BasketDTO dto) {
		System.out.println("바스켓스켓바크스바스켓            "+dto.getBasket_expiration()+" : "+dto.getBasket_seq()+" : "+dto.getBasket_imagepath()
		+" : "+dto.getBasket_location()+" : "+dto.getBasket_price()+" : "+dto.getBasket_quantity()+" : "+dto.getBasket_title());
		
		dao.basketInsert(dto);
		
		return "/shopBoard/basketMovement";
	}
	@RequestMapping("/basketList")
	public String basketSelectProc(BasketDTO basket_seq) {
		
		System.out.println(basket_seq);
		
		//BasketDTO dto = bservice.basketIdSelect(seq);
		//request.setAttribute("dto", dto);
		
		//System.out.println(dto.getBasket_title());
		
		return "/shopBoard/shopBoard_basket";
	}
}
