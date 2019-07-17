package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.AdminDAO;
import com.project.dto.MemberDTO;
import com.project.dto.OrderDTO;
import com.project.dto.ShopBoardDTO;
import com.project.paging.AdminPaging;

@Service
public class AdminService {
	
	@Autowired
	private AdminPaging apag;
	
	@Autowired
	private AdminDAO adao;
	
	public List<MemberDTO>MemberSelectAll(){return adao.MemberSelectAll();}
	public MemberDTO MemberIdSelectAll(String member_id){return adao.MemberIdSelectAll(member_id);}
	
	public int MemberCount(){return adao.MemberCount();}
	public int SelectMemberCount(String keyword){return adao.SelectMemberCount(keyword);}
	
	
	public List<String>Page(int page, int totalcount){return apag.aPaging(page, totalcount);}
	
	public List<MemberDTO> SelectPageList(int page){return apag.SelectPageList(page);}
	
	public List<MemberDTO> SelectPageKeywordList(int page , String keyword){return apag.SelectPageKeywordList(page, keyword);}
	
	
	
	public int ShopBoardCount(){return adao.ShopBoardCount();}
	
	public List<ShopBoardDTO> ShopBoardSelectPageList(int page){return apag.ShopBoardSelectPageList(page);}
	
	
	public int OrderBoardCount(){return adao.OrderBoardCount();}
	
	public List<OrderDTO>OrderBoardSelectPageList(int page){return apag.OrderBoardSelectPageList(page);}
	
	public OrderDTO OrderNumberSelect(String order_number){return adao.OrderNumberSelect(order_number);}

	public int BlackListUpdate(String member_id){return adao.BlackListUpdate(member_id);}
	
	public int BlackListCancel(String member_id){return adao.BlackListCancel(member_id);}
	
	
	public int AdminDeleteShopBoard(String shop_seq){return adao.AdminDeleteShopBoard(shop_seq);}
	
	
				
}
