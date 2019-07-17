package com.project.dto;

import java.util.Date;

public class Tl_ReplyDTO {
	
	private int tl_repl_seq;
	private int tl_board_seq;
	private String tl_repl_writer;
	private String tl_repl_contents;
	private Date tl_repl_time;
	
	public Tl_ReplyDTO() {
		super();
	}

	public Tl_ReplyDTO(int tl_repl_seq, int tl_board_seq, String tl_repl_writer, String tl_repl_contents,
			Date tl_repl_time) {
		super();
		this.tl_repl_seq = tl_repl_seq;
		this.tl_board_seq = tl_board_seq;
		this.tl_repl_writer = tl_repl_writer;
		this.tl_repl_contents = tl_repl_contents;
		this.tl_repl_time = tl_repl_time;
	}

	public int getTl_repl_seq() {
		return tl_repl_seq;
	}

	public void setTl_repl_seq(int tl_repl_seq) {
		this.tl_repl_seq = tl_repl_seq;
	}

	public int getTl_board_seq() {
		return tl_board_seq;
	}

	public void setTl_board_seq(int tl_board_seq) {
		this.tl_board_seq = tl_board_seq;
	}

	public String getTl_repl_writer() {
		return tl_repl_writer;
	}

	public void setTl_repl_writer(String tl_repl_writer) {
		this.tl_repl_writer = tl_repl_writer;
	}

	public String getTl_repl_contents() {
		return tl_repl_contents;
	}

	public void setTl_repl_contents(String tl_repl_contents) {
		this.tl_repl_contents = tl_repl_contents;
	}

	public Date getTl_repl_time() {
		return tl_repl_time;
	}

	public void setTl_repl_time(Date tl_repl_time) {
		this.tl_repl_time = tl_repl_time;
	}
	
	
}
