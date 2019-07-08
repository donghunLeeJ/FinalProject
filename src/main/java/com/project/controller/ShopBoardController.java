package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;

import com.project.dto.ShopBoardDTO;

@Controller
@RequestMapping("/shopboard")
public class ShopBoardController {
	
@Autowired	
HttpSession session;	
	
	@RequestMapping("/ShopBoard_write")
	public String ShopBoard_WriteMove(){
		
		System.out.println("이동했냐");
		return "shopBoard/shopBoard_write";}

		
	@RequestMapping("/ShopBoardProc")
	public String ShopBoardProc(ShopBoardDTO dto){
		
	String resourcePath = session.getServletContext().getRealPath("/resources");
	
	System.out.println(resourcePath);
    System.out.println("랄라라");
	System.out.println(dto.getShop_title());
	System.out.println(dto.getShop_id());
	System.out.println(dto.getShop_image());
	
	return "shopBoard/shopBoard_write";}
	
	
	
	
	
	
	
}
