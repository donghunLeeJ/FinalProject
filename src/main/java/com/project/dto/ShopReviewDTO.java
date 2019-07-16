package com.project.dto;

public class ShopReviewDTO {
	private int review_seq;
	private int products_seq;// 댓글가져올때 이거로가져옴
	private String user_Id;
	private int star_review;
	private String title;
	private String contents;

	public ShopReviewDTO() {
		super();
	}

	public ShopReviewDTO(int review_seq, int products_seq, String user_Id, int star_review, String title,
			String contents) {
		super();
		this.review_seq = review_seq;
		this.products_seq = products_seq;
		this.user_Id = user_Id;
		this.star_review = star_review;
		this.title = title;
		this.contents = contents;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public int getProducts_seq() {
		return products_seq;
	}

	public void setProducts_seq(int products_seq) {
		this.products_seq = products_seq;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public int getStar_review() {
		return star_review;
	}

	public void setStar_review(int star_review) {
		this.star_review = star_review;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

}
