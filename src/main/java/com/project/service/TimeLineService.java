package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dao.MemberDAO;
import com.project.dao.Tl_BoardDAO;
import com.project.dto.ProfileImageDTO;
import com.project.dto.Tl_BoardDTO;
import com.project.dto.Tl_ReplyDTO;

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
   public int Reply_write(Tl_ReplyDTO dto) {
	   return dao.reply_write(dto);
   }
   public List<Tl_ReplyDTO> show(int boardSeq){
	   return dao.show(boardSeq);
   }
   public int updateProfile(String path , String id){
	   return dao.updateProfile(path , id);
   }

}
