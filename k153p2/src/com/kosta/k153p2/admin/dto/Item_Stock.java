package com.kosta.k153p2.admin.dto;

public class Item_Stock {
	private int store_no;
	private int item_no;
	private int stock_amount;
	private String item_name;

	public Item_Stock() {
	}

	public Item_Stock(int item_no, int stock_amount, String item_name) {
		this.item_no = item_no;
		this.stock_amount = stock_amount;
		this.item_name = item_name;
	}

	public Item_Stock(int store_no, int item_no, int stock_amount, String item_name) {
		this.store_no = store_no;
		this.item_no = item_no;
		this.stock_amount = stock_amount;
		this.item_name = item_name;
	}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getStock_amount() {
		return stock_amount;
	}

	public void setStock_amount(int stock_amount) {
		this.stock_amount = stock_amount;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
}
