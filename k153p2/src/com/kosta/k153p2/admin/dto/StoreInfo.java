package com.kosta.k153p2.admin.dto;

public class StoreInfo {

	private int store_no;
	private String store_name;
	private String store_addr;
	private String store_addr2;
	private String store_tel;
	private String store_product;
	private String store_openday;
	private String store_photo;
	private String store_owner;

	public StoreInfo() {

	}

	public StoreInfo(String store_name, String store_addr2, String store_tel, String store_product) {
		this.store_name = store_name;
		this.store_addr2 = store_addr2;
		this.store_tel = store_tel;
		this.store_product = store_product;
	}

	public StoreInfo(int store_no, String store_name, String store_addr2, String store_tel, String store_product,
			String store_openday, String store_photo) {

		this.store_no = store_no;
		this.store_name = store_name;
		this.store_addr2 = store_addr2;
		this.store_tel = store_tel;
		this.store_product = store_product;
		this.store_openday = store_openday;
		this.store_photo = store_photo;
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

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getStore_tel() {
		return store_tel;
	}

	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}

	public String getStore_product() {
		return store_product;
	}

	public void setStore_product(String store_product) {
		this.store_product = store_product;
	}

	public String getStore_openday() {
		return store_openday;
	}

	public void setStore_openday(String store_openday) {
		this.store_openday = store_openday;
	}

	public String getStore_photo() {
		return store_photo;
	}

	public void setStore_photo(String store_photo) {
		this.store_photo = store_photo;
	}

	public String getStore_owner() {
		return store_owner;
	}

	public void setStore_owner(String store_owner) {
		this.store_owner = store_owner;
	}

	public String getStore_addr2() {
		return store_addr2;
	}

	public void setStore_addr2(String store_addr2) {
		this.store_addr2 = store_addr2;
	}

}
