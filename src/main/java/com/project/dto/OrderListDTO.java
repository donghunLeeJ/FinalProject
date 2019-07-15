package com.project.dto;

public class OrderListDTO {
	private int seq;
	private int products_seq;
	private String sell_id;
	private String buyer_id;
	private String sell_brand;
	private String sell_title;
	private String sell_imagepath;
	private int buy_quantity;
	private int buy_price;
	private String buy_date;
	private String order_number;

	public OrderListDTO() {
		super();
	}

	public OrderListDTO(int seq, int products_seq, String sell_id, String buyer_id, String sell_brand,
			String sell_title, String sell_imagepath, int buy_quantity, int buy_price, String buy_date,
			String order_number) {
		super();
		this.seq = seq;
		this.products_seq = products_seq;
		this.sell_id = sell_id;
		this.buyer_id = buyer_id;
		this.sell_brand = sell_brand;
		this.sell_title = sell_title;
		this.sell_imagepath = sell_imagepath;
		this.buy_quantity = buy_quantity;
		this.buy_price = buy_price;
		this.buy_date = buy_date;
		this.order_number = order_number;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getProducts_seq() {
		return products_seq;
	}

	public void setProducts_seq(int products_seq) {
		this.products_seq = products_seq;
	}

	public String getSell_id() {
		return sell_id;
	}

	public void setSell_id(String sell_id) {
		this.sell_id = sell_id;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getSell_brand() {
		return sell_brand;
	}

	public void setSell_brand(String sell_brand) {
		this.sell_brand = sell_brand;
	}

	public String getSell_title() {
		return sell_title;
	}

	public void setSell_title(String sell_title) {
		this.sell_title = sell_title;
	}

	public String getSell_imagepath() {
		return sell_imagepath;
	}

	public void setSell_imagepath(String sell_imagepath) {
		this.sell_imagepath = sell_imagepath;
	}

	public int getBuy_quantity() {
		return buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	public String getOrder_number() {
		return order_number;
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}

}
