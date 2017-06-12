package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.dto.ItemInfo;
import com.kosta.k153p2.dto.OrderInfo;

import iba.conf.MySqlMapClient;

public class OrderInfoDao {
	SqlMapClient sqlMap;
	
	
	public OrderInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	public String getHex(String member_id){		//������ ���� 16���� ������!!
		String hex="";
		try {
			hex = (String) sqlMap.queryForObject("order.gethex", member_id);//���������� 16���� ��� sql
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
	
	public List<ItemInfo> select_product(String member_id){//16���� product�� �Է� �޾� �Ǹ��ϴ� ��ǰ�� list�� ���
		String hex = getHex(member_id);
		String bin = toBin(hex);//16�������ڿ� -> 2�������ڿ�
		List<Integer> sell_no = toSell_no(bin);//2�������ڿ� -> �Ǹ��ϴ� ��ǰno List
		List<ItemInfo> sell_item = new ArrayList<>();
		Map map = new HashMap<>();
		map.put("item_noList", sell_no);
		
		try {
			return sell_item = (List<ItemInfo>)sqlMap.queryForList("order.selectProduct", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}//select_product()
	
	public List<Integer> toSell_no(String bin){//toBin�� ���� �޾� �Ǹ���ǰ ����
		List<Integer> sell_no = new ArrayList<>(); 
		for(int i=0; i<bin.length(); i++){
			if(bin.substring(i, i+1).equals("1")){//2���� ���ڿ� �ϳ��� ���� 1�̶�� ��ǰ �Ǹ�
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
	
	public void insertOrder(String item_no, String order_amount, String member_id){
		Map<String, String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("item_no", item_no);
		map.put("order_amount", order_amount);
		
		try {
			sqlMap.insert("order.insertOrder", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<OrderInfo> selectAll(Map<String, String> map){
		List<OrderInfo> list = null;
		try {
			list = sqlMap.queryForList("order.selectAll", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean stockUpdate(OrderInfo order){		// ��ǰ��û�� ���� �������
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
