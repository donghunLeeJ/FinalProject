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
import org.springframework.web.multipart.MultipartFile;

import com.project.dao.HtmlEmailDAO;
import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;
import com.project.dto.MemberPagingDTO;
import com.project.dto.OrderDTO;
import com.project.dto.ShopBoardDTO;
import com.project.paging.Mylist_Paging;
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

	@RequestMapping("loginForm")
	public String goLogin() {
		return "member/login";
	}

	@RequestMapping("loginProc")
	public String login(MemberDTO mdto) {
		System.out.println("로그인프록  " + mdto.getMember_id());
		mdto.setMember_pw(mdao.SHA256(mdto.getMember_pw()));
		int result = mservice.login(mdto);
		if (result == 1) {

			String confirm = mservice.checkConfirm(mdto.getMember_id());
			if (confirm.equals("y")) {

				if (mdto.getMember_id().equals("admin")) {// 만일 로그인한 id가 관리자 아이디일 경우

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
		request.setAttribute("change", member_id);
		int result = mservice.findPW(member_id);
		if (result == 1)
			return "member/yourPW";
		else
			return "member/yourPW2";
	}

	@RequestMapping("cleanPW")
	public String cleanPW(String member_pw, String member_id) {
		String new_pw = mdao.SHA256(member_pw);
		int result = mservice.cleanPW(new_pw, member_id);
		if (result == 1)
			return "member/cleanOK";
		else
			return "member/yourPW3";

	}

	@RequestMapping("/joinProc")
	public String joinInsert(MemberDTO mdto) {
		System.out.println("조인프록");
		String id = mdto.getMember_id();
		mdto.setMember_pw(mdao.SHA256(mdto.getMember_pw()));

		// System.out.println("조인프록 " + id);
		try {
			edao.sendMail(id);
			System.out.println("가입1");
			int result = mservice.joinInsert(mdto);
			System.out.println("조인프록 서비스 리턴값 : " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println(result);
		return "member/emailsend";
	}

	@RequestMapping("logOutProc")
	public String logout() {
		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping("myPage") // 메인에서 마이페이지로 가기 이때 구매내역과 판매내역 담기
	public String log_myPage() {
		// System.out.println("1");
		MemberDTO mdto = (MemberDTO) session.getAttribute("id");
		List<ShopBoardDTO> mylist = SBservice.ShopBoardList(mdto.getMember_id());
		List<OrderDTO> order = os.myOrderList(mdto.getMember_id());
		MemberPagingDTO mpdto = mp.MemberPaging(1);
		request.setAttribute("mylist", mylist);
		request.setAttribute("mpdto", mpdto);
		request.setAttribute("order", order);

		return "/member/myPage";
	}

	@RequestMapping("edit_mypage")
	public String log_edit_mypage(MemberDTO mdto) {// 마이페이지에서 글 정보수정 버튼 누르기
		System.out.println("정보수정 맵핑");
		System.out.println("1");
		System.out.println(mservice.edit_mypage(mdto));
		session.setAttribute("id", mservice.select_member(mdto.getMember_id()));
		return "member/edit_OK";

	}

	@RequestMapping("uploadImg")
	public String log_uploadImg(MultipartFile file) {// 마이페이지>정보수정>프로필 이미지 바꾸기
		System.out.println("업로드 이미지 맵핑");
		String time = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String savedName = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
		String uploadPath = session.getServletContext().getRealPath("/resources/img/profile-img/" + time + "/");// 파일 저장
																												// 위치
		File makeFile = new File(uploadPath);
		if (!makeFile.exists())
			makeFile.mkdir();
		System.out.println(uploadPath);
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
		try {
			System.out.println("넘어온 아이디 : " + del_id);
			System.out.println("넘어온 비밀번호 : " + del_pw);
			mservice.delOK(del_id, del_pw);
			session.invalidate();
			return "/member/delOK";
		} catch (Exception e) {
			return "/member/faildel";
		}
	}

	@RequestMapping("verifiedId")
	public String verifiedId(String id) {
		System.out.println("아이디                                " + id);
		String confirm = mservice.checkConfirm(id);
		if (confirm.equals("n")) {
			mservice.confirmId(id);
			return "member/emailConfirm";
		} else if (confirm.equals("y")) {
			return "member/reConfirm";
		}
		return null;

	}

	@RequestMapping("/sellContentsGo")
	public String log_sellContetns() {
		MemberDTO mdto = (MemberDTO) session.getAttribute("id");
		List<ShopBoardDTO> sellList = SBservice.ShopBoardList(mdto.getMember_id());

		request.setAttribute("sellList", sellList);
		return "/member/sellContents";
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

}
