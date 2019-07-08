package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ShopBoardDAO;
import com.project.dto.ShopBoardDTO;

@Service
public class ShopBoardService {
	
@Autowired
ShopBoardDAO dao;
	
//판매글 관련 데이터를 삽입시킴
public int ShopBoardInsert(ShopBoardDTO dto){return dao.ShopBoardInsert(dto);} 	

//모든 판매글 관련 데이터를 검색시킴
public List<ShopBoardDTO> ShopBoardSelect(){return dao.ShopBoardSelect();} 	

//특정 seq번호를 기준으로 해당 글의 정보를 뽑아옴
//여기선 번호를 받아왔다고 가정하고 넣어본다.
public ShopBoardDTO ShopBoardIdSelect(int shop_seq){return dao.ShopBoardIdSelect(shop_seq);} 	




}
