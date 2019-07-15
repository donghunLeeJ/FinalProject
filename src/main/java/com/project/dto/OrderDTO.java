package com.project.dto;

import java.sql.Timestamp;

public class OrderDTO {
	private int order_seq;// 주문정보
	private int products_seq; // 글정보seq
	private String seller_id; // 판매자 ID
	private String buyer_id; // 구매자ID
	private Timestamp buyDate; // 상품 구매시간
	private String products_title; // 상품 제목
	private String products_location; // 판매지역
	private int products_price; // 상품가격
	private int products_quantity; // 판매 수량
	private String products_imagepath; // 상품이미지

	public OrderDTO() {
		super();
	}

	public OrderDTO(int order_seq, int products_seq, String seller_id, String buyer_id, Timestamp buyDate,
			String products_title, String products_location, int products_price, int products_quantity,
			String products_imagepath) {
		super();
		this.order_seq = order_seq;
		this.products_seq = products_seq;
		this.seller_id = seller_id;
		this.buyer_id = buyer_id;
		this.buyDate = buyDate;
		this.products_title = products_title;
		this.products_location = products_location;
		this.products_price = products_price;
		this.products_quantity = products_quantity;
		this.products_imagepath = products_imagepath;
	}

	public int getOrder_seq() {
		return order_seq;
	}

	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}

	public int getProducts_seq() {
		return products_seq;
	}

	public void setProducts_seq(int products_seq) {
		this.products_seq = products_seq;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public Timestamp getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Timestamp buyDate) {
		this.buyDate = buyDate;
	}

	public String getProducts_title() {
		return products_title;
	}

	public void setProducts_title(String products_title) {
		this.products_title = products_title;
	}

	public String getProducts_location() {
		return products_location;
	}

	public void setProducts_location(String products_location) {
		this.products_location = products_location;
	}

	public int getProducts_price() {
		return products_price;
	}

	public void setProducts_price(int products_price) {
		this.products_price = products_price;
	}

	public int getProducts_quantity() {
		return products_quantity;
	}

	public void setProducts_quantity(int products_quantity) {
		this.products_quantity = products_quantity;
	}

	public String getProducts_imagepath() {
		return products_imagepath;
	}

	public void setProducts_imagepath(String products_imagepath) {
		this.products_imagepath = products_imagepath;
	}

}
