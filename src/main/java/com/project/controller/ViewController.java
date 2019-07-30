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
	
		}else{
			session.setAttribute("access", 1);		
			ViewDTO.setVisitViewCount(ViewDTO.getVisitViewCount() + 1);				
		}

		return ""+access+"";}	
	
}
