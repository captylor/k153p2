package com.kosta.k153p2.product.dto;

public class ItemInfo {
	private int item_no; // 아이템번호
	private String item_name; // 아이템이름
	private int item_userPrice; // 아이템소비자가격
	private int item_masterPrice; // 지점장이 본사로부터 아이템을 사는 가격
	private int item_type; // 아이템의 타잎(카테고리)
	private String item_element;// 아이템을 구성하는 요소(재료):16진수문자열 
	//하지만 쓰지 않을 것임으로 생성자에서 제외 

	public ItemInfo() {
	}

	public ItemInfo(int item_no, String item_name, int item_userPrice, int item_masterPrice, int item_type) {
		super();
		this.item_no = item_no;
		this.item_name = item_name;
		this.item_userPrice = item_userPrice;
		this.item_masterPrice = item_masterPrice;
		this.item_type = item_type;
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

	public int getItem_type() {
		return item_type;
	}

	public void setItem_type(int item_type) {
		this.item_type = item_type;
	}

	public String getItem_element() {
		return item_element;
	}

	public void setItem_element(String item_element) {
		this.item_element = item_element;
	}

}
