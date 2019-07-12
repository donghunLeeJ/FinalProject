package com.project.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class ShopBoardDTO {

	
private int shop_seq;     //글번호
private String shop_id;   //판매자의 로그인 id 
private String shop_brand;
private String shop_title; //판매글 제목
private String shop_contents;//판매글 내용     
private Timestamp shop_writedate;//판매글 작성 시간
private String shop_location;  //지역
private String shop_expiration; //유통기한
private int shop_price;        //가격(1개당)
private int shop_quantity;  //수량

private String shop_imagepath1;
private String shop_imagepath2;
private String shop_imagepath3;//음식 이미지 주소가 들어가는 경로 

public ShopBoardDTO(){}


public ShopBoardDTO(int shop_seq, String shop_id, String shop_brand, String shop_title, String shop_contents,
		Timestamp shop_writedate, String shop_location, String shop_expiration, int shop_price, int shop_quantity,
		String shop_imagepath1, String shop_imagepath2, String shop_imagepath3) {
	super();
	this.shop_seq = shop_seq;
	this.shop_id = shop_id;
	this.shop_brand = shop_brand;
	this.shop_title = shop_title;
	this.shop_contents = shop_contents;
	this.shop_writedate = shop_writedate;
	this.shop_location = shop_location;
	this.shop_expiration = shop_expiration;
	this.shop_price = shop_price;
	this.shop_quantity = shop_quantity;
	this.shop_imagepath1 = shop_imagepath1;
	this.shop_imagepath2 = shop_imagepath2;
	this.shop_imagepath3 = shop_imagepath3;
}


public int getShop_seq() {
	return shop_seq;
}

public void setShop_seq(int shop_seq) {
	this.shop_seq = shop_seq;
}

public String getShop_id() {
	return shop_id;
}

public void setShop_id(String shop_id) {
	this.shop_id = shop_id;
}

public String getShop_brand() {
	return shop_brand;
}

public void setShop_brand(String shop_brand) {
	this.shop_brand = shop_brand;
}

public String getShop_title() {
	return shop_title;
}

public void setShop_title(String shop_title) {
	this.shop_title = shop_title;
}

public String getShop_contents() {
	return shop_contents;
}

public void setShop_contents(String shop_contents) {
	this.shop_contents = shop_contents;
}

public Timestamp getShop_writedate() {
	return shop_writedate;
}

public void setShop_writedate(Timestamp shop_writedate) {
	this.shop_writedate = shop_writedate;
}

public String getShop_location() {
	return shop_location;
}

public void setShop_location(String shop_location) {
	this.shop_location = shop_location;
}

public String getShop_expiration() {
	return shop_expiration;
}

public void setShop_expiration(String shop_expiration) {
	this.shop_expiration = shop_expiration;
}

public int getShop_price() {
	return shop_price;
}

public void setShop_price(int shop_price) {
	this.shop_price = shop_price;
}

public int getShop_quantity() {
	return shop_quantity;
}

public void setShop_quantity(int shop_quantity) {
	this.shop_quantity = shop_quantity;
}

public String getShop_imagepath1() {
	return shop_imagepath1;
}

public void setShop_imagepath1(String shop_imagepath1) {
	this.shop_imagepath1 = shop_imagepath1;
}

public String getShop_imagepath2() {
	return shop_imagepath2;
}

public void setShop_imagepath2(String shop_imagepath2) {
	this.shop_imagepath2 = shop_imagepath2;
}

public String getShop_imagepath3() {
	return shop_imagepath3;
}

public void setShop_imagepath3(String shop_imagepath3) {
	this.shop_imagepath3 = shop_imagepath3;
}













}

