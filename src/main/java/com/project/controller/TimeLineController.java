package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
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

	@RequestMapping("/accessTimeLine") // Timeline ùȭ��
	public String accessTimeline(HttpServletRequest request, Tl_BoardDTO dto, String seq) {
		int page = Integer.parseInt(seq);
		request.setAttribute("result", tls.showAll(page));
		return "/timeLine/timeLine";
	}

	@RequestMapping("/tl_boardWrite") // Timeline �۾��� ȭ������ ������ ����
	public String tl_boardWrite() {

		return "/timeLine/timeLine_Write";
	}

	@RequestMapping("/writedProc") // �۾� ����� ������� ����
	public String writedProc(Tl_BoardDTO dto) {

		String resourcePath = session.getServletContext().getRealPath("/resources/img/tl-img/");
		System.out.println(resourcePath);
		try {

			String fileName = System.currentTimeMillis() + dto.getTl_image().getOriginalFilename();
			System.out.println("�����̸�: " + fileName);
			File savedFile = new File(resourcePath + "/" + fileName);
			dto.setTl_imgaddr("/img/tl-img/" + savedFile.getName());

			dto.getTl_image().transferTo(savedFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		MemberDTO id = (MemberDTO) session.getAttribute("id");
		dto.setTl_writer(id.getMember_id());// �ӽ� id�� �Է�
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
}