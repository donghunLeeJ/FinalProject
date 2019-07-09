package com.project.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.dto.MemberDTO;
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
		int lastPage = currentPage * 12;
		sPaging.sPaging(currentPage);
		List<ShopBoardDTO> boardList = sService.ShopBoardList(lastPage);
		request.setAttribute("boardList", boardList);
		System.out.println(boardList.get(0).getShop_imagepath());
		return "shopBoard/shopBoard";
	}

	@RequestMapping(value = "/shopBoardScroll", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ShopBoard_ScrollList(String page) {
		int currentPage = Integer.parseInt(page);
		currentPage += 1;
		int lastPage = currentPage * 12;
		sPaging.sPaging(currentPage);
		List<ShopBoardDTO> boardList = sService.ShopBoardList(lastPage);
		return new Gson().toJson(boardList);

	}

	@RequestMapping("/ShopBoard_write")
	public String ShopBoard_WriteMove() {

		return "/shopBoard/shopBoard_write";
	}

	@RequestMapping("/ShopBoardInsertProc")
	public String ShopBoardInsertProc(ShopBoardDTO dto) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("id");
		String id = mdto.getMember_id();
		String resourcePath = session.getServletContext().getRealPath("/resources/img/shopfoodimg/");
		System.out.println(resourcePath);
		File targetFile = new File(resourcePath + "/" + System.currentTimeMillis() + "_foodimage.png");
		System.out.println(targetFile.getAbsolutePath());
		try {
			dto.getShop_image().transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setShop_id(id);
		dto.setShop_imagepath("/img/shopfoodimg/" + targetFile.getName());
		int result = sService.ShopBoardInsert(dto);

		if (result > 0) {
			System.out.println("�젙�긽�쟻�쑝濡� �궫�엯 �셿猷뚮맖"); // ?
		}
		return "redirect:../home";
	}

	@RequestMapping("/ShopBoardViewProc")
	public String ShopBoardSelectProc() {

		List<ShopBoardDTO> list = sService.ShopBoardSelect();
		ShopBoardDTO targetList = sService.ShopBoardIdSelect(4);


		System.out.println("��寃웙d: " + targetList.getShop_id());

		return "/shopBoard/shopBoard_view";
	}

}
