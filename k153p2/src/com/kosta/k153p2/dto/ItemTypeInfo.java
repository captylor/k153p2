package com.kosta.k153p2.dto;

public class ItemTypeInfo {
	private int itemType_no;
	private String itemType;
	
	public ItemTypeInfo() {
	}

	public ItemTypeInfo(int itemType_no, String itemType) {
		this.itemType_no = itemType_no;
		this.itemType = itemType;
	}

	public int getItemType_no() {
		return itemType_no;
	}

	public void setItemType_no(int itemType_no) {
		this.itemType_no = itemType_no;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	
	
}
