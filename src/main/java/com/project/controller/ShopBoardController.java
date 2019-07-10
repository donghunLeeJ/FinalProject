package com.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		System.out.println(boardList.get(0).getShop_imagepath1());
		return "shopBoard/shopBoard";
	}

	@RequestMapping(value = "/shopBoardScroll", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ShopBoard_ScrollList(String page) {
		int currentPage = Integer.parseInt(page);
		int lastPage = currentPage * 12;
		sPaging.sPaging(currentPage);
		List<ShopBoardDTO> boardList = sService.ShopBoardList(lastPage);
		return new Gson().toJson(boardList);

	}

	
	@RequestMapping("/ShopBoard_write")
	public String ShopBoard_WriteMove() {

		return "/shopBoard/shopBoard_write";
	}
	
	@RequestMapping("/ShopBoardViewProc")
	public String ShopBoardSelectProc(String seq){
		 int shop_seq = Integer.parseInt(seq);
	      ShopBoardDTO dto = sService.ShopBoardIdSelect(shop_seq);
	      request.setAttribute("dto", dto);

	      return "/shopBoard/shopBoard_view";
	}
	
	@RequestMapping("/ShopBoardInsertProc")
	public String filetest(ShopBoardDTO dto , List<MultipartFile> shop_image){
		List<String> fileArrayPath = new ArrayList();
		
		System.out.println("여기로 옴");
		System.out.println(dto.getShop_price());
	
		for (MultipartFile image : shop_image){
			
			if(image.getSize() != 0 ) {	
			String originFileName = image.getOriginalFilename();
			long fileSize = image.getSize();
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			String resourcePath = session.getServletContext().getRealPath("/resources/img/shopfoodimg/");
			System.out.println(resourcePath);
			String targetFile = resourcePath + "/" + System.currentTimeMillis() + "_foodimage.png";
			try {
				File f = new File(targetFile);
				image.transferTo(f);
				fileArrayPath.add("/img/shopfoodimg/" +f.getName());
				
			}catch (Exception e) {
				e.printStackTrace();
			} 
			
			}else {
				fileArrayPath.add("/img/default.jpg");
			}
		}
		
		dto.setShop_imagepath1(fileArrayPath.get(0));
		dto.setShop_imagepath2(fileArrayPath.get(1));
		dto.setShop_imagepath3(fileArrayPath.get(2));
		MemberDTO mdto = (MemberDTO)session.getAttribute("id");	
		dto.setShop_id(mdto.getMember_id());	
		int result = sService.ShopBoardInsert(dto);	
		return "redirect:../home";        
	}
	
	
}
