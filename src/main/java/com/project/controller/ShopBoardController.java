
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
import com.project.dto.BasketDTO;
import com.project.dto.MemberDTO;
import com.project.dto.OrderDTO;
import com.project.dto.ShopBoardDTO;
import com.project.dto.ShopReviewDTO;
import com.project.dto.ViewDTO;
import com.project.paging.ShopPaging;
import com.project.service.BasketService;
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

	@Autowired
	private BasketService bservice;

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
	public String log_ShopBoard_WriteMove() {

		return "/shopBoard/shopBoard_write";
	}

	@RequestMapping("/ShopBoardViewProc")
	public String ShopBoardSelectProc(String seq) {
		String starAvg;
		int shop_seq = Integer.parseInt(seq);
		ShopBoardDTO dto = sService.ShopBoardIdSelect(shop_seq);// 상품판매 정보
		int memberSell_seq = dto.getMemberSell_seq();
		MemberDTO mdto = sService.shopSellerSelect(memberSell_seq);// 판매자 정보
		List<ShopReviewDTO> review = sService.shopReviewList(shop_seq);// 댓글 리스트
		int reviewRowCount = sService.shopReviewCount(shop_seq);// 댓글 총 row
		Float reviewAvg = sService.shopReviewAvg(shop_seq);

		for (int i = 0; i < review.size(); i++) {

			int count = review.get(i).getStar_review();

			if (count == 1) {
				review.get(i).setGet_star("★☆☆☆☆");
			} else if (count == 2) {
				review.get(i).setGet_star("★★☆☆☆");
			} else if (count == 3) {
				review.get(i).setGet_star("★★★☆☆");
			} else if (count == 4) {
				review.get(i).setGet_star("★★★★☆");
			} else {
				review.get(i).setGet_star("★★★★★");
			}
		}
		if (reviewAvg == null) {
			starAvg = "(평가중)";

		} else if (reviewAvg <= 1.4) {
			starAvg = "★";
		} else if (reviewAvg <= 1.9) {
			starAvg = "★☆";
		} else if (reviewAvg <= 2.4) {
			starAvg = "★★";
		} else if (reviewAvg <= 2.9) {
			starAvg = "★★☆";
		} else if (reviewAvg <= 3.4) {
			starAvg = "★★★";
		} else if (reviewAvg <= 3.9) {
			starAvg = "★★★☆";
		} else if (reviewAvg <= 4.4) {
			starAvg = "★★★★";
		} else if (reviewAvg <= 4.9) {
			starAvg = "★★★★☆";
		} else {
			starAvg = "★★★★★";
		}

		request.setAttribute("dto", dto);
		request.setAttribute("mdto", mdto);
		request.setAttribute("review", review);
		request.setAttribute("reviewAvg", reviewAvg);
		request.setAttribute("starAvg", starAvg);
		request.setAttribute("reviewRowCount", reviewRowCount);
		return "/shopBoard/shopBoard_view";
	}

	@RequestMapping("/ShopBoardInsertProc")
	public String log_filetest(ShopBoardDTO dto, List<MultipartFile> shop_images, String shop_expiration, String sell_seq) {
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
		ViewDTO.setBoardNewCount(ViewDTO.getBoardNewCount() + 1);
		return "redirect:../home";
	}

	@RequestMapping("/shopBoard_buyProc")
	public String log_buyProc(String quantity, String seq) {
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

	public String log_order(OrderDTO odto, String phone1, String phone2, String phone3, String email1, String email2,
			String getter_phone1, String getter_phone2, String getter_phone3, String products_seq) {

		// order테이블에 들어가는정보 배달정보
		String phone = phone1 + phone2 + phone3;
		int products_seq1 = Integer.parseInt(products_seq);
		String email = email1 + "@" + email2;
		String getter_phone = getter_phone1 + getter_phone2 + getter_phone3;
		MemberDTO id = (MemberDTO) session.getAttribute("id");
		String login_email = id.getMember_id();
		int sseq = odto.getProducts_seq();
		odto.setMember_email(login_email);
		odto.setOrder_buyer_phone(phone);
		odto.setOrder_receipt_phone(getter_phone);
		odto.setOrder_buyer_email(email);
		String order_number = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
		odto.setOrder_number(order_number);
		odto.setProducts_seq(products_seq1);
		oService.orderInsert(odto);
		ViewDTO.setTradeCount(ViewDTO.getVisitViewCount() + 1);
		request.setAttribute("ldto", odto);
		request.setAttribute("quant", quant);
		sService.updateQ(quant, sseq);
		return "/shopBoard/shopChargeOk";
	}

	@RequestMapping("/buyReview")
	public String log_shopReview(ShopReviewDTO dto, String products_seq) {
		int products_seq1 = Integer.parseInt(products_seq);
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		dto.setGet_star("1");
		System.out.println(sdf.format(System.currentTimeMillis()));
		dto.setWriteDate(sdf.format(System.currentTimeMillis()));
		dto.setProducts_seq(products_seq1);
		sService.shopReviewInsert(dto);

		return "redirect:/home/";
	}

	@RequestMapping("/shopBasketOrder")
	public String log_basketOrder(OrderDTO odto, String phone1, String phone2, String phone3, String email1, String email2,
			String getter_phone1, String getter_phone2, String getter_phone3, String basket_seq) {
		System.out.println(basket_seq);
		String phone = phone1 + phone2 + phone3;
		String email = email1 + "@" + email2;
		String getter_phone = getter_phone1 + getter_phone2 + getter_phone3;
		String order_number = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
		String seq = basket_seq;
		MemberDTO id = (MemberDTO) session.getAttribute("id");
		String login_email = id.getMember_id();
		String[] seqList = seq.split(",");
		List<OrderDTO> arr = new ArrayList();
		for (int i = 0; i < seqList.length; i++) {
			OrderDTO odto2 = new OrderDTO();
			try {
				odto2 = (OrderDTO) odto.clone();
			} catch (CloneNotSupportedException e) {

				e.printStackTrace();
			}
			System.out.println(seqList[i]);
			BasketDTO bdto = bservice.basketListBuy(seqList[i]);
			odto2.setOrder_buyer_phone(phone);
			odto2.setProducts_seq(bdto.getProduct_seq());
			odto2.setMember_email(login_email);
			odto2.setOrder_number(order_number);
			odto2.setOrder_title(bdto.getBasket_title());
			odto2.setOrder_quantity(bdto.getBasket_quantity());
			odto2.setOrder_price(bdto.getBasket_price());
			odto2.setOrder_image(bdto.getBasket_imagepath());
			odto2.setOrder_seller(bdto.getBasket_seller());
			odto2.setOrder_buyer_email(email);
			odto2.setOrder_receipt_phone(getter_phone);
			arr.add(odto2);
			oService.orderInsert(odto2);
		}
		Gson g = new Gson();
		System.out.println(g.toJson(arr));
		bservice.resetBasket(email);
		request.setAttribute("ldto", arr);
		return "/shopBoard/shopChargeOk2";
	}

}
