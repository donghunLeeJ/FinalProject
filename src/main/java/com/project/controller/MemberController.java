package com.project.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.dao.HtmlEmailDAO;
import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberPagingDTO;
import com.project.dto.OrderDTO;
import com.project.dto.ShopBoardDTO;
import com.project.paging.Mylist_Paging;
import com.project.service.AdminService;
import com.project.service.MemberService;
import com.project.service.OrderService;
import com.project.service.ShopBoardService;
import com.project.service.TimeLineService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDAO mdao;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberService mservice;
	@Autowired
	private HtmlEmailDAO edao;
	@Autowired
	private ShopBoardService SBservice;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private Mylist_Paging mp;
	@Autowired
	private OrderService os;
	@Autowired
	private TimeLineService tservice;
	@Autowired
	private AdminService aservice;

	@RequestMapping("loginForm")
	public String goLogin() {
		return "member/login";
	}

	@RequestMapping("loginProc")
	public String login(MemberDTO mdto) {
		mdto.setMember_pw(mdao.SHA256(mdto.getMember_pw()));
		System.out.println("로그인프록");
		int result = mservice.login(mdto);
		if (result == 1) {
			String confirm = mservice.checkConfirm(mdto.getMember_id());
			if (confirm.equals("y")) {
	
				int BlackCount = 0;
				List<String> BlackListResult = aservice.AdminBlackCheckList();
				for (String BlackList : BlackListResult) {
					if (mdto.getMember_id().equals(BlackList)) {
						BlackCount++;
					}
				}
				if (BlackCount > 0) {// 만일 블랙리스트로 지정된 아이디가 존재할 경우 로그인을 못하게 만듬
					return "admin/BlackListNoLogin";
				}

				else if (mdto.getMember_id().equals("admin")) {// 만일 로그인한 id가 관리자 아이디일 경우
					session.setAttribute("id", mservice.select_member(mdto.getMember_id()));
					return "redirect:/admin/adminHome"; // 관리자 컨트롤러로 이동시킴
				} else {
					session.setAttribute("id", mservice.select_member(mdto.getMember_id()));
					return "redirect:/home";
				}

			} else if (confirm.equals("n")) {
				return "member/confirm";
			}
		} else {
			return "member/notLogin";
		}
		return "/home";
	}

	@RequestMapping("joinForm")
	public String goJoin() {
		return "member/joinMem";
	}

	@RequestMapping("findinfo")
	public String findinfo() {
		return "member/findinfo";
	}

	@RequestMapping("findID")
	public String findID(MemberDTO dto) {
		String result = mservice.findID(dto);
		if (result != null) {
			request.setAttribute("confirm", result);
			return "member/yourID";
		} else {
			return "member/yourID2";
		}
	}

	@RequestMapping("findPW")
	public String findPW(String member_id) {
		System.out.println(member_id);
		int result = mservice.findPW(member_id);
		if (result == 1) {
			try {
				edao.findPw(member_id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "member/pwSendEmail";
		} else {
			return "member/yourPW2";
		}
	}

	@RequestMapping("yourPW")
	public String yourPW(String id) {
		request.setAttribute("id", id);
		return "member/yourPW";
	}

	@RequestMapping("cleanPW")
	public String cleanPW(String member_pw, String member_id) {
		String new_pw = mdao.SHA256(member_pw);
		int result = mservice.cleanPW(new_pw, member_id);
		return "member/cleanOK";

	}

	@RequestMapping("/joinProc")
	public String joinInsert(MemberDTO mdto) {
		String id = mdto.getMember_id();
		mdto.setMember_pw(mdao.SHA256(mdto.getMember_pw()));
		try {
			edao.sendMail(id);
			int result = mservice.joinInsert(mdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/emailsend";
	}

	@RequestMapping("logOutProc")
	public String logout() {
		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping("myPage") // 메인에서 마이페이지로 가기 이때 구매내역과 판매내역 담기
	public String log_myPage() {

		return "/member/myPage";
	}

	@RequestMapping("edit_mypage")
	public String log_edit_mypage(MemberDTO mdto) {// 마이페이지에서 글 정보수정 버튼 누르기
		session.setAttribute("id", mservice.select_member(mdto.getMember_id()));
		return "member/edit_OK";

	}

	@RequestMapping("uploadImg")
	public String log_uploadImg(MultipartFile file) {// 마이페이지>정보수정>프로필 이미지 바꾸기
		String time = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String savedName = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
		String uploadPath = session.getServletContext().getRealPath("/resources/img/profile-img/" + time + "/");// 파일 저장
		File makeFile = new File(uploadPath);
		if (!makeFile.exists())
			makeFile.mkdir();
		File f = new File(uploadPath + "/" + savedName + "__.jpg");
		try {
			file.transferTo(f);// 여기까지 사진 저장되는지 확인
			MemberDTO mdto = (MemberDTO) session.getAttribute("id");
			String id = mdto.getMember_id();
			String path = "/img/profile-img/" + time + "/" + f.getName();// 저장된 이름 뽑아옴
			// id랑 path를 서비스에 보내야지
			tservice.updateProfile(path, id);
			mservice.uploadImg(path, id);
			session.setAttribute("id", mservice.select_member(id));// 바뀐 세션값 초기화
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/myPage";
	}

	@RequestMapping("delOK")
	public String log_delOK(String del_id, String del_pw) {

		mservice.delOK(del_id, mdao.SHA256(del_pw));
		session.invalidate();
		return "/member/delOK";

	}

	@RequestMapping("verifiedId")
	public String verifiedId(String id) {
		String confirm = mservice.checkConfirm(id);
		if (confirm.equals("n")) {
			mservice.confirmId(id);
			return "member/emailConfirm";
		} else if (confirm.equals("y")) {
			return "member/reConfirm";
		}
		return null;
	}

	@RequestMapping("buyContentsGo")
	public String moveBuyContentsGo() {
		return "redirect:buyContentsGoProc?page=1";
	}

	
	@RequestMapping("buyContentsGoProc")
	public String buyContetns(String page) {
		int resultPage = Integer.parseInt(page);
		int count = os.orderCount();
		List<String> pageList = os.Page(resultPage, count);

		for (int i = 0; i < pageList.size(); i++) {
			System.out.println(pageList.get(i));
		}

		request.setAttribute("pageList", pageList);// 게시판 아래에 숫자를 출력
		request.setAttribute("page", resultPage);// 현재 페이지임
		MemberDTO mdto = (MemberDTO) session.getAttribute("id");
		List<OrderDTO> buyList = os.orderTenList(resultPage);
		request.setAttribute("buyList", buyList);
		return "/member/buyContents";
	}

	// 판매게시물의 판매목록
	@RequestMapping("/sellStatus")
	public String log_sellStatus(int seq) {
		int total_quantity = 0;
		int total_price = 0;
		List<OrderDTO> dto = os.sellOrderList(seq);
		for (int i = 0; i < dto.size(); i++) {
			total_price += dto.get(i).getOrder_price();
			total_quantity += dto.get(i).getOrder_quantity();
		}
		request.setAttribute("total_price", total_price);
		request.setAttribute("total_quantity", total_quantity);
		request.setAttribute("dto", dto);
		return "/member/sellStatusPopUp";
	}

	@RequestMapping("myMsg")
	public String myMsg() {
		return "/member/myMsg";
	}

	@RequestMapping("minilogin")
	@ResponseBody
	public String minilog(String id, String pw) {
		MemberDTO mdto = new MemberDTO();
		mdto.setMember_pw(mdao.SHA256(pw));
		mdto.setMember_id(id);
		int result = mservice.login(mdto);
		if (result == 1) {
			int BlackCount = 0;
			List<String> BlackListResult = aservice.AdminBlackCheckList();
			for (String BlackList : BlackListResult) {
				if (mdto.getMember_id().equals(BlackList)) {
					BlackCount++;
				}
			}
			if (BlackCount > 0) {// 만일 블랙리스트로 지정된 아이디가 존재할 경우 로그인을 못하게 만듬
				result = -1;
			} else {
				session.setAttribute("id", mservice.select_member(id));
			}
		}
		String resultString = result + "";
		return resultString;
	}

}
