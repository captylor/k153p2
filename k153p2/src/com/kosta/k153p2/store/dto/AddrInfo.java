package com.kosta.k153p2.store.dto;

public class AddrInfo {
	private int ds_id;
	private String ds_sido;
	private String ds_gugun;
	private String ds_dong;
	private String store_addr2;
	private String store_name;
	private String store_tel;
	private int store_no;
	
	
	public AddrInfo() {
	
	}

	public AddrInfo(int ds_id, String ds_sido, String ds_gugun, String ds_dong, String store_addr2) {
		this.ds_id = ds_id;
		this.ds_sido = ds_sido;
		this.ds_gugun = ds_gugun;
		this.ds_dong = ds_dong;
		this.store_addr2 = store_addr2;
	}

	public AddrInfo(int ds_id, String ds_sido, String ds_gugun, String ds_dong, String store_addr2, String store_name,
			String store_tel, int store_no) {
		super();
		this.ds_id = ds_id;
		this.ds_sido = ds_sido;
		this.ds_gugun = ds_gugun;
		this.ds_dong = ds_dong;
		this.store_addr2 = store_addr2;
		this.store_name = store_name;
		this.store_tel = store_tel;
		this.store_no = store_no;
	}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_tel() {
		return store_tel;
	}

	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
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
