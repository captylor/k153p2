package com.kosta.k153p2.init2.dto;

import java.sql.Date;

public class Order {
	private String store_name;		//지점명
	private int order_no;			//주문번호
	private int store_no;			//지점번호
	private int item_no;			//제품번호
	private int order_amount;		//발주량
	private Date order_date;		//주문일
	private String order_handle;	//처리결과
	
	public Order() {
	}
	
	public Order(String store_name, int order_no, int store_no, int item_no, int order_amount, Date order_date,
			String order_handle) {
		this.store_name = store_name;
		this.order_no = order_no;
		this.store_no = store_no;
		this.item_no = item_no;
		this.order_amount = order_amount;
		this.order_date = order_date;
		this.order_handle = order_handle;
	}
	
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_handle() {
		return order_handle;
	}
	public void setOrder_handle(String order_handle) {
		this.order_handle = order_handle;
	}
	
	

	/*이름:		
	제품명	아이템1아이템3아이템5    아이템3아이템4
	제품수량	12 23 34	
	처리결과	처리안됨*/
	
	
	
}
