package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDAO;
import com.project.dto.MemberDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adao;
	
	public List<MemberDTO>MemberSelectAll(){return adao.MemberSelectAll();}
	
	
	
	
	
	
	
	
	
	
}
