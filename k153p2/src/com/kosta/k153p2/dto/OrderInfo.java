package com.kosta.k153p2.dto;

import java.util.Date;

public class OrderInfo {
	private int order_no;
	private int store_no;
	private int item_no;
	private int order_amount;
	private Date order_date;
	private String order_handle;
	
	public OrderInfo() {
	}

	public OrderInfo(int order_no, int store_no, int item_no, int order_amount, Date order_date, String order_handle) {
		this.order_no = order_no;
		this.store_no = store_no;
		this.item_no = item_no;
		this.order_amount = order_amount;
		this.order_date = order_date;
		this.order_handle = order_handle;
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
	
	
}
