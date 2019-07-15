package com.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;
import com.project.dto.ShopBoardDTO;

@Repository
public class ShopBoardDAO {

	@Autowired
	private SqlSessionTemplate sst;

	public List<ShopBoardDTO> shopBoardList(int currentPage) {

		return sst.selectList("ShopBoardDAO.boardList", currentPage);
	}

	public int totalCount() {
		return sst.selectOne("ShopBoardDAO.totalCount");
	}

	// 판매글 관련 데이터를 삽입시킴
	public int ShopBoardInsert(ShopBoardDTO dto) {
		return sst.insert("ShopBoardDAO.ShopBoardInsert", dto);
	}

	// 모든 판매글을 검색시킴
	public List<ShopBoardDTO> ShopBoardSelect() {
		return sst.selectList("ShopBoardDAO.ShopBoardSelect");
	}

	// 특정 seq번호를 기준으로 해당 글의 정보를 뽑아옴
	// 여기선 번호를 받아왔다고 가정하고 넣어본다.
	public ShopBoardDTO ShopBoardIdSelect(int shop_seq) {
		return sst.selectOne("ShopBoardDAO.ShopBoardIdSelect", shop_seq);
	}

//특정 seq번호를 기준으로 해당 글의 정보를 뽑아옴
//여기선 번호를 받아왔다고 가정하고 넣어본다.
public ShopBoardDTO ShopBoardIdSelect(int shop_seq){	
		return sst.selectOne("ShopBoardDAO.ShopBoardIdSelect" , shop_seq); 
	}

}
