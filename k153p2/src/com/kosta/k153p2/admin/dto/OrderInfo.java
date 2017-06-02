package com.kosta.k153p2.admin.dto;

import java.sql.Date;

public class OrderInfo {
	
	private int order_no; 
	private int pstore_no; 
	private int item_no;
	private int order_amount;
	private Date order_date;

	 public OrderInfo(){
		 
	 }

	public OrderInfo(int order_no, int pstore_no, int item_no, int order_amount, Date order_date) {
		super();
		this.order_no = order_no;
		this.pstore_no = pstore_no;
		this.item_no = item_no;
		this.order_amount = order_amount;
		this.order_date = order_date;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getPstore_no() {
		return pstore_no;
	}

	public void setPstore_no(int pstore_no) {
		this.pstore_no = pstore_no;
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
   
	
	
	 
}
