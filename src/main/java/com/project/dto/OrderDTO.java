package com.project.dto;

import java.sql.Date;

public class OrderDTO implements Cloneable {
	private int order_seq;
	private int products_seq;
	private String member_email;
	private String order_number;
	private Date order_time;
	private String order_title;
	private int order_quantity;
	private int order_price;
	private String order_image;
	private String order_seller;
	private String order_buyer;
	private String order_buyer_phone;
	private String order_buyer_email;
	private String order_receipt;
	private String order_receipt_postcode;
	private String order_receipt_address1;
	private String order_receipt_address2;
	private String order_receipt_phone;
	private String order_receipt_demend;
	private String order_delivery;
	private String order_confirm;

	public OrderDTO() {}
//	@Override
//	public String toString() {
//		return "OrderDTO [order_seq=" + order_seq + ", products_seq=" + products_seq + ", member_email=" + member_email
//				+ ", order_number=" + order_number + ", order_time=" + order_time + ", order_title=" + order_title
//				+ ", order_quantity=" + order_quantity + ", order_price=" + order_price + ", order_image=" + order_image
//				+ ", order_seller=" + order_seller + ", order_buyer=" + order_buyer + ", order_buyer_phone="
//				+ order_buyer_phone + ", order_buyer_email=" + order_buyer_email + ", order_receipt=" + order_receipt
//				+ ", order_receipt_postcode=" + order_receipt_postcode + ", order_receipt_address1="
//				+ order_receipt_address1 + ", order_receipt_address2=" + order_receipt_address2
//				+ ", order_receipt_phone=" + order_receipt_phone + ", order_receipt_demend=" + order_receipt_demend
//				+ ", order_delivery=" + order_delivery + "]";
//	}

	public int getOrder_seq() {
		return order_seq;
	}

	@Override
	public String toString() {
		return "OrderDTO [order_seq=" + order_seq + ", products_seq=" + products_seq + ", member_email=" + member_email
				+ ", order_number=" + order_number + ", order_time=" + order_time + ", order_title=" + order_title
				+ ", order_quantity=" + order_quantity + ", order_price=" + order_price + ", order_image=" + order_image
				+ ", order_seller=" + order_seller + ", order_buyer=" + order_buyer + ", order_buyer_phone="
				+ order_buyer_phone + ", order_buyer_email=" + order_buyer_email + ", order_receipt=" + order_receipt
				+ ", order_receipt_postcode=" + order_receipt_postcode + ", order_receipt_address1="
				+ order_receipt_address1 + ", order_receipt_address2=" + order_receipt_address2
				+ ", order_receipt_phone=" + order_receipt_phone + ", order_receipt_demend=" + order_receipt_demend
				+ ", order_delivery=" + order_delivery + ", order_confirm=" + order_confirm + "]";
	}

	public OrderDTO(String order_confirm) {
		super();
		this.order_confirm = order_confirm;
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

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getOrder_number() {
		return order_number;
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}

	public Date getOrder_time() {
		return order_time;
	}

	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}

	public String getOrder_title() {
		return order_title;
	}

	public void setOrder_title(String order_title) {
		this.order_title = order_title;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public String getOrder_image() {
		return order_image;
	}

	public void setOrder_image(String order_image) {
		this.order_image = order_image;
	}

	public String getOrder_seller() {
		return order_seller;
	}

	public void setOrder_seller(String order_seller) {
		this.order_seller = order_seller;
	}

	public String getOrder_buyer() {
		return order_buyer;
	}

	public void setOrder_buyer(String order_buyer) {
		this.order_buyer = order_buyer;
	}

	public String getOrder_buyer_phone() {
		return order_buyer_phone;
	}

	public void setOrder_buyer_phone(String order_buyer_phone) {
		this.order_buyer_phone = order_buyer_phone;
	}

	public String getOrder_buyer_email() {
		return order_buyer_email;
	}

	public void setOrder_buyer_email(String order_buyer_email) {
		this.order_buyer_email = order_buyer_email;
	}

	public String getOrder_receipt() {
		return order_receipt;
	}

	public void setOrder_receipt(String order_receipt) {
		this.order_receipt = order_receipt;
	}

	public String getOrder_receipt_postcode() {
		return order_receipt_postcode;
	}

	public void setOrder_receipt_postcode(String order_receipt_postcode) {
		this.order_receipt_postcode = order_receipt_postcode;
	}

	public String getOrder_receipt_address1() {
		return order_receipt_address1;
	}

	public void setOrder_receipt_address1(String order_receipt_address1) {
		this.order_receipt_address1 = order_receipt_address1;
	}

	public String getOrder_receipt_address2() {
		return order_receipt_address2;
	}

	public void setOrder_receipt_address2(String order_receipt_address2) {
		this.order_receipt_address2 = order_receipt_address2;
	}

	public String getOrder_receipt_phone() {
		return order_receipt_phone;
	}

	public void setOrder_receipt_phone(String order_receipt_phone) {
		this.order_receipt_phone = order_receipt_phone;
	}

	public String getOrder_receipt_demend() {
		return order_receipt_demend;
	}

	public void setOrder_receipt_demend(String order_receipt_demend) {
		this.order_receipt_demend = order_receipt_demend;
	}

	public String getOrder_delivery() {
		return order_delivery;
	}

	public void setOrder_delivery(String order_delivery) {
		this.order_delivery = order_delivery;
	}
	
	public String getOrder_confirm() {
		return order_confirm;
	}

	public void setOrder_confirm(String order_confirm) {
		this.order_confirm = order_confirm;
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

}