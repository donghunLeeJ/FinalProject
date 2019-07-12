package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.MemberDTO;
import com.project.dto.Tl_BoardDTO;
import com.project.service.TimeLineService;

@Controller
@RequestMapping("/timeline")
public class TimeLineController {
   
   @Autowired
   private HttpSession session;
   
   @Autowired
   private TimeLineService tls;
   
   @RequestMapping("/accessTimeLine")//Timeline ùȭ��
   public String accessTimeline(HttpServletRequest request,Tl_BoardDTO dto) {
      request.setAttribute("result", tls.showAll());
      return "/timeLine/timeLine";
   }
   
   @RequestMapping("/tl_boardWrite")//Timeline �۾��� ȭ������ ������ ����
   public String tl_boardWrite() {
      
      return "/timeLine/timeLine_Write";
   }
   
   @RequestMapping("/writedProc")//�۾� ����� ������� ����
   public String writedProc(Tl_BoardDTO dto) {
      
      String resourcePath = session.getServletContext().getRealPath("/resources/img/tl-img/");
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      System.out.println(resourcePath);
      try {
         
         String fileName = System.currentTimeMillis()+dto.getTl_image().getOriginalFilename();
         System.out.println("�����̸�: " +fileName);
         File savedFile = new File(resourcePath + "/" + fileName);
         dto.setTl_imgaddr("/img/tl-img/"+savedFile.getName());
         
         dto.getTl_image().transferTo(savedFile);
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      MemberDTO id = (MemberDTO)session.getAttribute("id");
      dto.setTl_writer(id.getMember_id());//�ӽ� id�� �Է�
      tls.write(dto);
      
      return "/timeLine/writecompl";
      
   }
}