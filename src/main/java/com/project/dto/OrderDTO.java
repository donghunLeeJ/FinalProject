package com.project.dto;

import java.sql.Timestamp;

public class OrderDTO {
	private int order_seq;// 주문정보
	private int products_seq; // 글정보seq
	private String buyer_id; // 구매자 로그인시 아이디
	private String order_name; // 주문자 이름
	private String order_phone; // 주문자 폰번호
	private String order_email; // 주문자 이메일 (로그인시가 아닐수있음.)
	private String getter_name; // 받는사람이름
	private String getter_postcode; // 받는사람 우편번호
	private String getter_address1; // 받는사람 주소
	private String getter_address2; // 받는사람 상세주소
	private String getter_phone; // 받는사람 폰번호
	private String getter_command; // 요청사항

	public OrderDTO() {
		super();
	}

	public OrderDTO(int order_seq, int products_seq, String buyer_id, String order_name, String order_phone,
			String order_email, String getter_name, String getter_postcode, String getter_address1,
			String getter_address2, String getter_phone, String getter_command) {
		super();
		this.order_seq = order_seq;
		this.products_seq = products_seq;
		this.buyer_id = buyer_id;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_email = order_email;
		this.getter_name = getter_name;
		this.getter_postcode = getter_postcode;
		this.getter_address1 = getter_address1;
		this.getter_address2 = getter_address2;
		this.getter_phone = getter_phone;
		this.getter_command = getter_command;

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

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_email() {
		return order_email;
	}

	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}

	public String getGetter_name() {
		return getter_name;
	}

	public void setGetter_name(String getter_name) {
		this.getter_name = getter_name;
	}

	public String getGetter_postcode() {
		return getter_postcode;
	}

	public void setGetter_postcode(String getter_postcode) {
		this.getter_postcode = getter_postcode;
	}

	public String getGetter_address1() {
		return getter_address1;
	}

	public void setGetter_address1(String getter_address1) {
		this.getter_address1 = getter_address1;
	}

	public String getGetter_address2() {
		return getter_address2;
	}

	public void setGetter_address2(String getter_address2) {
		this.getter_address2 = getter_address2;
	}

	public String getGetter_phone() {
		return getter_phone;
	}

	public void setGetter_phone(String getter_phone) {
		this.getter_phone = getter_phone;
	}

	public String getGetter_command() {
		return getter_command;
	}

	public void setGetter_command(String getter_command) {
		this.getter_command = getter_command;
	}

}
