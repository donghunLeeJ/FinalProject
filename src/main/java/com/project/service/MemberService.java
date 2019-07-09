package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		int result = mdao.insert(mdto);
		return result;
	}
	public MemberDTO select_member(String id) {
		return mdao.selectById(id);
	}
	public MemberDTO edit_mypage(String id) {
		return mdao.edit_mypage(id);
	}
}
