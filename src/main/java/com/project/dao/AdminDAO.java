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
				
}
