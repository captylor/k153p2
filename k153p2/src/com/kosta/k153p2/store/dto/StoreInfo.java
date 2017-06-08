package com.kosta.k153p2.store.dto;

public class StoreInfo {
	private int store_no; //지점 번호 pk
	private String store_owner; // 지점소유자 아이디 not null
	private String store_name; // 지점명 not null
	private int store_addr; // 지점 주소 ds_zip테이블 참조
	private String store_addr2; //지점의 나머지 주소
	private String store_tel; // 전화번호
	private String store_product; // 판매하는 제품 not null 16진수 문자열
	private String store_openday; // 지점오픈 날자 (yyyy-mm-dd)
	private String store_photo; // 지점사진 경로
	private String store_admin; // 지점담당자 Admin의 id
	
	public StoreInfo() {
	}

	public StoreInfo(int store_no, String store_owner, String store_name, int store_addr, String store_addr2,
			String store_tel, String store_product, String store_openday, String store_photo, String store_admin) {
		this.store_no = store_no;
		this.store_owner = store_owner;
		this.store_name = store_name;
		this.store_addr = store_addr;
		this.store_addr2 = store_addr2;
		this.store_tel = store_tel;
		this.store_product = store_product;
		this.store_openday = store_openday;
		this.store_photo = store_photo;
		this.store_admin = store_admin;
	}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public String getStore_owner() {
		return store_owner;
	}

	public void setStore_owner(String store_owner) {
		this.store_owner = store_owner;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(int store_addr) {
		this.store_addr = store_addr;
	}

	public String getStore_addr2() {
		return store_addr2;
	}

	public void setStore_addr2(String store_addr2) {
		this.store_addr2 = store_addr2;
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

	public String getStore_admin() {
		return store_admin;
	}

	public void setStore_admin(String store_admin) {
		this.store_admin = store_admin;
	}
	
	
	
	

}
