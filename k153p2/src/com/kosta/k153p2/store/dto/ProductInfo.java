package com.kosta.k153p2.store.dto;

public class ProductInfo {
	private String item_name;
	private String item_photo;

	public ProductInfo() {

	}

	public ProductInfo(String item_name, String item_photo) {
		this.item_name = item_name;
		this.item_photo = item_photo;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_photo() {
		return item_photo;
	}

	public void setItem_photo(String item_photo) {
		this.item_photo = item_photo;
	}

}
