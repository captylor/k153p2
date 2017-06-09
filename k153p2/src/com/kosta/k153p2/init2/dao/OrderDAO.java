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
	
	public String getHex(String store_name){		//지점명에 따른 16진수 얻어오기!!
		String hex="";
		try {
			hex = (String) sqlMap.queryForObject("order.gethex",store_name);//지점명으로 16진수 얻는 sql
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hex;
	}
	
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
	
	public List<String> select_product(String hex){//16진수 product를 입력 받아 판매하는 제품명 list를 출력
		String bin = toBin(hex);//16진수문자열 -> 2진수문자열
		List<Integer> sell_no = toSell_no(bin);//2진수문자열 -> 판매하는 재품no List
		List<String> sell = new ArrayList<>();//판매 제품 list 
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
	
	public List<Integer> toSell_no(String bin){//toBin한 값을 받아 판매재품 구분
		//String sell_no="";0
		List<Integer> sell_no = new ArrayList<>(); 
		for(int i=0; i<bin.length(); i++){
			if(bin.substring(i, i+1).equals("1")){//2진수 문자열 하나의 값이 1이라면 제품 판매
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
	
	public boolean stockUpdate(Order order){		// 제품신청에 따른 재고증가
		int t1=0; //재고증가 성공여부
		int t2=0; //처리됨 변경여부
		try {
			t1 = sqlMap.update("order.stockUpdate",order);	//제품 재고 증가
			if(t1==1){
				t2 = sqlMap.update("order.stockSuccess",order);	// 미처리--> 처리됨 으로변경
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
