package com.kosta.k153p2.addr.dto;

public class AddrDto {
	private String id;
	private String name;
	private String hiredate;

	public AddrDto() {
	}

	public AddrDto(String id, String name, String hiredate) {
		super();
		this.id = id;
		this.name = name;
		this.hiredate = hiredate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

}
