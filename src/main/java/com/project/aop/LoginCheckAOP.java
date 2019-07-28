package com.project.aop;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.MemberDTO;
import com.project.service.AdminService;

@Component
@Aspect
public class LoginCheckAOP {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminService aservice;
	
	@Pointcut("execution(* com.project.controller.BasketController.*(..))")
	public void basketController() {}
	@Pointcut("execution(* com.project.controller.ShopBoardController.log_*(..))")
	public void shopBoard() {}
	@Pointcut("execution(* com.project.controller.TimeLineController.*(..))")
	public void timeLine() {}
	@Pointcut("execution(* com.project.controller.MemberController.log_*(..))")
	public void member() {}
	@Pointcut("execution(* com.project.controller.AdminController.*(..))")
	public void admin() {}
	@Around("basketController()||shopBoard()||timeLine()||member()")
	public String logCheck(ProceedingJoinPoint pjp) {
		if(session.getAttribute("id")==null) {
			return "loginPlease";
		}else {
			try {
				return (String) pjp.proceed();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		return null;
		}
	}
	//만일 관리자id로 로그인을 하지 않을 경우 관리자 페이지에 들어갈 수 없게 만든다.
	@Around("admin()")
	public String AdminCheck(ProceedingJoinPoint pjp){	
		MemberDTO member = (MemberDTO)session.getAttribute("id");
		//로그인을 하지 않은 경우
		if(member == null) {
			return "adminPlease";
		}	
		//로그인은 했지만 관리자 id가 아닌 경우
		else {
			if(member.getMember_id().equals("admin")) {
				try {
					return (String) pjp.proceed();
				} catch (Throwable e) {
					e.printStackTrace();
				}
			}else {
				return "adminPlease";
			}
		}
		return null;
	}


	
	
	
}
