package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.MemberDAO;
import com.project.dao.ShopBoardDAO;
import com.project.dto.MemberDTO;
import com.project.paging.SellPaging;

@Service
public class MemberService {
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private SellPaging sellP;

	@Autowired
	private ShopBoardDAO sdao;

	public String findID(MemberDTO dto) {
		return mdao.findID(dto);
	}

	public int findPW(String mail) {
		int num = mdao.findPW(mail);
		return num;
	}

	public int cleanPW(String pw, String member_id) {
		int num = mdao.cleanPW(pw, member_id);
		return num;
	}

	public int shopCount(String id) {
		return mdao.shopCount(id);
	}

	public List<String> paging(int page, int shopcount) {
		return sellP.myPaging(page, shopcount);
	}

	public int login(MemberDTO mdto) {
		int result = mdao.login(mdto);
		return result;
	}

	public int joinInsert(MemberDTO mdto) {
		System.out.println("가입2");
		int result = mdao.insert(mdto);
		System.out.println("조인insert 서비스 리턴값 : " + result);
		return result;
	}

	public MemberDTO select_member(String id) {
		return mdao.selectById(id);
	}

	public int confirmId(String id) {
		return mdao.confirmId(id);
	}

	public String checkConfirm(String id) {
		return mdao.checkConfirm(id);

	}

	public int edit_mypage(MemberDTO mdto) {
		System.out.println("멤버서비스 edit_mypage");
		System.out.println(mdto);
		return mdao.edit_mypage(mdto);
	}

	public int uploadImg(String filePath, String id) {
		return mdao.uploadImg(filePath, id);
	}

	@Transactional("transactionManager")
	public void delOK(String del_id, String del_pw) {
		mdao.delOK(del_id, del_pw);
		sdao.shopBoardDelete(del_id);
		sdao.shopReviewDelete(del_id);
	}

}
