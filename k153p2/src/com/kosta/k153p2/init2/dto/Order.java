package com.kosta.k153p2.init2.dto;

import java.sql.Date;

public class Order {
	private String store_name;		//������
	private int order_no;			//�ֹ���ȣ
	private int store_no;			//������ȣ
	private int item_no;			//��ǰ��ȣ
	private int order_amount;		//���ַ�
	private Date order_date;		//�ֹ���
	private String order_handle;	//ó�����
	
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
	
	

	/*�̸�:		
	��ǰ��	������1������3������5    ������3������4
	��ǰ����	12 23 34	
	ó�����	ó���ȵ�*/
	
	
	
}
