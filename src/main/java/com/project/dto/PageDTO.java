package com.project.dto;

public class PageDTO {
	
	private int startCount;
	private int endCount;
	private String keyWord;
	private String shop_id;
	private String member_email;
	public PageDTO(){}
	
	public PageDTO(int startCount, int endCount) {
		super();
		this.startCount = startCount;
		this.endCount = endCount;
	}
	
	public PageDTO(int startCount, int endCount, String keyWord) {
		super();
		this.startCount = startCount;
		this.endCount = endCount;
		this.keyWord = keyWord;
	}

	public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	
}
