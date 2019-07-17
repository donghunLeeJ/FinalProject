package com.project.dto;

public class ShopReviewDTO {
	private int review_seq;
	private int products_seq;// 댓글가져올때 이거로가져옴
	private String user_id;
	private int star_review;
	private String get_star;
	private String title;
	private String contents;
	private String writeDate;

	public ShopReviewDTO() {
		super();
	}

	public ShopReviewDTO(int review_seq, int products_seq, String user_id, int star_review, String get_star,
			String title, String contents, String writeDate) {
		super();
		this.review_seq = review_seq;
		this.products_seq = products_seq;
		this.user_id = user_id;
		this.star_review = star_review;
		this.get_star = get_star;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getStar_review() {
		return star_review;
	}

	public void setStar_review(int star_review) {
		this.star_review = star_review;
	}

	public String getGet_star() {
		return get_star;
	}

	public void setGet_star(String get_star) {
		this.get_star = get_star;
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

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

}
