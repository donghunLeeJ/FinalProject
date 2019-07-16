package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dao.MemberDAO;
import com.project.dao.Tl_BoardDAO;
import com.project.dto.ProfileImageDTO;
import com.project.dto.Tl_BoardDTO;

@Component
public class TimeLineService {
   
   @Autowired
   Tl_BoardDAO dao;
   
   @Autowired
   MemberDAO mdao;
   
   public int write(Tl_BoardDTO dto) {
      return dao.write(dto);
   }
   
   public List<Tl_BoardDTO> showAll(int page) {
      return dao.showAll(page);
   }
   
   public int delete(String seq) {
	   return dao.delete(seq);
   }
   
   public int update(Tl_BoardDTO dto) {
	   return dao.update(dto);
   }
   
   public List<ProfileImageDTO> profile_image() {
		 return mdao.profile_image();
	}
   
   
}
