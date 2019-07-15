package com.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {
	//private static final Logger Logger = LoggerFactory.getLogger(HomeController.class);//sysout대신에 사용함
	
	@RequestMapping("")
	public String home(String id) {
	//	Logger.info("message is {}.",id);
		return "home";
	}
	@RequestMapping("/admin")
	public String adhome() {
		return "/admin/adminhome";
	}

}
