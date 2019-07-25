package com.project.paging;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.OrderDTO;
import com.project.dto.PageDTO;

@Component
public class BuyPaging {
	 @Autowired
	   private SqlSessionTemplate sst;
	 public List<String> myPaging(int page, int totalCount){
	      //여기서 받을 매개변수는 클라이언트에서 입력받은 페이지의 값이다.
	      
	      //디비에서 찾는 전체 게시물 갯수
	      System.out.println("현재 글 갯수 : " + totalCount);
	      int countList=5; //페이지당 게시글 10개씩 출력
	      int totalPage = totalCount/countList;//총 갯수 /페이지당 10개 = 페이지 갯수
	      if(totalCount%countList>0) totalPage++; //한 페이지를 넘어가면 다음 페이지 생성하기
	      int countPage=10; //한 페이지에 표시될 네비 갯수(1~10, 11~20)
	      int startPage = ((page-1)/countList)*countList+1;//보여줄 페이지의 시작과 끝 값
	      int endPage = startPage + countPage - 1;
	      
	      //마지막페이지 보정하기
	      if(endPage>totalPage) endPage=totalPage;
	      List<String> pageList = new ArrayList();
	      
	      //받아온 페이지의 값이 1보다 크면 '이전'을 추가로 생성함
	      if(page>1) pageList.add("이전");
	      System.out.println(startPage + " : " + endPage);
	      //입력받은 페이지번호를 화면에 출력
	      for(int i = startPage; i<=endPage; i++) {
	         pageList.add(i+""); //페이지 네비 1 2 3 4 ..  추가 과정
	      }
	      //현재보다 전체 페이지 값이 큰 경우 '다음'을 달아줌
	      if(page<totalPage) pageList.add("다음");
	      //endPage보다 총 페이지가 크면 끝을 달아줌
	      if(endPage<totalPage) pageList.add(" 끝 ");
	      for(String a : pageList) System.out.println(a);
	      return pageList;
	   }
	 
	   //각 페이지마다 게시글 10개 출력하는 메서드
	   public List<OrderDTO> selectOrder(int page){
	      int  countPage=5;
	      int startCount=(page-1)*countPage+1;
	      int endCount=page*countPage;
	      
	      List<OrderDTO> shopList = 
	            sst.selectList("OrderDAO.PageSelect",new PageDTO(startCount, endCount));
	      return shopList;
	   }

}
