
package com.project.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.project.dto.MemberDTO;
import com.project.dto.OrderDTO;
import com.project.dto.OrderListDTO;
import com.project.dto.ShopBoardDTO;
import com.project.dto.ShopReviewDTO;
import com.project.paging.ShopPaging;
import com.project.service.OrderService;
import com.project.service.ShopBoardService;

@Controller
@RequestMapping("/shopboard")
public class ShopBoardController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ShopBoardService sService;

	@Autowired
	private OrderService oService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private ShopPaging sPaging;

	@RequestMapping("/shopBoardGo")
	public String ShopBoardGo(String page) {

		int currentPage = Integer.parseInt(page);
		int lastPage = currentPage * 12;
		sPaging.sPaging(currentPage);
		List<ShopBoardDTO> boardList = sService.ShopBoardList(lastPage);
		request.setAttribute("boardList", boardList);
		return "shopBoard/shopBoard";
	}

	@RequestMapping(value = "/shopBoardScroll", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ShopBoard_ScrollList(String page) {
		int currentPage = Integer.parseInt(page);
		int lastPage = currentPage * 12;
		sPaging.sPaging(currentPage);
		List<ShopBoardDTO> boardList = sService.ShopBoardList(lastPage);
		return new Gson().toJson(boardList);

	}

	@RequestMapping("/ShopBoard_write")
	public String ShopBoard_WriteMove() {

		return "/shopBoard/shopBoard_write";
	}

	@RequestMapping("/ShopBoardViewProc")
	public String ShopBoardSelectProc(String seq) {

		int shop_seq = Integer.parseInt(seq);
		ShopBoardDTO dto = sService.ShopBoardIdSelect(shop_seq);
		System.out.println(dto.getMemberSell_seq());
		int memberSell_seq = dto.getMemberSell_seq();
		MemberDTO mdto = sService.shopSellerSelect(memberSell_seq);
		request.setAttribute("dto", dto);
		request.setAttribute("mdto", mdto);
		return "/shopBoard/shopBoard_view";
	}

	@RequestMapping("/ShopBoardInsertProc")
	public String filetest(ShopBoardDTO dto, List<MultipartFile> shop_images, String shop_expiration, String sell_seq) {
		List<String> fileArrayPath = new ArrayList();
		System.out.println(dto.getShop_seq());
		System.out.println("내용: " + dto.getShop_contents());
		System.out.println("브랜드: " + dto.getShop_brand());
		System.out.println("타이틀: " + dto.getShop_title());
		System.out.println("지역: " + dto.getShop_location());
		System.out.println("유통기한: " + dto.getShop_expiration());
		System.out.println("test" + shop_expiration);
		int memberSell_seq = Integer.parseInt(sell_seq);
		System.out.println("sell_seq" + sell_seq);
		int fileCount = 0;
		for (MultipartFile image : shop_images) {

			// if(fileCount>2){System.out.println("이미지는 최대 3개까지만 업로드 가능.");break;}

			if (image.getSize() != 0) {
				String originFileName = image.getOriginalFilename();
				long fileSize = image.getSize();
				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);
				String resourcePath = session.getServletContext().getRealPath("/resources/img/shopfoodimg/");
				System.out.println(resourcePath);
				String targetFile = resourcePath + "/" + UUID.randomUUID().toString().replace("-", "").substring(0, 8)
						+ "_foodimage.png";
				try {

					File f = new File(targetFile);
					image.transferTo(f);
					fileArrayPath.add("/img/shopfoodimg/" + f.getName());
					fileCount++;

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		if (fileCount == 1) {

			fileArrayPath.add("/img/default.jpg");
			fileArrayPath.add("/img/default.jpg");
			dto.setShop_imagepath1(fileArrayPath.get(0));
			dto.setShop_imagepath2(fileArrayPath.get(1));
			dto.setShop_imagepath3(fileArrayPath.get(2));

		} else if (fileCount == 2) {

			fileArrayPath.add("/img/default.jpg");
			dto.setShop_imagepath1(fileArrayPath.get(0));
			dto.setShop_imagepath2(fileArrayPath.get(1));
			dto.setShop_imagepath3(fileArrayPath.get(2));

		} else if (fileCount > 2) {

			dto.setShop_imagepath1(fileArrayPath.get(0));
			dto.setShop_imagepath2(fileArrayPath.get(1));
			dto.setShop_imagepath3(fileArrayPath.get(2));

		}

		MemberDTO mdto = (MemberDTO) session.getAttribute("id");
		dto.setShop_id(mdto.getMember_id());
		dto.setMemberSell_seq(memberSell_seq);
		// dto.setShop_id("kkjangel");
		int result = sService.ShopBoardInsert(dto);
		return "redirect:../home";
	}

	@RequestMapping("/shopBoard_buyProc")
	public String buyProc(String quantity, String seq) {
		int quantity1 = Integer.parseInt(quantity);// 수량
		int shop_seq = Integer.parseInt(seq);
		System.out.println(quantity1);
		// 상품정보 테이블의 값을 꺼내오는 query필요.
		ShopBoardDTO sdto = sService.ShopBoardIdSelect(shop_seq);
		int price = sdto.getShop_price();
		int resultDB = quantity1 * sdto.getShop_price();
		int resultPage = quantity1 * price;// DB에 저장된 개당 가격 == 홈페이지에서뜬 개당 가격 비교해야함.

		request.setAttribute("dto", sdto);// 상품정보
		request.setAttribute("quantity", quantity1); // 상품수량
		if (resultDB == resultPage) {
			request.setAttribute("price", resultDB);// 수량에따른 금액
			System.out.println("일치함");
			return "/shopBoard/shopBoard_buy";

		} else {
			System.out.println("금액오류");
			return "/error";
		}

	}

	@RequestMapping("/shopOrder")
	public String order(OrderDTO odto, String phone1, String phone2, String phone3, String email1, String email2,
			String getter_phone1, String getter_phone2, String getter_phone3, String quantity, String price) {

		ShopBoardDTO sdto = sService.ShopBoardIdSelect(odto.getProducts_seq());

		// order테이블에 들어가는정보 배달정보
		String phone = phone1 + phone2 + phone3;
		String email = email1 + "@" + email2;
		String getter_phone = getter_phone1 + getter_phone2 + getter_phone3;
		MemberDTO id = (MemberDTO) session.getAttribute("id");
		String buyId = id.getMember_id();
		odto.setBuyer_id(buyId);
		odto.setOrder_phone(phone);
		odto.setOrder_email(email);
		odto.setGetter_phone(getter_phone);
		String savedName = UUID.randomUUID().toString().replace("-", "").substring(0, 8);

		// orderList테이블에 들어가는정보 주문자+판매자정보
		int quantity1 = Integer.parseInt(quantity);// orderList 테이블에넣는값
		int price1 = Integer.parseInt(price);// orderList 테이블에넣는값
		SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddhhmmss");
		OrderListDTO ldto = new OrderListDTO();
		ldto.setProducts_seq(sdto.getShop_seq());
		ldto.setSell_id(sdto.getShop_id());
		ldto.setBuyer_id(buyId);
		ldto.setSell_brand(sdto.getShop_brand());
		ldto.setSell_title(sdto.getShop_title());
		ldto.setSell_imagepath(sdto.getShop_imagepath1());
		ldto.setBuy_quantity(quantity1);
		ldto.setBuy_price(price1);
		ldto.setBuy_date(sdf1.format(System.currentTimeMillis()));
		ldto.setOrder_number(sdf2.format(System.currentTimeMillis()) + savedName);
		oService.orderInsert(odto, ldto);
		request.setAttribute("odto", odto);
		request.setAttribute("ldto", ldto);

		return "/shopBoard/shopChargeOk";
	}

	@RequestMapping("/buyReview")
	public String shopReview(ShopReviewDTO dto) {
		System.out.println(dto.getStar_review());
		System.out.println(dto.getTitle());
		System.out.println(dto.getContents());
		return "redirect:/home/";
	}

}
