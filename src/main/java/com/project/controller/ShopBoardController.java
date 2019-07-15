
package com.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.project.dto.BasketDTO;
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
	public String ShopBoardSelectProc(String seq) {
		
		int shop_seq = Integer.parseInt(seq);
		ShopBoardDTO dto = sService.ShopBoardIdSelect(shop_seq);
		request.setAttribute("dto", dto);

		return "/shopBoard/shopBoard_view";
	}

	@RequestMapping("/ShopBoardInsertProc")
	public String filetest(ShopBoardDTO dto, List<MultipartFile> shop_images , String shop_expiration) {
		List<String> fileArrayPath = new ArrayList();

		int fileCount = 0;	
		for (MultipartFile image : shop_images){

			//if(fileCount>2){System.out.println("이미지는 최대 3개까지만 업로드 가능.");break;}

			if(image.getSize() != 0 ) {			String originFileName = image.getOriginalFilename();
			long fileSize = image.getSize();
			
			String resourcePath = session.getServletContext().getRealPath("/resources/img/shopfoodimg/");
			
			String targetFile = resourcePath + "/" + UUID.randomUUID().toString().replace("-","").substring(0,8) + "_foodimage.png";
			try {

				File f = new File(targetFile);
				image.transferTo(f);
				fileArrayPath.add("/img/shopfoodimg/" +f.getName());
				fileCount++;

			}catch (Exception e) {
				e.printStackTrace();
			} 
		}			
	}
				
		if(fileCount==1){
			
			fileArrayPath.add("/img/default.jpg");
			fileArrayPath.add("/img/default.jpg");
			dto.setShop_imagepath1(fileArrayPath.get(0));
			dto.setShop_imagepath2(fileArrayPath.get(1));
			dto.setShop_imagepath3(fileArrayPath.get(2));

		}else if(fileCount==2) {
			
			fileArrayPath.add("/img/default.jpg");
			dto.setShop_imagepath1(fileArrayPath.get(0));
			dto.setShop_imagepath2(fileArrayPath.get(1));
			dto.setShop_imagepath3(fileArrayPath.get(2));

		}else if(fileCount > 2){
			
			dto.setShop_imagepath1(fileArrayPath.get(0));
			dto.setShop_imagepath2(fileArrayPath.get(1));
			dto.setShop_imagepath3(fileArrayPath.get(2));		

		}
				
		MemberDTO mdto = (MemberDTO) session.getAttribute("id");
		//dto.setShop_id(mdto.getMember_id());
		dto.setShop_id("kkjangel");
		int result = sService.ShopBoardInsert(dto);
		return "redirect:../home";
	}

	@RequestMapping("/shopBoard_buyProc")
	public String buyProc() {

		return "/shopBoard/shopBoard_buy";
	}
	

	// 아임포트 api
	// @RequestMapping("/ShopBoard_import")
	// public String importAPI() {
	//
	// }
}
