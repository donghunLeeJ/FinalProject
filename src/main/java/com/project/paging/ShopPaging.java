package com.project.paging;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.dao.ShopBoardDAO;
import com.project.dto.ShopPagingDTO;

public class ShopPaging {

	@Autowired
	private ShopBoardDAO sdao;

	public ShopPagingDTO sPaging(int currentPage) {

		int recordTotalCount = sdao.totalCount();
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