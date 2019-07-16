package com.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sst;

	
	public List<MemberDTO> MemberSelectAll(){return sst.selectList("AdminDAO.MemberSelectAll");}
	public MemberDTO MemberIdSelectAll(String member_id){return sst.selectOne("AdminDAO.MemberSelectIdAll", member_id);}
	
	
	//각각 맴버테이블 전체의 행의 갯수,id로 검색했을 시의 행의 갯수를 나타냄
	public int MemberCount(){
		return sst.selectOne("AdminDAO.MemberCount");}

	
	public int SelectMemberCount(String keyword){
		return sst.selectOne("AdminDAO.SelectMemberCount",keyword);}
		
	
	public int BlackListUpdate(String member_id){
		return sst.update("AdminDAO.BlackListUpdate", member_id);}
	
	
	public int BlackListCancel(String member_id){
		return sst.update("AdminDAO.BlackListCancel", member_id);}
	
	
	
	
	
}

