package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dao.Tl_BoardDAO;
import com.project.dto.Tl_BoardDTO;

@Component
public class TimeLineService {
   
   @Autowired
   Tl_BoardDAO dao;
   
   public int write(Tl_BoardDTO dto) {
      return dao.write(dto);
   }
   
   public List<Tl_BoardDTO> showAll(int page) {
      return dao.showAll(page);
   }
}
