package com.kosta.k153p2.store.dao;

public class Store_product_test {//16진수 문자열 변환 테스트
	public Store_product_test(){
		//String str16 = "ed5d96a0fc2a84a81aa25e2725b21732b7f35d5696933294c2e87f7dfaec5776";
		String str16 = "ed5d96a0fc2a84a8";//16자리 16진수
		
		//16진수 문자열 2진수 문자열로 변환
		for(int i=0; i<str16.length(); i++){//0~15번지
			String str = str16.substring(i, i+1);//문자열 하나 하나 뽑기
			//System.out.println((i+1)+"번째 문자"+str);
			
		}
	}//생성자
	
	public static void main(String[] args) {
		new Store_product_test();
	}
}
