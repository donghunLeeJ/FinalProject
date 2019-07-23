package com.project.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.dto.MemberDTO;
import com.project.dto.MessageDTO;
import com.project.dto.Tl_BoardDTO;
import com.project.dto.Tl_ReplyDTO;
import com.project.service.TimeLineService;

@Controller
@RequestMapping("/timeline")
public class TimeLineController {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpSession session;

	@Autowired
	private TimeLineService tls;

	@RequestMapping("/accessTimeLine")
	public String accessTimeline(HttpServletRequest request, Tl_BoardDTO dto, String seq) {

		int page = Integer.parseInt(seq);
		request.setAttribute("result", tls.showAll(page));

		return "/timeLine/timeLine";
	}

	@RequestMapping("/tl_boardWrite")
	public String tl_boardWrite() {
		if (session.getAttribute("id") == null) {
			return "/timeLine/writereject";
		} else {
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
		dto.setTl_writer_profile(id.getMember_imgpath());
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

	@RequestMapping(value = "/ajaxProcReple", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxProcReplShow(String seq) {
		System.out.println(seq);
		int resultSeq = Integer.parseInt(seq);
		Gson g = new Gson();
		return g.toJson(tls.show(resultSeq));

	}

	@RequestMapping(value = "/replyAjaxProc", produces = "application/text; charset=utf8")
	@ResponseBody
	public String reAjaxProc(String page, String seq) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("id");
		Tl_ReplyDTO dto = new Tl_ReplyDTO();
		dto.setTl_board_seq(Integer.parseInt(seq));
		dto.setTl_repl_writer(mdto.getMember_id());
		dto.setTl_repl_contents(page);
		tls.Reply_write(dto);
		String[] id = mdto.getMember_id().split("@");
		String result = id[0] + ":" + page;
		return result;
	}

	@RequestMapping("/reportProc")
	public String reportProc(String seq) {
		request.setAttribute("seq", seq);
		return "/timeLine/reportcompl";
	}


	@RequestMapping("/reportRegister")
	public String reportRegister(Tl_BoardDTO dto) {
		System.out.println(dto.getTl_board_seq());
		System.out.println(dto.getTl_reason());
		
		//신고당한 글을 갱신할 때 신고자를 추가시킴
		MemberDTO user = (MemberDTO)session.getAttribute("id");
		dto.setTl_reporter(user.getMember_id());
 		request.setAttribute("report", tls.reportRegister(dto));
				
		return "/timeLine/reportProc";
	}


	@RequestMapping("/boardModify")
	public String boardModify(HttpServletRequest request) {

		if (session.getAttribute("id") == null) {
			return "/timeLine/modi_del_reject2";
		} else {

			String seq = request.getParameter("seq");
			System.out.println(seq);
			String writer = request.getParameter("writer");
			String id = ((MemberDTO) session.getAttribute("id")).getMember_id();
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			String imgaddr = request.getParameter("imgaddr");

			if (writer.equals(id)) {
				request.setAttribute("seq", seq);
				request.setAttribute("title", title);
				request.setAttribute("contents", contents);
				request.setAttribute("imgaddr", imgaddr);
				return "/timeLine/modifywrite";
			} else {
				return "/timeLine/modi_del_reject";
			}
		}

	}

	@RequestMapping("/boardModified")
	public String boardModified(Tl_BoardDTO dto, String imagePath) {
		if (dto.getTl_image().getSize() == 0) {
			dto.setTl_imgaddr(imagePath);
			MemberDTO id = (MemberDTO) session.getAttribute("id");
			dto.setTl_writer(id.getMember_id());
			tls.update(dto);
		} else {
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
		}
		return "/timeLine/modifycompl";
	}

	@RequestMapping("/boardDelete")
	public String boardDelete(HttpServletRequest request) {

		if (session.getAttribute("id") == null) {
			return "/timeLine/modi_del_reject2";
		} else {
			String writer = request.getParameter("writer");
			String id = ((MemberDTO) session.getAttribute("id")).getMember_id();
			String seq = request.getParameter("seq");
			if (writer.equals(id)) {
				tls.delete(seq);
				return "/timeLine/boarddelete";
			} else {
				return "/timeLine/modi_del_reject";
			}
		}
	}

	@RequestMapping("/boardReply")
	public String boardReply(Tl_ReplyDTO dto) {

		if (dto.getTl_repl_contents() != "") {
			if (session.getAttribute("id") != null) {
				String id = ((MemberDTO) session.getAttribute("id")).getMember_id();
				int seq = (int) dto.getTl_board_seq();
				dto.setTl_board_seq(seq);
				dto.setTl_repl_writer(id);
				tls.Reply_write(dto);
				return "redirect:/timeline/accessTimeLine?seq=1";
			} else {
				return "/timeLine/replyreject2";
			}

		} else {

			return "/timeLine/replyreject";
		}

	}

	@RequestMapping("/replyDelete")
	public String replyDelete(String seq) {
		MemberDTO dto = (MemberDTO) session.getAttribute("id");
		String id = dto.getMember_id();
		if (tls.replyDelete(id, seq) == 1) {
			return "redirect:/timeline/accessTimeLine?seq=1";
		} else {

			request.setAttribute("check", 1);
			return "/timeLine/replyDeleteCheck";
		}

	}
	@RequestMapping("/message")
	public String messageWindow(String seq, String writer) {
		String sender = ((MemberDTO)session.getAttribute("id")).getMember_id();
		
		if(writer.equals(sender)) {
			request.setAttribute("no", 1);
		}else {
			request.setAttribute("seq", seq);
			request.setAttribute("writer", writer);
			request.setAttribute("sender", sender);
			
		}
		return "timeLine/messageWindow";

	}
	@RequestMapping("/messageProc")
	public String messageProc(MessageDTO dto) {
		System.out.println(dto.getMessage_getter());
		System.out.println(dto.getMessage_sender());
		System.out.println(dto.getMessage_contents());
		request.setAttribute("result", tls.insertMessage(dto));
		return "timeLine/messageProc";

	}
	@RequestMapping(value = "/like", produces = "application/text; charset=utf8")
	@ResponseBody
	public String likeProc(String seq) {
		tls.likeCount(seq);
		String seqs = tls.selectlikeCount(seq)+" ";
		System.out.println(seqs);
		return seqs;
		
	}
	
}