package com.project.dto;

public class ProfileImageDTO {
	private String id;
	private String imagePath;
	public ProfileImageDTO(String id, String imagePath) {
		super();
		this.id = id;
		this.imagePath = imagePath;
	}
	public ProfileImageDTO() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
}
