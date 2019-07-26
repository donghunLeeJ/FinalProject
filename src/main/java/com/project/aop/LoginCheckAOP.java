package com.project.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoginCheckAOP {

	@Autowired
	private HttpSession session;
	
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
	
	
	@Around("basketController()||shopBoard()||timeLine()||member()||admin()")
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
	
}
