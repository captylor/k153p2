package com.kosta.k153p2.dto;
/*
 --아이템번호, 아이템이름, 아이템소비자가격, 입고단가, 아이템의 타잎, 아이템을 구성하는 요소, 아이템사진
--item_no, item_name, item_userPrice, item_masterPrice, itemType_no, item_element, item_photo
--int, str, int, int, int, str, str
 */
public class ItemInfo {
	private int item_no;
	private String item_name;
	private int item_userPrice;
	private int item_masterPrice;
	private int itemType_no;
	private String item_element;
	private String item_photo;
	
	public ItemInfo() {
	}

	public ItemInfo(int item_no, String item_name, int item_userPrice, int item_masterPrice, int itemType_no,
			String item_element, String item_photo) {
		this.item_no = item_no;
		this.item_name = item_name;
		this.item_userPrice = item_userPrice;
		this.item_masterPrice = item_masterPrice;
		this.itemType_no = itemType_no;
		this.item_element = item_element;
		this.item_photo = item_photo;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getItem_userPrice() {
		return item_userPrice;
	}

	public void setItem_userPrice(int item_userPrice) {
		this.item_userPrice = item_userPrice;
	}

	public int getItem_masterPrice() {
		return item_masterPrice;
	}

	public void setItem_masterPrice(int item_masterPrice) {
		this.item_masterPrice = item_masterPrice;
	}

	public int getItemType_no() {
		return itemType_no;
	}

	public void setItemType_no(int itemType_no) {
		this.itemType_no = itemType_no;
	}

	public String getItem_element() {
		return item_element;
	}

	public void setItem_element(String item_element) {
		this.item_element = item_element;
	}

	public String getItem_photo() {
		return item_photo;
	}

	public void setItem_photo(String item_photo) {
		this.item_photo = item_photo;
	}
	
	
}
