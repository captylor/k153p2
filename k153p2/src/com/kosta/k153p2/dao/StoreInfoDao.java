package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.dto.ProductInfo;
import com.kosta.k153p2.dto.StoreInfo;

import iba.conf.MySqlMapClient;

public class StoreInfoDao {
	SqlMapClient sqlMap;
	
	public StoreInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	//����¡!!!
	public int selectCount(){//���̺��� ��ü ���� ���
		int count=0;
		try {
			count = (Integer) sqlMap.queryForObject("store.count");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}//selectCount
	
	public List<StoreInfo> select_pageAll(int page, int recordCount){//������������ �ޱ�_����¡
		List<StoreInfo> list = null;
		int end = page * recordCount;//page*5
		int start = end - (recordCount-1);//end-4
		
		try {
			Map<String, Integer> map = new HashMap<>();
			  map.put("start", start);
			  map.put("end", end);
			  
			list = sqlMap.queryForList("store.selectPageAll", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list; 
	}//select_pageAll
	
	//����¡ ����!!
	public List<StoreInfo> select_all(){//�˻� all
		List<StoreInfo> list = null;
		
		try {
			list = sqlMap.queryForList("store.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}//select_all
	
	public List<StoreInfo> select_store(String location){//�˻� ����
		List<StoreInfo> list = null;
		
		try {
			list = sqlMap.queryForList("store.selectStore", location);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}//select_store
	
	public StoreInfo select_result(int store_no){//���� �� ���� ���
		StoreInfo info = null;
		
		try {
			info = (StoreInfo) sqlMap.queryForObject("store.selectResult", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return info;
	}
	
	public List<ProductInfo> select_product(String hex){//16���� product�� �Է� �޾� �Ǹ��ϴ� ��ǰ�� list�� ���
		String bin = toBin(hex);//16�������ڿ� -> 2�������ڿ�
		List<Integer> sell_no = toSell_no(bin);//2�������ڿ� -> �Ǹ��ϴ� ��ǰno List
		List<ProductInfo> sell = new ArrayList<>();//�Ǹ� ��ǰ list 
		try {
			for(int i=0; i<sell_no.size(); i++){
				sell.add((ProductInfo)sqlMap.queryForObject("store.selectProduct", sell_no.get(i)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sell;
	}//select_product()
	
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
	
	public List<Integer> toSell_no(String bin){//toBin�� ���� �޾� �Ǹ���ǰ ����
		//String sell_no="";0
		List<Integer> sell_no = new ArrayList<>(); 
		for(int i=0; i<bin.length(); i++){
			if(bin.substring(i, i+1).equals("1")){//2���� ���ڿ� �ϳ��� ���� 1�̶�� ��ǰ �Ǹ�
				//sell_no += (i+1)+"";
				sell_no.add(i+1);
			}//if
		}//for
		//System.out.println("�Ǹ� ��ȣ? "+sell_no);
		return sell_no; 
	}//toProduct()
	
	
	public List<StoreInfo> select_itemName(String itemType, String itemName){//�޴��˻��� ������ �������� ���
		List<StoreInfo> sellStoreList = new ArrayList<>();//�Ǹ��ϴ� ������ ���� list
		List<StoreInfo> storeList = new ArrayList<>();//������ü ���� list
		List<Integer> storeIndex = new ArrayList<>();//�Ǹ��ϴ� ������ index(�ߺ� ���)
		
		try { 
			String itemTypeNo = (String)sqlMap.queryForObject("store.selectTypeNo", itemType);//������Ÿ���� �޾� ������Ÿ�Գѹ��� ����
			
			//������Ÿ��no�� �������̸����� �˻� ������ ��ȣ list�� ����
			Map<String, String> itemMap = new HashMap<>();
			itemName = "%"+itemName+"%";
			itemMap.put("typeNo", itemTypeNo);
			itemMap.put("name", itemName);
			//������noList�� ����
			List<Integer> itemNoList = sqlMap.queryForList("store.selectItemNo", itemMap);
			
			//�������� 16������ 2������ �ٲپ� ������noList���� ��ġ�ϴ� index�� 1�̸� ���� ����
			storeList = sqlMap.queryForList("store.selectAll");//��� ������ ����
			for(int i=0; i<storeList.size(); i++){//�������� ������ŭ ����
				String hex = storeList.get(i).getStore_product();//������ �Ǹ���ǰ hex��������
				String bin = toBin(hex);//hex���� bin���� ���� ex)01011100110...
				//System.out.println("bin"+i+": "+bin);
				//System.out.println("100��° bin"+i+": "+bin.substring(99));
					for(int j=0; j<bin.length(); j++){//bin���̸�ŭ ��ȸ
						if(bin.substring(j, j+1).equals("1")){//2���� ���� 1�̸� 
							for(int z=0; z<itemNoList.size(); z++){//�����۹�ȣlist��ŭ ��ȸ
								if(itemNoList.get(z) == (j+1)){//bin�� 1�ǰ������� index+1(�����۹�ȣ)�� ������nolist�� �ִ� ���� ��ġ�Ѵٸ�
									storeIndex.add(i);
									//sellStoreList.add(storeList.get(i));//�� ���� ������ �����Ѵ�
									//System.out.println("bin�� �ε���: "+(j+1));
									//System.out.println("itemNoList: "+itemNoList.get(z));
									//System.out.println("�׶��� ���� index: "+i);
								}//if_z
							}//for_z
						}//if_j
					}//for_j
			}//for_i
			//storeIndex ����Ʈ�� �ߺ����� ���� �Ǿ� �ִٸ� �� �ߺ����� ����
			List<Integer> sellStoreIndex = new ArrayList<>(new HashSet<Integer>(storeIndex));
			for(int i=0; i<sellStoreIndex.size(); i++){//���������� �ִ�  indexlist�� ũ�⸸ŭ ��ȸ
				sellStoreList.add(storeList.get(sellStoreIndex.get(i)));//�Ǹ��ϴ� ���� list�� �ǸŸ���index�� �־ ����  				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sellStoreList;
	}//select_itemName()
}//class 













