package com.kosta.k153p2.login.dto;

public class MemberInfo {
	
	private String member_id;
	private String member_pass;
	private String member_name;
	private String member_email;
	private String member_grade;
	private String member_icon;
	
	public MemberInfo() {
	}

	public MemberInfo(String member_id, String member_pass, String member_name, String member_email) {
		this.member_id = member_id;
		this.member_pass = member_pass;
		this.member_name = member_name;
		this.member_email = member_email;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pass() {
		return member_pass;
	}

	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}

	public String getMember_icon() {
		return member_icon;
	}

	public void setMember_icon(String member_icon) {
		this.member_icon = member_icon;
	}
	
}
