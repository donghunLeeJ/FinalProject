package com.project.controller;




import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/home")
public class HomeController {
	@RequestMapping("")
	//@RequestMapping("/home/join") : jsp에서 컨트롤러로 보낼 때
	public String home() {
		return "home";
	}
	
}
