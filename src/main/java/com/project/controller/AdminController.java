package com.project.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.MemberDTO;
import com.project.dto.MessageDTO;
import com.project.dto.ShopBoardDTO;
import com.project.dto.Tl_BoardDTO;
import com.project.dto.ViewDTO;
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

	//관리자페이지로 이동시키는 순간!
	@RequestMapping("adminHome")
	public String adminHome(String id) {
		request.setAttribute("MemberList", aservice.SelectPageList(1));
		request.setAttribute("ShopBoardList", aservice.ShopBoardSelectPageList(1));
		request.setAttribute("OrderBoardList", aservice.OrderBoardSelectPageList(1));
		request.setAttribute("View", ViewDTO.getVisitViewCount());
		request.setAttribute("BoardNew", ViewDTO.getBoardNewCount());
		request.setAttribute("Trade", ViewDTO.getTradeCount());
		return "admin/adminhome";
	}


	//회원관리 페이지로 이동
	@RequestMapping("MemberManagementMove")
	public String MemberManagementMove(){
		return "redirect:MemberManagementProc?page=1";}

	//판매글 관리 페이지로 이동
	@RequestMapping("ShopBoardManagementMove")
	public String ShopBoardManagementMove(){
		return "redirect:ShopBoardManagementProc?page=1";}

	//구매내역 관리 페이지로 이동
	@RequestMapping("OrderManagementMove")
	public String OrderManagementMove(){
		return "redirect:OrderManagementProc?page=1";}

	//SNS신고 페이지로 이동
	@RequestMapping("TimeLineManagementMove")
	public String TimeLineManagementMove(){
		return "redirect:TimeLineManagementProc?page=1";}

	//회원관리에서 id로 검색을 할시 이동하는 곳
	@RequestMapping("MemberManagementIDMove")
	public String MemberManagementIdMove(String keyword) throws Exception{
		keyword = URLEncoder.encode(keyword, "UTF-8");//리다이렉트시 한글깨짐현상 해결
		return "redirect:MemberManagementIDProc?page="+URLEncoder.encode("1", "UTF-8")+"&keyword="+keyword+"";}

	//SNS신고관리에서 제목으로 검색을 할시 이동하는 곳
	@RequestMapping("TimeLineManagementTitleMove")
	public String TimeLineManagementTitleMove(String keyword) throws Exception{
		keyword = URLEncoder.encode(keyword, "UTF-8");//리다이렉트시 한글/숫자깨짐현상 해결	
		return "redirect:TimeLineManagementTitleProc?page="+URLEncoder.encode("1", "UTF-8")+"&keyword="+keyword+"";}

	//구매내역 관리에서 주문번호로 검색을 할시 이동하는 곳
	@RequestMapping("OrderNumberSelectMove")
	public String OrderNumberSelectMove(String order_number){
		return "redirect:OrderNumberSelectProc?order_number="+order_number+"";}

	//회원관리 페이지로 이동(이동하기 전에 먼저 모든 회원을 검색하고 시작)
	@RequestMapping("MemberManagementProc")
	public String MemberManagement(int page){

		int totalcount = aservice.MemberCount();

		List<String>pageList = aservice.Page(page, totalcount);
		request.setAttribute("MemberList", aservice.SelectPageList(page));
		request.setAttribute("pageList", pageList);//1.보드게시판 아래에 숫자를 출력
		request.setAttribute("page", page);//현재 페이지임

		return "admin/MemberManagement";}


	//검색기능 알고리즘
	//반복상황을 board페이지에서 구별을 확실히 해야 함
	@RequestMapping("MemberManagementIDProc")
	public String pageExample(int page, String keyword, HttpServletRequest request){
		int totalcount = aservice.SelectMemberCount(keyword);
		List<String>pageList =  aservice.Page(page , totalcount);
		request.setAttribute("SelectMemberlist",  aservice.SelectPageKeywordList(page, keyword));
		request.setAttribute("SelectpageList", pageList);//1.보드게시판 아래에 숫자를 출력
		request.setAttribute("keyword", keyword);//1.보드게시판 아래에 숫자를 출력
		request.setAttribute("totalcount", totalcount);//검색된 글의 총 갯수가 0인지 아닌지를 구별함
		request.setAttribute("page", page);//현재 페이지임
		return "admin/MemberManagement";
	}


	//상품관리 페이지로 이동(이동하기 전에 먼저 모든 상품을 검색하고 시작)
	@RequestMapping("ShopBoardManagementProc")
	public String ShopBoardManagement(int page){
		int totalcount = aservice.ShopBoardCount();
		List<String>pageList = aservice.Page(page, totalcount);
		request.setAttribute("ShopBoardList", aservice.ShopBoardSelectPageList(page));
		request.setAttribute("pageList", pageList);//게시판 아래에 숫자를 출력
		request.setAttribute("page", page);//현재 페이지임
		return "admin/ShopBoardManagement";}

	//구매내역관리 페이지로 이동(이동하기 전에 먼저 구매내역을 검색하고 시작)
	@RequestMapping("OrderManagementProc")
	public String OrderManagement(int page){
		int totalcount = aservice.OrderBoardCount();
		List<String>pageList = aservice.Page(page, totalcount);
		request.setAttribute("OrderBoardList", aservice.OrderBoardSelectPageList(page));
		request.setAttribute("pageList", pageList);//게시판 아래에 숫자를 출력
		request.setAttribute("page", page);//현재 페이지임
		return "admin/OrderManagement";}


	//sns신고관리 페이지로 이동(이동하기 전에 먼저 신고내역을 검색하고 시작)
	@RequestMapping("TimeLineManagementProc")
	public String TimeLineManagement(int page){
		int totalcount = aservice.SNSBoardCount();
		List<String>pageList = aservice.Page(page, totalcount);
		request.setAttribute("SNSBoardList", aservice.SNSBoardSelectPageList(page));
		request.setAttribute("pageList", pageList);//게시판 아래에 숫자를 출력
		request.setAttribute("page", page);//현재 페이지임
		return "admin/TimeLineManagement";}


	//SNS제목검색기능 알고리즘		
	@RequestMapping("TimeLineManagementTitleProc")		
	public String TimeLineManagementIDProc(int page, String keyword){
		int totalcount = aservice.SelectSNSBoardCount(keyword);
		List<String>pageList =  aservice.Page(page , totalcount);
		request.setAttribute("SNSTitleSelectBoardList",  aservice.SelectTitlePageSNSBoardSelect(page, keyword));	    
		request.setAttribute("SelectpageList", pageList);//1.보드게시판 아래에 숫자를 출력
		request.setAttribute("keyword", keyword);//1.보드게시판 아래에 숫자를 출력
		request.setAttribute("totalcount", totalcount);//검색된 글의 총 갯수가 0인지 아닌지를 구별함
		request.setAttribute("page", page);//현재 페이지임
		return "admin/TimeLineManagement";
	}

	//주문번호검색
	@RequestMapping("OrderNumberSelectProc")
	public String OrderNumberSelect(String order_number){
		request.setAttribute("OrderNumberSelect",  aservice.OrderNumberSelect(order_number));
		return "admin/OrderManagement";
	}


	//관리자가 회원관리 게시판에서 어떤 유저id를 클릭하는 순간 이동한다.
	//이때 해당 회원의 모든 정보를 가져오는 메소드
	@RequestMapping("targetMember")
	public String targetMember(String userid){
		MemberDTO userINFO =  aservice.MemberIdSelectAll(userid);
		request.setAttribute("userINFO", userINFO);
		return "admin/targetMember";
	}


	//블랙리스트 추가/삭제 메소드
	@ResponseBody
	@RequestMapping(value="blacklist", produces = "application/text; charset=utf8")
	public String BlackListProc(String id , String blackcheck){
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


	//관리자 권한으로 판매글을 삭제시킴
	@RequestMapping("AdminDeleteShopBoard")
	public String DeleteShopBoard(String shop_seq){	
		int result = aservice.AdminDeleteShopBoard(shop_seq);
		if(result > 0){
			return "redirect:ShopBoardManagementProc?page=1";
		}
		return "에러 발생!!";}


	//관리자가 SNS관리 게시판에서 신고문구를 클릭하는 순간 이동한다.
	//이때 신고사유를 가져오는 메소드
	@RequestMapping("SNSReport")
	public String SNSReport(String tl_board_seq){
		Tl_BoardDTO SNSReport =  aservice.SNSSeqSelectAll(tl_board_seq);
		request.setAttribute("SNSReport", SNSReport);
		return "admin/report";}

	//관리자 권한으로 불량SNS글을 삭제시킴
	@RequestMapping("AdminDeleteSNS")
	public String DeleteSNS(String tl_board_seq){	
		int result = aservice.AdminDeleteSNSBoard(tl_board_seq);
		if(result > 0){
			return "redirect:TimeLineManagementProc?page=1";
		}
		return "에러 발생!!";}

	//신고접수 후 그 결과를 신고자에게 보낸다.(메시지 테이블에 저장시킴)
	@ResponseBody
	@RequestMapping(value="ReportSandMessage", produces = "application/text; charset=utf8")
	public String ReportSandMessage(MessageDTO dto){
		dto.setMessage_sender("관리자");
		int result = aservice.AdminReportSandInsert(dto);
		if(result > 0) {
			return "정상적으로 메시지를 보냈습니다.";
		}else {
			return "에러 발생!";  	   
		}
	}
	//만일 신고사유가 글삭제까지 할 이유가 없을 경우 글의 상태를 신고에서 노멀로 바꾸는 메소드
	//(추가로 신고사유와 신고자도 공란으로 비워두어야 함)
	@ResponseBody
	@RequestMapping(value="ReportCancel", produces = "application/text; charset=utf8")
	public String ReportCancel(String tl_board_seq){
		int result = aservice.AdminReportCancel(tl_board_seq);
		if(result > 0) {
			return "정상적으로 처리 완료.";
		}else {
			return "에러 발생!!";			
		}		
	}

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

	//검색된 id가 블랙리스트에 해당될 경우 해당 페이지로 이동
	@RequestMapping("BlackListNoLogin")
	public String BlackListNoLogin(){	
		return "admin/BlackListNoLogin";
	}

}




