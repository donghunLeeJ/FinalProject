package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.MemberDTO;
import com.project.paging.ShopPaging;
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
	
	@Autowired
	private ShopPaging sPaging;
	
	@RequestMapping("adminHome")
	public String adminHome(String id) {
	//	Logger.info("message is {}.",id);
		return "admin/adminhome";
	}
	
	
	//관리자 메인페이지에서 회원관리 페이지로 이동
	@RequestMapping("MemberManagementMove")
	public String MemberManagementMove(){
	return "redirect:MemberManagementProc?page=1";}
	
	
	//id로 검색을 할시 이동하는 곳
	@RequestMapping("MemberManagementIDMove")
	public String MemberManagementIDMove(String keyword){
	return "redirect:MemberManagementIDProc?page=1&keyword="+keyword+"";}


	//회원관리 페이지로 이동(이동하기 전에 먼저 모든 회원을 검색하고 시작)
	@RequestMapping("MemberManagementProc")
	public String MemberManagement(int page){

	//List<MemberDTO>memberList = aservice.MemberSelectAll();
	int totalcount = aservice.MemberCount();
		
    List<String>pageList = aservice.Page(page, totalcount);
    request.setAttribute("MemberList", aservice.SelectPageList(page));
    
    for(MemberDTO m : aservice.SelectPageList(page) ) {	
    	System.out.println(m.getMember_id());}
    
	request.setAttribute("pageList", pageList);//1.보드게시판 아래에 숫자를 출력
	request.setAttribute("page", page);//현재 페이지임

	return "admin/MemberManagement";}
	

	//검색기능 알고리즘
	//반복상황을 board페이지에서 구별을 확실히 해야 함
	@RequestMapping("MemberManagementIDProc")
	public String pageExample(int page, String keyword, HttpServletRequest request){

		System.out.println("페이지: " + page);
		System.out.println("키워드: " + keyword);
		int totalcount = aservice.SelectMemberCount(keyword);
		
		System.out.println(keyword +"로 검색된 총 글의 갯수 "+totalcount);

		List<String>pageList =  aservice.Page(page , totalcount);
	    request.setAttribute("SelectMemberlist",  aservice.SelectPageKeywordList(page, keyword));
		request.setAttribute("SelectpageList", pageList);//1.보드게시판 아래에 숫자를 출력
		request.setAttribute("keyword", keyword);//1.보드게시판 아래에 숫자를 출력
		request.setAttribute("page", page);//현재 페이지임

		return "admin/MemberManagement";
	}
	

	//관리자가 어떤 유저id를 클릭하는 순간 이동한다.
	//이때 해당 회원의 모든 정보를 가져오는 메소드
	@RequestMapping("targetMember")
	public String targetMember(String userid){
			
		System.out.println(userid);
		MemberDTO userINFO =  aservice.MemberIdSelectAll(userid);
		request.setAttribute("userINFO", userINFO);
		
		return "admin/targetMember";
	}
	
	
	//블랙리스트 추가/삭제 메소드
	@ResponseBody
	@RequestMapping(value="blacklist", produces = "application/text; charset=utf8")
	public String BlackListProc(String id , String blackcheck){

		System.out.println(id);	
		System.out.println("체크리스트: "+blackcheck);	

		if(blackcheck.equals("n")) {

			int result = aservice.BlackListUpdate(id);

			if(result > 0) {

				return ""+id+"님이 블랙리스트에 등록되었습니다.";

			}

		}else if(blackcheck.equals("y")){

			int result = aservice.BlackListCancel(id);

			if(result > 0) {

				return ""+id+"님이 블랙리스트에서 벗어났습니다..";
			}
		}	
		
		return "에러 발생!!";
	}
		
		

		
		
}




