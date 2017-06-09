package com.kosta.k153p2.init2.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.init2.dto.Order;

import iba.conf.MySqlMapClient;

public class OrderDAO {
	SqlMapClient sqlMap;
	
	
	public OrderDAO() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	public String getHex(String store_name){		//������ ���� 16���� ������!!
		String hex="";
		try {
			hex = (String) sqlMap.queryForObject("order.gethex",store_name);//���������� 16���� ��� sql
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hex;
	}
	
	public String toBin(String hex){//hex(16���� ���ڿ�)�� �Է¹޾� bin(2���� ���ڿ�)�� ��ȯ  
		//16���� 2����
		String[] hex2bin = {"0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"};
		
		String bin = "";//��ȯ�� ������ ���ڿ�1
		//�Է� ���� 16���� ���ڿ��� �ϳ��� �˻� 4�ڸ� �������� ��ȯ�Ѵ�
		for(int i=0; i<hex.length(); i++){
			String hex_sub = hex.substring(i, i+1);//16���� ���� �ϳ��� ��´�
			int hex_int = Integer.parseInt(hex_sub, 16);//16���� ���ڿ��� 0~15�� int�� ��ȯ
			bin += hex2bin[hex_int];//������ ������ �迭�� int���� 16������ �ε����� �־� ���ڿ� ��ȯ ����
		}//for
		return bin;
	}//toBin()
	
	public List<String> select_product(String hex){//16���� product�� �Է� �޾� �Ǹ��ϴ� ��ǰ�� list�� ���
		String bin = toBin(hex);//16�������ڿ� -> 2�������ڿ�
		List<Integer> sell_no = toSell_no(bin);//2�������ڿ� -> �Ǹ��ϴ� ��ǰno List
		List<String> sell = new ArrayList<>();//�Ǹ� ��ǰ list 
		try {
			for(int i=0; i<sell_no.size(); i++){
				//sell.add((ProductInfo)sqlMap.queryForObject("store.selectProduct", Integer.parseInt(sell_no.substring(i, i+1))));
				sell.add((String)sqlMap.queryForObject("order.selectProduct", sell_no.get(i)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sell;
	}//select_product()
	
	public List<Integer> toSell_no(String bin){//toBin�� ���� �޾� �Ǹ���ǰ ����
		//String sell_no="";0
		List<Integer> sell_no = new ArrayList<>(); 
		for(int i=0; i<bin.length(); i++){
			if(bin.substring(i, i+1).equals("1")){//2���� ���ڿ� �ϳ��� ���� 1�̶�� ��ǰ �Ǹ�
				//sell_no += (i+1)+"";
				sell_no.add(i+1);
			}//if
		}//for
		return sell_no; 
	}
	
	
	public String toStore(String store_name){
		String store_no = "";
		try {
			store_no = (String) sqlMap.queryForObject("order.toStore",store_name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return store_no;
	}
	
	public boolean insertGuest(Order order){
		try {
			sqlMap.insert("order.insertGuest", order);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Order> selectAll(Map<String, String> map){
		List<Order> list = null;
		try {
			list = sqlMap.queryForList("order.selectAll",map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean stockUpdate(Order order){		// ��ǰ��û�� ���� �������
		int t1=0; //������� ��������
		int t2=0; //ó���� ���濩��
		try {
			t1 = sqlMap.update("order.stockUpdate",order);	//��ǰ ��� ����
			if(t1==1){
				t2 = sqlMap.update("order.stockSuccess",order);	// ��ó��--> ó���� ���κ���
				if(t2==1){
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
