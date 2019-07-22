package com.project.dto;

import java.sql.Date;

public class MessageDTO {
	private int message_seq;
	private String message_sender; 
	private String message_getter; 
	private String message_contents; 	
	private Date message_time;
	public MessageDTO(int message_seq, String message_sender, String message_getter, String message_contents,
			Date message_time) {
		super();
		this.message_seq = message_seq;
		this.message_sender = message_sender;
		this.message_getter = message_getter;
		this.message_contents = message_contents;
		this.message_time = message_time;
	}
	public MessageDTO() {
		super();
	}
	public int getMessage_seq() {
		return message_seq;
	}
	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}
	public String getMessage_sender() {
		return message_sender;
	}
	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}
	public String getMessage_getter() {
		return message_getter;
	}
	public void setMessage_getter(String message_getter) {
		this.message_getter = message_getter;
	}
	public String getMessage_contents() {
		return message_contents;
	}
	public void setMessage_contents(String message_contents) {
		this.message_contents = message_contents;
	}
	public Date getMessage_time() {
		return message_time;
	}
	public void setMessage_time(Date message_time) {
		this.message_time = message_time;
	}
	
	
}
