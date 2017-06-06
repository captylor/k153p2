package com.kosta.k153p2.order.dto;

public class Order {
	private String store_name;		//지점명
	private int item_no;			//제품명
	private int order_amount;		//제품수량(발주량)
	
	public Order() {
	}

	
	
	public Order(String store_name, int item_no, int order_amount) {
		this.store_name = store_name;
		this.item_no = item_no;
		this.order_amount = order_amount;
	}



	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	
	
}
