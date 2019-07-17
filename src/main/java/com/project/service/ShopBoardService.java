package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ShopBoardDAO;
import com.project.dto.MemberDTO;
import com.project.dto.ShopBoardDTO;
import com.project.dto.ShopReviewDTO;

@Service
public class ShopBoardService {
	@Autowired
	private ShopBoardDAO sdao;

	public List<ShopBoardDTO> ShopBoardList(int currentPage) {
		return sdao.shopBoardList(currentPage);
	}

	// 판매글 관련 데이터를 삽입시킴
	public int ShopBoardInsert(ShopBoardDTO dto) {
		return sdao.ShopBoardInsert(dto);
	}

	// 모든 판매글 관련 데이터를 검색시킴
	public List<ShopBoardDTO> ShopBoardSelect() {
		return sdao.ShopBoardSelect();
	}

	// 특정 seq번호를 기준으로 해당 글의 정보를 뽑아옴
	// 여기선 번호를 받아왔다고 가정하고 넣어본다.
	public ShopBoardDTO ShopBoardIdSelect(int shop_seq) {
		return sdao.ShopBoardIdSelect(shop_seq);
	}

	public MemberDTO shopSellerSelect(int memberSell_seq) {
		return sdao.shopSellerSelect(memberSell_seq);
	}

	public List<ShopBoardDTO> ShopBoardList(String shop_id) {
		// System.out.println("2");
		return sdao.ShopBoardList(shop_id);
	}

	public int shopReviewInsert(ShopReviewDTO dto) {
		return sdao.shopReviewInsert(dto);
	}

	public List<ShopReviewDTO> shopReviewList(int shop_seq) {
		return sdao.shopReviewList(shop_seq);
	}
}
