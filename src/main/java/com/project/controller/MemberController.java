package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.HtmlEmailDAO;
import com.project.dto.MemberDTO;
import com.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private HttpSession session;
	@Autowired
	private MemberService mservice;
	@Autowired
	private HtmlEmailDAO edao;

	// @RequestMapping("/goMyPage")
	// public String goMyPage() {
	// return "/member/myPage.jsp";
	// }
	@RequestMapping("loginForm")
	public String goLogin() {
		return "member/login";
	}

	@RequestMapping("loginProc")
	public String login(MemberDTO mdto) {
		System.out.println("로그인프록  " + mdto.getMember_id());
		int result = mservice.login(mdto);
		if (result == 1) {
			String confirm=mservice.checkConfirm(mdto.getMember_id());
			if(confirm.equals("y")) {
			session.setAttribute("id", mservice.select_member(mdto.getMember_id()));
			return "redirect:/home";
			}else {
				return "notLogin";
			}
			
		} else {
			return "notLogin";
		}
	}

	@RequestMapping("joinForm")
	public String goJoin() {
		return "member/joinMem";
	}

	@RequestMapping("joinProc")
	public String joinInsert(MemberDTO mdto) {
		String id = mdto.getMember_id();
		System.out.println("조인프록         " + id);
		try {
			edao.sendMail(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int result = mservice.joinInsert(mdto);
		System.out.println(result);
		return "redirect:/home";
	}

	@RequestMapping("logOutProc")
	public String logout() {
		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping("myPage")
	public String myPage() {

		return "member/myPage";
	}
	@RequestMapping("verifiedId")
	public String verifiedId(String id) {
		mservice.confirmId(id);
		return "member/myPage";
	}

}
