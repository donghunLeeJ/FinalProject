package com.project.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.MemberDTO;

@Component
public class MemberDAO {

	@Autowired
	private HttpSession session;
	@Autowired
	private DataSource ds;
	@Autowired
	private SqlSessionTemplate sst;


	public int login(MemberDTO dto) {
		int result=0;
		try {
			result=sst.selectOne("member.login",dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insert(MemberDTO dto) {
		return sst.insert("member.insert",dto);
	}

	public MemberDTO selectById(String id){
		return sst.selectOne("member.selectById",id);
	}
	
	public int edit_mypage(MemberDTO dto) {
		System.out.println(dto);
		try {
		  return sst.update("member.editmypage", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
		
	}
	public int uploadImg(String filePath, String id) {
		Map<String,String> map = new HashMap();
		map.put("path", filePath);
		map.put("id", id);
		return sst.update("member.uploadImg",map);
		
	}

}
