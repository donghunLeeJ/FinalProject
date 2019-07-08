package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberService mservice;
	
	
	@RequestMapping("loginForm")
	public String goLogin() {
		return "member/login";
	}
	@RequestMapping("loginProc")
	public String login(MemberDTO mdto) {
		System.out.println(mdto.getMember_id());
		int result = mservice.login(mdto);
		if(result == 1) {
			session.setAttribute("id", mdto.getMember_id());
			return "redirect:/home";
		}else {
			return "notLogin";
		}
	}
	
	@RequestMapping("joinForm")
	public String goJoin() {
		return "member/joinMem";
	}
	@RequestMapping("joinProc")
	public String joinInsert(MemberDTO mdto) {
		System.out.println("조인 프록           "+mdto.getMember_id());
		int result = mservice.joinInsert(mdto);
		System.out.println(result);
		return "/home";
	}
	
	@RequestMapping("logOutProc")
	public String logout() {
		session.invalidate();
		return "redirect:/home";
	}
	
}
