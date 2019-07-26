package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.project.dto.ViewDTO;

@Controller
@RequestMapping("/view")
public class ViewController {
	
	@Autowired
	private HttpSession session;
	
	//home에서 받아온 세션 정보에 따라 방문자수 카운트를 증가시키거나 유지시킴
	@ResponseBody
	@RequestMapping(value="VisitViewCondition", produces = "application/text; charset=utf8")
	public String VisitViewCondition(String access){

		if(access.equals("1")){
			System.out.println("이미 접속중인 세션이므로 세션이 만료될 때까지 방문자수 증가 없음");

		}else{

			System.out.println("처음 접속한 세션이므로 카운트 증가");
			session.setAttribute("access", 1);		
			ViewDTO.setVisitViewCount(ViewDTO.getVisitViewCount() + 1);				
		}

		return ""+access+"";}	
	
}
