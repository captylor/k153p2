package com.kosta.k153p2.init2.dto;

public class Order {
	private String store_name;		//������
	private int store_no;		//������ȣ
	private int item_no;			//��ǰ��ȣ
	private int order_amount;	//���ַ�
	
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

	


	
	
	

	
	/*�̸�:		
	��ǰ��	������1������3������5    ������3������4
	��ǰ����	12 23 34	
	ó�����	ó���ȵ�*/
	
	
	
}
