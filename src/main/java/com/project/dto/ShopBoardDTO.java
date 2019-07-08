package com.project.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class ShopBoardDTO {
	
private int shop_seq;     //글번호
private String shop_id;   //판매자의 로그인 id 
private String shop_title; //판매글 제목
private String shop_contents;//판매글 내용     
private Timestamp shop_writedate;//판매글 작성 시간
private String shop_location;  //지역
private String shop_expiration; //유통기한
private int shop_price;        //가격(1개당)
private int shop_quantity;  //수량
private MultipartFile shop_image; //이미지 파일임
private String shop_imagepath;	//음식 이미지 주소가 들어가는 경로 

public ShopBoardDTO(){}

public ShopBoardDTO(int shop_seq, String shop_id, String shop_title, String shop_contents, Timestamp shop_writedate,
		String shop_location, String shop_expiration, int shop_price, int shop_quantity, MultipartFile shop_image,
		String shop_imagepath) {
	super();
	this.shop_seq = shop_seq;
	this.shop_id = shop_id;
	this.shop_title = shop_title;
	this.shop_contents = shop_contents;
	this.shop_writedate = shop_writedate;
	this.shop_location = shop_location;
	this.shop_expiration = shop_expiration;
	this.shop_price = shop_price;
	this.shop_quantity = shop_quantity;
	this.shop_image = shop_image;
	this.shop_imagepath = shop_imagepath;
}

public ShopBoardDTO(int shop_seq, String shop_id, String shop_title, String shop_contents, Timestamp shop_writedate,
		String shop_location, String shop_expiration, int shop_price, int shop_quantity, String shop_imagepath) {
	super();
	this.shop_seq = shop_seq;
	this.shop_id = shop_id;
	this.shop_title = shop_title;
	this.shop_contents = shop_contents;
	this.shop_writedate = shop_writedate;
	this.shop_location = shop_location;
	this.shop_expiration = shop_expiration;
	this.shop_price = shop_price;
	this.shop_quantity = shop_quantity;
	this.shop_imagepath = shop_imagepath;
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
public MultipartFile getShop_image() {
	return shop_image;
}
public void setShop_image(MultipartFile shop_image) {
	this.shop_image = shop_image;
}
public String getShop_imagepath() {
	return shop_imagepath;
}
public void setShop_imagepath(String shop_imagepath) {
	this.shop_imagepath = shop_imagepath;
}
	
	



}

