package com.project.paging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dto.ShopPagingDTO;
import com.project.service.TimeLineService;

@Component
public class MessageGetPage {
	@Autowired
	private TimeLineService tservice;

	public ShopPagingDTO msPaging(String seqPage,String id) {
		int currentPage = Integer.parseInt(seqPage);
		int recordTotalCount = tservice.message_getter_count(id);
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int pageTotalCount = 0;
		int toNext = 0;
		int toPrev = 0;
		boolean needPrev = true;
		boolean needNext = true;
		int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);
		;
		if (recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		if (startNavi + (naviCountPerPage - 1) > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		if (startNavi == 1) {
			needPrev = false;
		} else {
			toPrev = startNavi - 1;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		} else {
			toNext = endNavi + 1;
		}
		ShopPagingDTO dto = new ShopPagingDTO(startNavi, endNavi, needPrev, needNext, toNext, toPrev);
		return dto;
	}
}
