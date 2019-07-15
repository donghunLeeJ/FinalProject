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

	public int totalCount() {
		return sst.selectOne("ShopBoardDAO.totalCount");
	}
	
	
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
		System.out.println("멤버DAO : " +  sst.insert("member.insert",dto));
		return sst.insert("member.insert",dto);
	}

	public MemberDTO selectById(String id){
		return sst.selectOne("member.selectById",id);
	}

	public int confirmId(String id) {//멤버 컨펌을 n에서 y로 바꿔주는 메서드
		return sst.update("member.confirmId",id);
	}
	public String checkConfirm(String id) {
		return sst.selectOne("member.checkConfirm",id);
	}

	
	public int edit_mypage(MemberDTO dto) {
			//System.out.println(dto);
		System.out.println("멤버DAO edit_mypage");
		  return sst.update("member.edit_mypage", dto);
	}
	public int uploadImg(String filePath, String id) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("path", filePath);
		map.put("id", id);
		return sst.update("member.uploadImg",map);
		
	}
	
	public int delOK(String id, String pw) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return sst.delete("member.delOK",map);
	}

}
