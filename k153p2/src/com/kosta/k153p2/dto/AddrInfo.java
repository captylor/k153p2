package com.kosta.k153p2.dto;

public class AddrInfo {
	private int ds_id;
	private String ds_sido;
	private String ds_gugun;
	private String ds_dong;
	private String store_addr2;
	
	public AddrInfo() {
	
	}

	public AddrInfo(int ds_id, String ds_sido, String ds_gugun, String ds_dong, String store_addr2) {
		this.ds_id = ds_id;
		this.ds_sido = ds_sido;
		this.ds_gugun = ds_gugun;
		this.ds_dong = ds_dong;
		this.store_addr2 = store_addr2;
	}

	public int getDs_id() {
		return ds_id;
	}

	public void setDs_id(int ds_id) {
		this.ds_id = ds_id;
	}

	public String getDs_sido() {
		return ds_sido;
	}

	public void setDs_sido(String ds_sido) {
		this.ds_sido = ds_sido;
	}

	public String getDs_gugun() {
		return ds_gugun;
	}

	public void setDs_gugun(String ds_gugun) {
		this.ds_gugun = ds_gugun;
	}

	public String getDs_dong() {
		return ds_dong;
	}

	public void setDs_dong(String ds_dong) {
		this.ds_dong = ds_dong;
	}

	public String getStore_addr2() {
		return store_addr2;
	}

	public void setStore_addr2(String store_addr2) {
		this.store_addr2 = store_addr2;
	}
	
	
	
	

	
}
