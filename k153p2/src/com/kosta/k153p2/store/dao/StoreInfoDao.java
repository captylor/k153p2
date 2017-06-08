package com.kosta.k153p2.store.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.kosta.k153p2.dto.ProductInfo;
import com.kosta.k153p2.dto.StoreInfo;

import iba.conf.MySqlMapClient;

public class StoreInfoDao {
	SqlMapClient sqlMap;
	
	public StoreInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	public List<StoreInfo> select_all(){//검색 all
		List<StoreInfo> list = null;
		
		try {
			list = sqlMap.queryForList("store.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}//select_all
	
	public List<StoreInfo> select_store(String location){//검색 지역
		List<StoreInfo> list = null;
		
		try {
			list = sqlMap.queryForList("store.selectStore", location);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}//select_store
	
	public StoreInfo select_result(int store_no){//매장 상세 정보 출력
		StoreInfo info = null;
		
		try {
			info = (StoreInfo) sqlMap.queryForObject("store.selectResult", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return info;
	}
	
	public List<ProductInfo> select_product(String hex){//16진수 product를 입력 받아 판매하는 제품명 list를 출력
		String bin = toBin(hex);//16진수문자열 -> 2진수문자열
		List<Integer> sell_no = toSell_no(bin);//2진수문자열 -> 판매하는 재품no List
		List<ProductInfo> sell = new ArrayList<>();//판매 제품 list 
		try {
			for(int i=0; i<sell_no.size(); i++){
				sell.add((ProductInfo)sqlMap.queryForObject("store.selectProduct", sell_no.get(i)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sell;
	}//select_product()
	
	public String toBin(String hex){//hex(16진수 문자열)를 입력받아 bin(2진수 문자열)로 변환  
		//16가지 2진수
		String[] hex2bin = {"0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"};
	
		String bin = "";//반환할 이진수 문자열1
		//입력 받은 16진수 문자열을 하나씩 검사 4자리 이진수로 반환한다
		for(int i=0; i<hex.length(); i++){
			String hex_sub = hex.substring(i, i+1);//16진수 문자 하나를 담는다
			int hex_int = Integer.parseInt(hex_sub, 16);//16진수 문자열을 0~15의 int로 변환
			bin += hex2bin[hex_int];//지정한 이진수 배열에 int형식 16진수를 인덱스로 넣어 문자열 반환 저장
		}//for
		return bin;
	}//toBin()
	
	public List<Integer> toSell_no(String bin){//toBin한 값을 받아 판매재품 구분
		//String sell_no="";0
		List<Integer> sell_no = new ArrayList<>(); 
		for(int i=0; i<bin.length(); i++){
			if(bin.substring(i, i+1).equals("1")){//2진수 문자열 하나의 값이 1이라면 제품 판매
				//sell_no += (i+1)+"";
				sell_no.add(i+1);
			}//if
		}//for
		System.out.println("판매 번호? "+sell_no);
		return sell_no; 
	}//toProduct()
	
	
	public List<StoreInfo> select_itemName(String itemType, String itemName){//메뉴검색을 했을때 매장정보 출력
		List<StoreInfo> sellStoreList = new ArrayList<>();//판매하는 매장의 정보 list
		List<StoreInfo> storeList = new ArrayList<>();//매장전체 정보 list
		List<Integer> storeIndex = new ArrayList<>();//판매하는 매장의 index(중복 허락)
		
		try { 
			String itemTypeNo = (String)sqlMap.queryForObject("store.selectTypeNo", itemType);//아이템타입을 받아 아이템타입넘버를 리턴
			
			//아이템타입no와 아이템이름으로 검색 아이템 번호 list를 리턴
			Map<String, String> itemMap = new HashMap<>();
			itemName = "%"+itemName+"%";
			itemMap.put("typeNo", itemTypeNo);
			itemMap.put("name", itemName);
			//아이템noList를 리턴
			List<Integer> itemNoList = sqlMap.queryForList("store.selectItemNo", itemMap);
			
			//모든매장의 16진수를 2진수로 바꾸어 아이템noList값과 일치하는 index가 1이면 정보 저장
			storeList = sqlMap.queryForList("store.selectAll");//모든 매장의 정보
			for(int i=0; i<storeList.size(); i++){//모든매장의 갯수만큼 돈다
				String hex = storeList.get(i).getStore_product();//매장의 판매제품 hex값얻어오기
				String bin = toBin(hex);//hex값을 bin으로 변경 ex)01011100110...
				//System.out.println("bin"+i+": "+bin);
				//System.out.println("100번째 bin"+i+": "+bin.substring(99));
					for(int j=0; j<bin.length(); j++){//bin길이만큼 순회
						if(bin.substring(j, j+1).equals("1")){//2진수 값이 1이면 
							for(int z=0; z<itemNoList.size(); z++){//아이템번호list만큼 순회
								if(itemNoList.get(z) == (j+1)){//bin의 1의값을가진 index+1(아이템번호)가 아이템nolist에 있는 값과 일치한다면
									storeIndex.add(i);
									//sellStoreList.add(storeList.get(i));//그 매장 정보를 저장한다
									//System.out.println("bin의 인덱스: "+(j+1));
									//System.out.println("itemNoList: "+itemNoList.get(z));
									//System.out.println("그때의 매장 index: "+i);
								}//if_z
							}//for_z
						}//if_j
					}//for_j
			}//for_i
			//storeIndex 리스트에 중복값이 저장 되어 있다면 그 중복값을 제거
			List<Integer> sellStoreIndex = new ArrayList<>(new HashSet<Integer>(storeIndex));
			for(int i=0; i<sellStoreIndex.size(); i++){//매장정보가 있는  indexlist의 크기만큼 순회
				sellStoreList.add(storeList.get(sellStoreIndex.get(i)));//판매하는 매장 list에 판매매장index를 넣어서 저장  				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sellStoreList;
	}//select_itemName()
}//class 













