package com.kosta.k153p2.dto;

import java.util.Date;

public class ReplyInfo {
	private int board_no;
	private String reply_id;
	private Date reply_date;
	private String reply_text;
	private int reply_dislike;
	
	public ReplyInfo() {
	}

	public ReplyInfo(int board_no, String reply_id, Date reply_date, String reply_text, int reply_dislike) {
		this.board_no = board_no;
		this.reply_id = reply_id;
		this.reply_date = reply_date;
		this.reply_text = reply_text;
		this.reply_dislike = reply_dislike;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getReply_id() {
		return reply_id;
	}

	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public String getReply_text() {
		return reply_text;
	}

	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}

	public int getReply_dislike() {
		return reply_dislike;
	}

	public void setReply_dislike(int reply_dislike) {
		this.reply_dislike = reply_dislike;
	}
	
	
	
	
}
