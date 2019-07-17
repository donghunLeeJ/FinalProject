package com.project.paging;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.MemberDTO;
import com.project.dto.OrderDTO;
import com.project.dto.PageDTO;
import com.project.dto.ShopBoardDTO;
import com.project.dto.ShopPagingDTO;

@Component
public class AdminPaging {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	//페이징 알고리즘 관련 메소드
	//여기서 받을 매개변수는 클라이언트에서 입력받은 페이지의 값이다.
	public List<String> aPaging(int page, int totalCount) {
	
	
		//데이터베이스에서 검색된 게시물의 갯수(이건 데이터베이스의 select문에 따라 변해야 함)	
		System.out.println("현재 게시글의 갯수: "+totalCount);	
		
		int countList = 10;//한 페이지에 출력될 게시물의 수(이는 웹사이트에 따라 다를 수 있지만 기본적으로는 10개임)
		
		int totalPage = totalCount / countList;//총 게시물의 수 / 한 페이지당 들어갈 게시물의 수로 총 페이지의 수를 구한다		
		
		if (totalCount % 10 > 0){totalPage++;}
	    
		//만일 현재 페이지 번호가 총 페이지 번호보다 크다면?
		//->현재 페이지를 강제로 총 페이지 번호로 치환시킬 수 있음
		
		//if(totalPage < page){page = totalPage;}
		
		//int page = 14;//이건 클라이언트에서 사용자가 페이지번호를 클릭했을 때 받는 값이다.
		                //(이 값을 기점으로 아래의 페이지가 변할 것이니 주의하도록)
		
		int countPage = 10; //한 페이지당 보여줄 수 있는 최대 숫자
		
		//보여줄 수 있는 페이지의 시작과 끝값
		int startPage = ((page-1)/10) * 10 + 1;
		int endPage = startPage + countPage -1;
		
		System.out.println("엔트페이지: " + endPage);
	/*	
		//각 페이지당 데이터베이스의 글을 보여줄 수 있음
		int startCount = (page - 1) * countPage + 1;
		int endCount = page * countPage;
		*/
		
		//위와 같은 로직으로 짤 경우 맨 마지막 페이지를 보정해줘야 함
		if(endPage > totalPage){endPage = totalPage;}
		
		System.out.println("엔트페이지: " + endPage);
		
		List<String> pageList = new ArrayList();
		
		//만일 받아온 페이지의 값이 1보다 클 경우에는 이전을 추가로 달아준다.
		if(page > 1){pageList.add("<이전");}
		
		
		System.out.println(startPage + " : " + endPage);
		//입력받은 페이지번호를 화면에 출력시킨다.
		for(int i = startPage; i<=endPage; i++ ){
		
			pageList.add(" "+ i +" ");}
		
		//만일 현재 페이지보다 전체 페이지의 값이 더 큰 경우 다음을 추가로 달아준다.
		if(page < totalPage){pageList.add("다음>");}
		
		//만일 endPage보다 총 페이지가 더 클 경우 끝을 추가로 달아준다.
		//if(endPage < totalPage){pageList.add("<끝>");}
		
		for(String a : pageList){System.out.print(a);}
		
		return pageList;	}

	
	   //각 페이지에 해당하는 게시글(멤버) 10개를 출력시키는 메소드(검색없이)
		public List<MemberDTO> SelectPageList(int page){ 
			
			int countPage = 10;
			int startCount = (page - 1) * countPage + 1;
			int endCount = page * countPage;
		
			List<MemberDTO>BoardContentList = 
			sst.selectList("AdminDAO.PageMemberselect", new PageDTO(startCount , endCount));	
			return BoardContentList;}
		
		
	
		 //각 페이지에 해당하는 게시글 10개를 출력시키는 메소드(검색 키워드로 이동했을 경우)
		public List<MemberDTO>SelectPageKeywordList(int page ,String keyword){ 
			
			int countPage = 10;
			int startCount = (page - 1) * countPage + 1;
			int endCount = page * countPage;
		
			List<MemberDTO>BoardContentList = 
			sst.selectList("AdminDAO.PageMemberIdselect", new PageDTO(startCount,endCount,keyword));			
			return BoardContentList;}
	
	
		
		   //각 페이지에 해당하는 게시글(샵보드) 10개를 출력시키는 메소드(검색없이)
			public List<ShopBoardDTO> ShopBoardSelectPageList(int page){ 
				
				int countPage = 10;
				int startCount = (page - 1) * countPage + 1;
				int endCount = page * countPage;
			
				List<ShopBoardDTO>ShopBoardContentList = 
				sst.selectList("AdminDAO.PageShopBoardSelect", new PageDTO(startCount , endCount));	
				return ShopBoardContentList;}
			
	
			
			 //각 페이지에 해당하는 게시글(오더) 10개를 출력시키는 메소드(검색없이)
			public List<OrderDTO> OrderBoardSelectPageList(int page){ 
				
				int countPage = 10;
				int startCount = (page - 1) * countPage + 1;
				int endCount = page * countPage;
			
				List<OrderDTO>OrderBoardContentList = 
				sst.selectList("AdminDAO.PageOrderBoardSelect", new PageDTO(startCount , endCount));	
				return OrderBoardContentList;}
	
	
}