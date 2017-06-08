package com.kosta.k153p2.store.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class Store_hex_bin {
	
	public Store_hex_bin() {
		
	}//생성자
	
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
	
	public String toHex(String bin){//bin(2진수 문자열)를 입력받아 hex(16진수 문자열)로 변환
		//변환할 16진수
		String[] bin16hex = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" }; 
		
		String hex = "";//리턴할 16진수 문자열
		//입력받은 2진수를 4자리로 해서 서브스트링 해 0~15의 int로 변환
		for(int i=0; i<bin.length(); i=i+4){
			String bin_sub = bin.substring(i, i+4);//이진수를 4자리로 나눔
			int index = Integer.parseInt(bin_sub, 2);//0~15숫자로 변환
			hex += bin16hex[index];//index값을 이용하여 16진수 대입
		}//for
		return hex;
	}//toHex()
	
	
	public List<Integer> toSell(String bin){//toBin한 값을 받아 판매재품 구분
		String sell="";
		List<Integer> sell_no = new ArrayList<>();
		//List<String> sell_no = null;
		for(int i=0; i<bin.length(); i++){
			if(bin.substring(i, i+1).equals("1")){//2진수 문자열 하나의 값이 1이라면 제품 판매
				//sell += (i+1)+"번판매 ";
				sell_no.add(i+1);
			}//if
		}//for
		//return sell_no; 
		return sell_no; 
	}//toProduct()
	
	//제품명을 입력받아 DB에서 검색후 아이템번호(String 없을때의 값을 null로)의 값을 얻어오는것
	public String selectProduct(String item_name){
		String item_index = null;//초기값, 일치하는 아이템이 없음
		/*
		 * String item_name값을 이용해서 iteminfo테이블에서 검색
		 * select item_no from iteminfo where item_name = #item_name#
		 * item_no가 몇번째인지 알수 있음 그걸 통해서 storeinfo에 있는 데이터를 검색해 2진수로 변환 후 비교 한다 
		 */
		
		return item_index;
	}//selectProduct()
	
	
	public static void main(String[] args) {
		/*Store_hex_bin hexBin = new Store_hex_bin();
		String hex = "ed5d96a0fc2a84a81aa25e2725b21732b7f35d5696933294c2e87f7dfaec5776";
		String toBin = hexBin.toBin(hex);
		List<Integer> toSell = hexBin.toSell(toBin);
		//String toSell = hexBin.toSell(toBin);
		String toHex = hexBin.toHex(toBin);
		System.out.println("변환할 16진수: "+hex);
		System.out.println("=========>: "+toBin);
		System.out.println("변환할 2진수  : "+toBin);
		System.out.println("========> : "+toHex);
		for(int i=0; i<toSell.size(); i++){
			System.out.println("판매 인덱스: "+toSell.get(i));
		}
		System.out.println("판매 인덱스: "+toSell);*/
		
		//System.out.println("2진수 String: "+toBin);
		//System.out.println("판매제품: "+toSell);
		
	}
}//Store_hex_bin()
