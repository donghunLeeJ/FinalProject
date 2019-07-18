package com.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MemberDTO;
import com.project.dto.ShopBoardDTO;
import com.project.dto.ShopReviewDTO;

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

	public List<ShopBoardDTO> ShopBoardList(String shop_id) {
		// System.out.println("3");
		return sst.selectList("ShopBoardDAO.ShopBoardList", shop_id);
	}

	public MemberDTO shopSellerSelect(int memberSell_seq) {
		return sst.selectOne("ShopBoardDAO.shopSellerSelect", memberSell_seq);
	}

	public int shopReviewInsert(ShopReviewDTO dto) {
		return sst.insert("ShopBoardDAO.shopReviewInsert", dto);
	}

	public List<ShopReviewDTO> shopReviewList(int shop_seq) {
		return sst.selectList("ShopBoardDAO.shopReviewList", shop_seq);
	}

	public Float shopReviewAvg(int shop_seq) {
		return sst.selectOne("ShopBoardDAO.shopReviewAvg",shop_seq);
	}
	public int shopReviewCount(int shop_seq) {
		return sst.selectOne("ShopBoardDAO.shopReviewCount",shop_seq);
	}
}
