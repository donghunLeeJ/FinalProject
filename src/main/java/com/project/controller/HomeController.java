package com.project.controller;




import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/home")
public class HomeController {
	@RequestMapping("")
	public String home() {
		return "home";
	}
	@RequestMapping("ee")
	public String eee() {
		return "timeLine/timeLine";
	}
	
}
