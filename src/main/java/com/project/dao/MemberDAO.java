package com.project.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.MemberDTO;
import com.project.dto.ProfileImageDTO;

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
	public int shopCount(String id) {
		return sst.selectOne("member.shopCount",id);
	}
	
	public String findID(MemberDTO dto) {
		return sst.selectOne("member.findID",dto);
	}
	public int findPW(String mail) {
		int count=0;
		 count=sst.selectOne("member.findPW",mail);
		return count;
	}
	public int cleanPW(String pw, String member_id) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("pw", pw);
		map.put("id", member_id);
		int count=0;
		int result=0;
		count = sst.selectOne("member.checkdupl",pw);
		if(count==1) {
			return count+99;
		}else {
			result= sst.update("member.changePW",map);
			return result;
		}
	}
	 public static String SHA256(String str){
		  String SHA = ""; 
		  try{
		   MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
		   sh.update(str.getBytes()); 
		   byte byteData[] = sh.digest();
		   StringBuffer sb = new StringBuffer(); 
		   for(int i = 0 ; i < byteData.length ; i++){
		    sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
		   }
		   SHA = sb.toString();
		   
		  }catch(NoSuchAlgorithmException e){
		   e.printStackTrace(); 
		   SHA = null; 
		  }
		  return SHA;
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
	public List<ProfileImageDTO> profile_image() {
		 return sst.selectList("member.selectProfile");
	}

	

}
