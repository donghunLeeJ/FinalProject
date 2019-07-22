package com.project.dto;

public class BasketDTO {
	private int basket_seq;
	private int product_seq;
	private String basket_seller;
	private String basket_id;
	private String basket_imagepath;
	private String basket_title;
	private String basket_expiration;
	private int basket_price;
	private int basket_quantity;
	private String basket_location;
	private String basket_brand;
	
	
	public BasketDTO() {}
	
	public BasketDTO(int basket_seq, int product_seq, String basket_seller, String basket_id, String basket_imagepath,
			String basket_title, String basket_expiration, int basket_price, int basket_quantity,
			String basket_location, String basket_brand) {
		super();
		this.basket_seq = basket_seq;
		this.product_seq = product_seq;
		this.basket_seller = basket_seller;
		this.basket_id = basket_id;
		this.basket_imagepath = basket_imagepath;
		this.basket_title = basket_title;
		this.basket_expiration = basket_expiration;
		this.basket_price = basket_price;
		this.basket_quantity = basket_quantity;
		this.basket_location = basket_location;
		this.basket_brand = basket_brand;
	}
	public int getBasket_seq() {
		return basket_seq;
	}
	public void setBasket_seq(int basket_seq) {
		this.basket_seq = basket_seq;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public String getBasket_seller() {
		return basket_seller;
	}
	public void setBasket_seller(String basket_seller) {
		this.basket_seller = basket_seller;
	}
	public String getBasket_id() {
		return basket_id;
	}
	public void setBasket_id(String basket_id) {
		this.basket_id = basket_id;
	}
	public String getBasket_imagepath() {
		return basket_imagepath;
	}
	public void setBasket_imagepath(String basket_imagepath) {
		this.basket_imagepath = basket_imagepath;
	}
	public String getBasket_title() {
		return basket_title;
	}
	public void setBasket_title(String basket_title) {
		this.basket_title = basket_title;
	}
	public String getBasket_expiration() {
		return basket_expiration;
	}
	public void setBasket_expiration(String basket_expiration) {
		this.basket_expiration = basket_expiration;
	}
	public int getBasket_price() {
		return basket_price;
	}
	public void setBasket_price(int basket_price) {
		this.basket_price = basket_price;
	}
	public int getBasket_quantity() {
		return basket_quantity;
	}
	public void setBasket_quantity(int basket_quantity) {
		this.basket_quantity = basket_quantity;
	}
	public String getBasket_location() {
		return basket_location;
	}
	public void setBasket_location(String basket_location) {
		this.basket_location = basket_location;
	}
	public String getBasket_brand() {
		return basket_brand;
	}
	public void setBasket_brand(String basket_brand) {
		this.basket_brand = basket_brand;
	}
	
	
	
	
}
