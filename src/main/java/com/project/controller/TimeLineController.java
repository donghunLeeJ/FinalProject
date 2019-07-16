package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.dto.MemberDTO;
import com.project.dto.ProfileImageDTO;
import com.project.dto.Tl_BoardDTO;
import com.project.dto.Tl_ReplyDTO;
import com.project.service.TimeLineService;

@Controller
@RequestMapping("/timeline")
public class TimeLineController {

	@Autowired
	private HttpSession session;

	@Autowired
	private TimeLineService tls;

	@RequestMapping("/accessTimeLine")
	public String accessTimeline(HttpServletRequest request, Tl_BoardDTO dto, String seq) {
		Map<String,String> profile = new HashMap();
		for(ProfileImageDTO img : tls.profile_image()) {
			profile.put(img.getId(), img.getImagePath());
		}
		int page = Integer.parseInt(seq);
		request.setAttribute("result", tls.showAll(page));
		request.setAttribute("profile", profile);
		return "/timeLine/timeLine";
	}

	@RequestMapping("/tl_boardWrite")
	public String tl_boardWrite() {
		if(session.getAttribute("id") == null) {
			return "/timeLine/writereject";
		}
		else{
			return "/timeLine/timeLine_Write";
		}
	}

	@RequestMapping("/writedProc")
	public String writedProc(Tl_BoardDTO dto) {

		String resourcePath = session.getServletContext().getRealPath("/resources/img/tl-img/");
		System.out.println(resourcePath);
		try {

			String fileName = System.currentTimeMillis() + dto.getTl_image().getOriginalFilename();
			File savedFile = new File(resourcePath + "/" + fileName);
			dto.setTl_imgaddr("/img/tl-img/" + savedFile.getName());

			dto.getTl_image().transferTo(savedFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		MemberDTO id = (MemberDTO) session.getAttribute("id");
		dto.setTl_writer(id.getMember_id());
		
		tls.write(dto);
		return "redirect:/timeline/accessTimeLine?seq=1";

	}

	@RequestMapping(value = "/ajaxProc", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxProc(String page) {
		int seq = Integer.parseInt(page);
		System.out.println(seq);
		Gson g = new Gson();
		return g.toJson(tls.showAll(seq));
	}
	
	@RequestMapping("/reportProc")
	public String reportProc(HttpServletRequest request) {
		
		String seq = request.getParameter("seq");
		if(session.getAttribute("id") == null) {
			return "/timeLine/reportreject";
		}else {
			
			return "/timeLine/reportcompl";
		}
		
	}
	
	@RequestMapping("/boardModify")
	public String boardModify(HttpServletRequest request) {
		
		if(session.getAttribute("id") == null) {
			return "/timeLine/modi_del_reject2";
		}else {
		
			String seq = request.getParameter("seq");
			System.out.println(seq);
			String writer = request.getParameter("writer");
			String id = ((MemberDTO)session.getAttribute("id")).getMember_id();
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			String imgaddr = request.getParameter("imgaddr");
			
			if(writer.equals(id)) {
				request.setAttribute("seq", seq);
				request.setAttribute("title", title);
				request.setAttribute("contents", contents);
				request.setAttribute("imgaddr", imgaddr);
				return "/timeLine/modifywrite";
			}
			else {
				return "/timeLine/modi_del_reject";
			}
		}
		
	}
	
	@RequestMapping("/boardModified")
	public String boardModified(Tl_BoardDTO dto) {
		String resourcePath = session.getServletContext().getRealPath("/resources/img/tl-img/");
		System.out.println(resourcePath);
		try {

			String fileName = System.currentTimeMillis() + dto.getTl_image().getOriginalFilename();
			File savedFile = new File(resourcePath + "/" + fileName);
			dto.setTl_imgaddr("/img/tl-img/" + savedFile.getName());

			dto.getTl_image().transferTo(savedFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		MemberDTO id = (MemberDTO) session.getAttribute("id");
		dto.setTl_writer(id.getMember_id());
		
		tls.update(dto);
		
		return "/timeLine/modifycompl";
	}
	
	@RequestMapping("/boardDelete")
	public String boardDelete(HttpServletRequest request) {
		
		if(session.getAttribute("id") == null) {
			return "/timeLine/modi_del_reject2";
		}else {
			String writer = request.getParameter("writer");
			String id = ((MemberDTO)session.getAttribute("id")).getMember_id();
			String seq = request.getParameter("seq");
			if(writer.equals(id)) {
				tls.delete(seq);
				return "/timeLine/boarddelete";
			}else {
				return "/timeLine/modi_del_reject";
			}
		}
	}
	
	@RequestMapping("/boardReply")
	public String boardReply(Tl_ReplyDTO dto) {
		
		if(dto.getTl_repl_contents() != ""){
			if(session.getAttribute("id") != null) {
				String id = ((MemberDTO)session.getAttribute("id")).getMember_id();
				int seq = (int)dto.getTl_board_seq();
				dto.setTl_board_seq(seq);
				dto.setTl_repl_writer(id);
				tls.Reply_write(dto);
				return "redirect:/timeline/accessTimeLine?seq=1";
			}else {
				return "/timeLine/replyreject2";
			}
			
		}else {
			return "/timeLine/replyreject";
		}
		
	}
}