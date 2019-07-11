package com.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.Tl_BoardDTO;

@Component
public class Tl_BoardDAO {
   
   @Autowired
   private SqlSessionTemplate sst;
   
   public int write(Tl_BoardDTO dto) {
      return sst.insert("Tl_BoardDAO.tl_board_insert",dto);
   }
   
   public List<Tl_BoardDTO> showAll(){
      return sst.selectList("Tl_BoardDAO.tl_board_showAll");
   }
}