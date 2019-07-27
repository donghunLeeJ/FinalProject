package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.ShopBoardService;

@Controller
@RequestMapping("/home")
public class HomeController {
	@Autowired
	private ShopBoardService sservice;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("")
	public String home(String id,HttpSession session) {
		request.setAttribute("boardList", sservice.ShopBoardList(4));
		return "home";
	}
	
	@RequestMapping("/admin")
	public String adhome() {
		return "admin/adminhome";
	}
	
	@RequestMapping("/service")
	public String service() {
		return "service/service";
	}

	@RequestMapping("/minilog")
	public String mini() {
		return "loginMini";
	}


}
