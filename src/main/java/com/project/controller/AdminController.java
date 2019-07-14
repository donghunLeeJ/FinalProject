package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.MemberDTO;
import com.project.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AdminService aservice;
	
	@RequestMapping("adminHome")
	public String adminHome(String id) {
	//	Logger.info("message is {}.",id);
		return "admin/adminHome";
	}
	
	
	//회원관리 페이지로 이동(이동하기 전에 먼저 모든 회원을 검색하고 시작)
	@RequestMapping("MemberManagement")
	public String MemberManagement(){
		
	List<MemberDTO>memberList = aservice.MemberSelectAll();
	
	request.setAttribute("memberList", memberList);	
	return "admin/MemberManagement";}
			
}
