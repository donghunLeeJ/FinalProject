package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.MessageDTO;
import com.project.dto.Tl_BoardDTO;
import com.project.dto.Tl_ReplyDTO;

@Component
public class Tl_BoardDAO {
   
   @Autowired
   private SqlSessionTemplate sst;
   
   public int write(Tl_BoardDTO dto) {
	   System.out.println(dto.toString());
	   return sst.insert("Tl_BoardDAO.tl_board_insert",dto);
   }
   
   public List<Tl_BoardDTO> showAll(int page){
      return sst.selectList("Tl_BoardDAO.tl_board_showAll",page);
   }
   
   public int showAll_count(){
	      return sst.selectOne("Tl_BoardDAO.tl_board_all_count");
	   }
   
   public int delete(String seq) {
	   return sst.delete("Tl_BoardDAO.tl_board_delete",seq);
   }
   
   public int update(Tl_BoardDTO dto) {
	   return sst.update("Tl_BoardDAO.tl_board_update",dto);
   }
   
   public int reply_write(Tl_ReplyDTO dto) {
	   return sst.insert("Tl_BoardDAO.tl_reply_insert",dto);
   }
   
   public List<Tl_ReplyDTO> show(int boardSeq){
	   return sst.selectList("Tl_BoardDAO.tl_reply_show",boardSeq);
   }
   public int updateProfile(String path ,String id){
		Map<String,String> map = new HashMap<String, String>();
		map.put("path", path);
		map.put("id", id);
	   return sst.update("Tl_BoardDAO.updateProfile",map);
   }
   public int replyDelete(String id ,String seq) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("seq", seq);
	   
	   return sst.delete("Tl_BoardDAO.replyDelete",map);
   }
   
   public int reportRegister(Tl_BoardDTO dto) {
	   return sst.delete("Tl_BoardDAO.reportRegister",dto);
  }
   public int insertMessage(MessageDTO dto) {
	   return sst.delete("Tl_BoardDAO.insertMessage",dto);
  }
   public int likeCount(String seq) {
	   return sst.delete("Tl_BoardDAO.likeCount",seq);
  }
   public int selectlikeCount(String seq) {
	   return sst.selectOne("Tl_BoardDAO.selectLikeCount",seq);
  }
   public List<MessageDTO> showSeter(String id){
	  return sst.selectList("Tl_BoardDAO.messageSeter",id);
   }
   public List<MessageDTO> showgetter(String id){
	   return sst.selectList("Tl_BoardDAO.messageGetter",id);
   }
   public int messageDelete(String seq) {
	   return sst.delete("Tl_BoardDAO.messageDelete",seq);
   }
}