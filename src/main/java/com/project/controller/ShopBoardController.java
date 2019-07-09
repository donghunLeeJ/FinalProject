package com.project.controller;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.dto.ShopBoardDTO;
import com.project.paging.ShopPaging;
import com.project.service.ShopBoardService;

import com.project.dto.ShopBoardDTO;
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
}


    //판매글 올리는 폼으로 이동시킬 때 들어오는 곳
    @RequestMapping("/ShopBoard_write")
    public String ShopBoard_WriteMove(){

	System.out.println("이동했냐");
	return "/shopBoard/shopBoard_write";}
	

    
    
	//클라이언트에서 판매글을 올리는 순간 들어오는 곳
	@RequestMapping("/ShopBoardInsertProc")
	public String ShopBoardInsertProc(ShopBoardDTO dto){
		
	//아이디가 세션에서 들어왔다고 가정함
	String id = "kkjangel";
		
	String resourcePath = session.getServletContext().getRealPath("/resources/img/shopfoodimg/");
	System.out.println(resourcePath);
	
	File targetFile = new File(resourcePath + "/"+ System.currentTimeMillis() + "_foodimage.png");
	
	System.out.println("타겟파일 경로 " + targetFile.getAbsolutePath());
	
	try{dto.getShop_image().transferTo(targetFile);}
	catch (Exception e){e.printStackTrace();}
	
	dto.setShop_id(id);
	dto.setShop_imagepath("/resources/img/shopfoodimg/"+targetFile.getName());
	int result = sService.ShopBoardInsert(dto);
	
	if(result > 0) {System.out.println("정상적으로 삽입 완료됨");}	
	
	return "redirect:../home";}
	
	
	
	
	
	@RequestMapping("/ShopBoardSelectProc")
	public String ShopBoardSelectProc(HttpServletRequest request){
		
		List<ShopBoardDTO>list = sService.ShopBoardSelect();
		ShopBoardDTO targetList = sService.ShopBoardIdSelect(4);
		
			//for(ShopBoardDTO d:list){System.out.println(d.getShop_seq() +" : " +d.getShop_id() + " : " + d.getShop_imagepath());}
				
			System.out.println("타겟id: " + targetList.getShop_id());
		
		return "/shopBoard/shopBoard_view";
	}
	
	
}

