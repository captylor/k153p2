package com.kosta.k153p2.init2.dto;

public class Order {
	private String store_name;		//지점명
	private int store_no;		//지점번호
	private int item_no;			//제품번호
	private int order_amount;	//발주량
	
	public Order() {
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
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

	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}

	


	
	
	

	
	/*이름:		
	제품명	아이템1아이템3아이템5    아이템3아이템4
	제품수량	12 23 34	
	처리결과	처리안됨*/
	
	
	
}
