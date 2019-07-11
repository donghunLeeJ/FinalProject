package com.project.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {
	@RequestMapping("")
	// @RequestMapping("/home/join") : jsp���� ��Ʈ�ѷ��� ���� ��
	public String home() {
		return "home";
	}

}
