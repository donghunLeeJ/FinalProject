package com.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.ShopBoardDTO;


@Repository
public class ShopBoardDAO {
	
@Autowired
private SqlSessionTemplate sst;		
	
//판매글 관련 데이터를 삽입시킴
public int ShopBoardInsert(ShopBoardDTO dto){	
return sst.insert("mybatis.shopboard-mapper.ShopBoardInsert", dto);} 
		

//모든 판매글을 검색시킴
public List<ShopBoardDTO> ShopBoardSelect(){	
return sst.selectList("mybatis.shopboard-mapper.ShopBoardSelect");} 
	

//특정 seq번호를 기준으로 해당 글의 정보를 뽑아옴
//여기선 번호를 받아왔다고 가정하고 넣어본다.
public ShopBoardDTO ShopBoardIdSelect(int shop_seq){	
return sst.selectOne("mybatis.shopboard-mapper.ShopBoardIdSelect" , shop_seq);} 




	
}
