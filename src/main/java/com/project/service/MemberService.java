package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.dao.MemberDAO;
import com.project.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO mdao;
	
	public int login(MemberDTO mdto) {
		int result = mdao.login(mdto);
		return result;
	}
	public int joinInsert(MemberDTO mdto) {
		System.out.println("가입2");
		int result = mdao.insert(mdto);
		System.out.println("조인insert 서비스 리턴값 : "+result);
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
	
	public int delOK(String del_id, String del_pw) {
		return mdao.delOK(del_id, del_pw);
	}
}
