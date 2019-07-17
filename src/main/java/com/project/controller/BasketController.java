package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.BasketDAO;
import com.project.dto.BasketDTO;
import com.project.dto.MemberDTO;
import com.project.dto.ShopBoardDTO;
import com.project.service.BasketService;
import com.project.service.ShopBoardService;

@Controller
@RequestMapping("/Basket")
public class BasketController {

	@Autowired
	private BasketDAO dao;
	@Autowired
	private BasketService bservice;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private ShopBoardService sService;
	@Autowired
	private HttpSession session;

	@RequestMapping("/basketInsert") // 샵 시퀀스
	public String basketInsert(String seq, String quantity) {
		int result_seq = Integer.parseInt(seq);
		int result_quantity = Integer.parseInt(quantity); // 수량
		System.out.println(result_quantity);
		
		ShopBoardDTO sdto = sService.ShopBoardIdSelect(result_seq);
			sdto.setShop_quantity(result_quantity);
		String id = ((MemberDTO) session.getAttribute("id")).getMember_id();

			int price = sdto.getShop_price();
			int totalPrice = result_quantity*price;
			
			sdto.setShop_price(totalPrice);
			
		sdto.setShop_id(id);
		dao.basketInsert(sdto);
		List<BasketDTO> result = bservice.basketIdSelect(id);

		System.out.println(result.get(0).getBasket_imagepath());
		request.setAttribute("list", result);
		request.setAttribute("sdto", sdto);
		return "/shopBoard/shopBoard_basket";
	}

	@RequestMapping("/basketList")
	public String basketSelectProc(BasketDTO basket_seq) {

		System.out.println(basket_seq);

		// BasketDTO dto = bservice.basketIdSelect(seq);
		// request.setAttribute("dto", dto);

		// System.out.println(dto.getBasket_title());

		return "/shopBoard/shopBoard_basket";
	}

	@RequestMapping("/basketDelete")
	public String deleteProc(String basket_seq) {
		System.out.println("dddd");
		int seq = Integer.parseInt(basket_seq);
		System.out.println("바스켓             시퀀스      " + basket_seq);

		int deleteseq = dao.basketDelete(seq);
		System.out.println("삭제 되면 1을 보여라    " + deleteseq);
		MemberDTO mdto = (MemberDTO) session.getAttribute("id");
		String id = mdto.getMember_id();
		System.out.println("세션 아이디  : " + id);

		List<BasketDTO> result = bservice.basketIdSelect(id);
		// dto.setBasket_id(id);
		request.setAttribute("list", result);

		return "/shopBoard/shopBoard_basket";
	}
}
