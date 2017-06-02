package com.kosta.k153p2.admin.dto;

public class PutInfo {
	
	private int put_no;
	private int store_no;
	private int	item_no; 
	private int put_amount;
	private int put_price;
	private String put_date;
	private String put_expiration; 
	
	  public PutInfo(){
		  
	  }

	public PutInfo(int put_no, int store_no, int item_no, int put_amount, int put_price, String put_date,
			String put_expiration) {
		
		this.put_no = put_no;
		this.store_no = store_no;
		this.item_no = item_no;
		this.put_amount = put_amount;
		this.put_price = put_price;
		this.put_date = put_date;
		this.put_expiration = put_expiration;
	}

	public int getPut_no() {
		return put_no;
	}

	public void setPut_no(int put_no) {
		this.put_no = put_no;
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

	public int getPut_amount() {
		return put_amount;
	}

	public void setPut_amount(int put_amount) {
		this.put_amount = put_amount;
	}

	public int getPut_price() {
		return put_price;
	}

	public void setPut_price(int put_price) {
		this.put_price = put_price;
	}

	public String getPut_date() {
		return put_date;
	}

	public void setPut_date(String put_date) {
		this.put_date = put_date;
	}

	public String getPut_expiration() {
		return put_expiration;
	}

	public void setPut_expiration(String put_expiration) {
		this.put_expiration = put_expiration;
	}
	
	
           
}